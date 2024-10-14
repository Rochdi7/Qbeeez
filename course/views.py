from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.db.models import Sum, Avg, Max, Min, Count
from django.contrib.auth.decorators import login_required
from django.views.generic import CreateView
from django.core.paginator import Paginator
from django.conf import settings
from django.utils.decorators import method_decorator
from django.views.generic import ListView
from django_filters.views import FilterView

from accounts.models import User, Student
from core.models import Session, Semester
from result.models import TakenCourse
from accounts.decorators import lecturer_required, student_required
from .forms import (
    ProgramForm,
    CourseAddForm,
    CourseAllocationForm,
    EditCourseAllocationForm,
    UploadFormFile,
    UploadFormVideo,
)
from .filters import ProgramFilter, CourseAllocationFilter
from .models import Program, Course, CourseAllocation, Upload, UploadVideo

from payments.models import Facture, SalesPointFacture  # Ensure correct models are imported
from course.models import Program
from django_filters.views import FilterView
from django.views.generic import ListView

class ProgramFilterView(FilterView):
    model = Program
    template_name = "course/program_list.html"
    context_object_name = "programs"
    filterset_class = ProgramFilter

    def get_active_abonnements(self):
        # Count active abonnements based on 'paid' status in Facture and SalesPointFacture tables
        user_id = self.request.user.id
        facture_count = Facture.objects.filter(user_id=user_id, status='paid').count()
        salespoint_count = SalesPointFacture.objects.filter(user_id=user_id, status='paid').count()
        return facture_count + salespoint_count

    def get_active_programs(self):
        user_id = self.request.user.id
    
    # Get active factures and salespoint factures
        active_factures = Facture.objects.filter(user_id=user_id, status='paid').values_list('program_id', flat=True)
        active_salespoints = SalesPointFacture.objects.filter(user_id=user_id, status='paid').values_list('program_id', flat=True)
    
    # Combine the program IDs from both factures and salespoint_factures
        all_program_ids = list(active_factures) + list(active_salespoints)
    
    # Return distinct programs using the combined list of IDs
        return Program.objects.filter(id__in=all_program_ids).distinct()


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = "Programs"
        context["active_abonnements_count"] = self.get_active_abonnements()
        context["active_programs"] = self.get_active_programs()
        return context



@login_required
@lecturer_required
def program_add(request):
    if request.method == "POST":
        form = ProgramForm(request.POST, request.FILES)  # Include request.FILES for image uploads
        if form.is_valid():
            program = form.save()  # Save the form to create the program instance
            messages.success(request, f"{program.title} program has been created.")
            return redirect("programs")
        else:
            messages.error(request, "Correct the error(s) below.")
    else:
        form = ProgramForm()

    return render(
        request,
        "course/program_add.html",
        {
            "title": "Add Program",
            "form": form,
        },
    )


def program_detail(request, pk):
    program = Program.objects.get(pk=pk)

    # Get the filter parameter
    course_type = request.GET.get('course_type')
    reset = request.GET.get('reset')  # Check for reset parameter

    # Start with all courses for the program
    courses = Course.objects.filter(program_id=pk)

    # Apply filter if not resetting
    if course_type and reset != 'true':
        courses = courses.filter(course_type=course_type)

    credits = Course.objects.aggregate(Sum("credit"))

    paginator = Paginator(courses, 10)
    page = request.GET.get("page")

    courses = paginator.get_page(page)

    return render(
        request,
        "course/program_single.html",
        {
            "title": program.title,
            "program": program,
            "courses": courses,
            "credits": credits,
            "course_type": course_type,  # Pass the current filter back to the template
        },
    )



@login_required
@lecturer_required
def program_edit(request, pk):
    program = Program.objects.get(pk=pk)

    if request.method == "POST":
        form = ProgramForm(request.POST, request.FILES, instance=program)  # Include request.FILES
        if form.is_valid():
            form.save()
            messages.success(
                request, str(request.POST.get("title")) + " program has been updated."
            )
            return redirect("programs")
    else:
        form = ProgramForm(instance=program)

    return render(
        request,
        "course/program_add.html",
        {"title": "Edit Program", "form": form},
    )



@login_required
@lecturer_required
def program_delete(request, pk):
    program = Program.objects.get(pk=pk)
    title = program.title
    program.delete()
    messages.success(request, "Program " + title + " has been deleted.")

    return redirect("programs")

from .models import Program
from payments.models import Facture, SalesPointFacture  # Import your models
from django.views.generic import ListView

@method_decorator(login_required, name="dispatch")
class StudentProgramListView(ListView):
    model = Program
    template_name = "course/program_list.html"
    context_object_name = "active_programs"

    def get_queryset(self):
        user_id = self.request.user.id
        
        # Get active subscriptions from both tables
        active_factures = Facture.objects.filter(user_id=user_id, status='paid')
        active_salespoints = SalesPointFacture.objects.filter(user_id=user_id, status='paid')

        # Extract programs associated with active payments
        programs_facture = active_factures.values_list('program_id', flat=True)
        programs_salespoint = active_salespoints.values_list('program_id', flat=True)

        # Combine and fetch distinct program IDs
        all_programs = set(programs_facture).union(set(programs_salespoint))
        
        # Fetch and return distinct Program objects
        return Program.objects.filter(id__in=all_programs).distinct()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = "Active Programs"

        # Count active abonnements from both tables
        user_id = self.request.user.id
        active_abonnements_count = (
            Facture.objects.filter(user_id=user_id, status='paid').count() +
            SalesPointFacture.objects.filter(user=user_id, status='paid').count()
        )

        context["active_abonnements_count"] = active_abonnements_count
        
        return context



# ########################################################


# ########################################################
# Course views
# ########################################################
@login_required
def course_single(request, slug):
    course = Course.objects.get(slug=slug)
    files = Upload.objects.filter(course__slug=slug)
    videos = UploadVideo.objects.filter(course__slug=slug)

    lecturers = CourseAllocation.objects.filter(courses__pk=course.id)

    for video in videos:
        # Extract video ID from the youtube_link
        if video.youtube_link:
            video.youtube_id = video.youtube_link.split('v=')[-1]  # Get the video ID
        else:
            video.youtube_id = None  # Or some default value if needed

    return render(
        request,
        "course/course_single.html",
        {
            "title": course.title,
            "course": course,
            "files": files,
            "videos": videos,
            "lecturers": lecturers,
            "media_url": settings.MEDIA_ROOT,
        },
    )

from .forms import Subcourse
from django.forms import modelformset_factory

# course/views.py

from django.shortcuts import render, redirect, get_object_or_404
from .forms import CourseAddForm
from .models import Subcourse, Course, Program


from django.contrib import messages  # Ensure this import is present
from django.shortcuts import get_object_or_404, redirect, render
from .forms import CourseAddForm
from .models import Program, Subcourse

def course_add(request, program_id):  # Ensure this matches the URL pattern
    program = get_object_or_404(Program, id=program_id)  # Get the program instance

    if request.method == 'POST':
        course_form = CourseAddForm(request.POST)

        if course_form.is_valid():
            course = course_form.save(commit=False)
            course.program = program  # Associate the course with the program
            course.save()  # Save the course instance

            # Get course name and code for the success message
            course_name = course.title  # Adjust according to your model fields
            course_code = course.code  # Adjust according to your model fields

            # Process subcourses
            subcourses_data = request.POST.getlist('subcourses[]')
            subcourse_titles = []  # List to hold subcourse titles
            for subcourse_data in subcourses_data:
                title, description = subcourse_data.split('|')
                subcourse = Subcourse(title=title, description=description, course=course)
                subcourse.save()  # Save each subcourse
                subcourse_titles.append(title)  # Add title to the list

            # Create the success message
            subcourse_list = ', '.join(subcourse_titles)  # Join titles for display
            messages.success(request, f"{course_name} ({course_code}) has been created with subcourses: {subcourse_list}.")
            
            # Redirect to the program detail page
            return redirect("program_detail", pk=program_id)  # Assuming 'program_detail' expects the program ID
        
    else:
        course_form = CourseAddForm()

    return render(request, 'course/course_add.html', {
        'course_form': course_form,
        'program': program,
    })



def subcourse_form(request):
    if request.method == 'POST':
        form = SubcourseForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Subcourse created successfully!')
            return redirect('success_url')  # Redirect to a success page
    else:
        form = SubcourseForm()
    
    context = {
        'form': form,
        'title': 'Create Subcourse',  # Title for the page
    }
    return render(request, 'your_template.html', context)

from django.shortcuts import render, redirect
from .forms import SubcourseForm
from django.contrib import messages
@login_required
@lecturer_required
def course_edit(request, slug):
    course = get_object_or_404(Course, slug=slug)
    if request.method == "POST":
        form = CourseAddForm(request.POST, instance=course)
        if form.is_valid():
            form.save()
            messages.success(request, "Course has been updated.")
            return redirect("program_detail", pk=course.program.id)
    else:
        form = CourseAddForm(instance=course)

    return render(request, "course/course_add.html", {
        "title": "Edit Course",
        "course_form": form,
    })


@login_required
@lecturer_required
def course_delete(request, slug):
    course = Course.objects.get(slug=slug)
    # course_name = course.title
    course.delete()
    messages.success(request, "Course " + course.title + " has been deleted.")

    return redirect("program_detail", pk=course.program.id)


# ########################################################


# ########################################################
# Course Allocation
# ########################################################
@method_decorator([login_required], name="dispatch")
class CourseAllocationFormView(CreateView):
    form_class = CourseAllocationForm
    template_name = "course/course_allocation_form.html"

    def get_form_kwargs(self):
        kwargs = super(CourseAllocationFormView, self).get_form_kwargs()
        kwargs["user"] = self.request.user
        return kwargs

    def form_valid(self, form):
        # if a staff has been allocated a course before update it else create new
        lecturer = form.cleaned_data["lecturer"]
        selected_courses = form.cleaned_data["courses"]
        courses = ()
        for course in selected_courses:
            courses += (course.pk,)
        # print(courses)

        try:
            a = CourseAllocation.objects.get(lecturer=lecturer)
        except:
            a = CourseAllocation.objects.create(lecturer=lecturer)
        for i in range(0, selected_courses.count()):
            a.courses.add(courses[i])
            a.save()
        return redirect("course_allocation_view")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = "Assign Course"
        return context


@method_decorator([login_required], name="dispatch")
class CourseAllocationFilterView(FilterView):
    filterset_class = CourseAllocationFilter
    template_name = "course/course_allocation_view.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = "Course Allocations"
        return context


@login_required
@lecturer_required
def edit_allocated_course(request, pk):
    allocated = get_object_or_404(CourseAllocation, pk=pk)
    if request.method == "POST":
        form = EditCourseAllocationForm(request.POST, instance=allocated)
        if form.is_valid():
            form.save()
            messages.success(request, "course assigned has been updated.")
            return redirect("course_allocation_view")
    else:
        form = EditCourseAllocationForm(instance=allocated)

    return render(
        request,
        "course/course_allocation_form.html",
        {"title": "Edit Course Allocated", "form": form, "allocated": pk},
    )


@login_required
@lecturer_required
def deallocate_course(request, pk):
    course = CourseAllocation.objects.get(pk=pk)
    course.delete()
    messages.success(request, "successfully deallocate!")
    return redirect("course_allocation_view")


# ########################################################


# ########################################################
# File Upload views
# ########################################################
@login_required
@lecturer_required
def handle_file_upload(request, slug):
    course = Course.objects.get(slug=slug)
    if request.method == "POST":
        form = UploadFormFile(request.POST, request.FILES)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.course = course
            obj.save()

            messages.success(
                request, (request.POST.get("title") + " has been uploaded.")
            )
            return redirect("course_detail", slug=slug)
    else:
        form = UploadFormFile()
    return render(
        request,
        "upload/upload_file_form.html",
        {"title": "File Upload", "form": form, "course": course},
    )


@login_required
@lecturer_required
def handle_file_edit(request, slug, file_id):
    course = Course.objects.get(slug=slug)
    instance = Upload.objects.get(pk=file_id)
    if request.method == "POST":
        form = UploadFormFile(request.POST, request.FILES, instance=instance)
        # file_name = request.POST.get('name')
        if form.is_valid():
            form.save()
            messages.success(
                request, (request.POST.get("title") + " has been updated.")
            )
            return redirect("course_detail", slug=slug)
    else:
        form = UploadFormFile(instance=instance)

    return render(
        request,
        "upload/upload_file_form.html",
        {"title": instance.title, "form": form, "course": course},
    )


def handle_file_delete(request, slug, file_id):
    file = Upload.objects.get(pk=file_id)
    # file_name = file.name
    file.delete()

    messages.success(request, (file.title + " has been deleted."))
    return redirect("course_detail", slug=slug)


# ########################################################
# Video Upload views
# ########################################################
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import Course, UploadVideo
from .forms import UploadFormVideo  # Import your form

@login_required
@lecturer_required
def handle_video_upload(request, slug):
    course = get_object_or_404(Course, slug=slug)

    if request.method == "POST":
        form = UploadFormVideo(request.POST, request.FILES)
        if form.is_valid():
            video = form.save(commit=False)
            video.course = course  # Associate the video with the course
            video.save()
            messages.success(request, f"{form.cleaned_data['title']} has been uploaded.")
            return redirect("course_detail", slug=slug)
    else:
        form = UploadFormVideo()

    return render(request, "upload/upload_video_form.html", {
        "title": "Upload Video",
        "form": form,
        "course": course,
    })


@login_required
@lecturer_required
def handle_video_edit(request, slug, video_slug):
    course = Course.objects.get(slug=slug)
    instance = UploadVideo.objects.get(slug=video_slug)
    if request.method == "POST":
        form = UploadFormVideo(request.POST, request.FILES, instance=instance)
        if form.is_valid():
            form.save()
            messages.success(request, (request.POST.get("title") + " has been updated."))
            return redirect("course_detail", slug=slug)
    else:
        form = UploadFormVideo(instance=instance)

    return render(
        request,
        "upload/upload_video_form.html",
        {
            "title": instance.title,
            "form": form,
            "course": course,
        },
    )


from django.shortcuts import render, get_object_or_404
from .models import UploadVideo, Course

@login_required
def handle_video_single(request, slug, video_slug):
    course = get_object_or_404(Course, slug=slug)
    video = get_object_or_404(UploadVideo, slug=video_slug)

    # Check if the video has an associated file
    has_video_file = video.video and video.video.name  # Check if video has a file associated with it

    # If there's no video file or YouTube link, handle it gracefully
    if not has_video_file and not video.youtube_link:
        messages.error(request, "This video does not have a file or a YouTube link associated with it.")
        return redirect('course_single', slug=slug)

    return render(
        request,
        "upload/video_single.html",
        {
            "video": video,
            "has_video_file": has_video_file,  # Pass this flag to the template
            "course": course,
        }
    )




@login_required
@lecturer_required
def handle_video_delete(request, slug, video_slug):
    video = get_object_or_404(UploadVideo, slug=video_slug)
    video.delete()
    messages.success(request, (video.title + " has been deleted."))
    return redirect("course_detail", slug=slug)


# ########################################################


# ########################################################
# Course Registration
# ########################################################
@login_required
@student_required
def course_registration(request):
    if request.method == "POST":
        student = Student.objects.get(student__pk=request.user.id)
        ids = ()
        data = request.POST.copy()
        data.pop("csrfmiddlewaretoken", None)  # remove csrf_token
        for key in data.keys():
            ids = ids + (str(key),)
        for s in range(0, len(ids)):
            course = Course.objects.get(pk=ids[s])
            obj = TakenCourse.objects.create(student=student, course=course)
            obj.save()
        messages.success(request, "Courses registered successfully!")
        return redirect("course_registration")
    else:
        current_semester = Semester.objects.filter(is_current_semester=True).first()
        if not current_semester:
            messages.error(request, "No active semester found.")
            return render(request, "course/course_registration.html")

        # student = Student.objects.get(student__pk=request.user.id)
        student = get_object_or_404(Student, student__id=request.user.id)
        taken_courses = TakenCourse.objects.filter(student__student__id=request.user.id)
        t = ()
        for i in taken_courses:
            t += (i.course.pk,)

        courses = (
            Course.objects.filter(
                program__pk=student.program.id,
                level=student.level,
                semester=current_semester,
            )
            .exclude(id__in=t)
            .order_by("year")
        )
        all_courses = Course.objects.filter(
            level=student.level, program__pk=student.program.id
        )

        no_course_is_registered = False  # Check if no course is registered
        all_courses_are_registered = False

        registered_courses = Course.objects.filter(level=student.level).filter(id__in=t)
        if (
            registered_courses.count() == 0
        ):  # Check if number of registered courses is 0
            no_course_is_registered = True

        if registered_courses.count() == all_courses.count():
            all_courses_are_registered = True

        total_first_semester_credit = 0
        total_sec_semester_credit = 0
        total_registered_credit = 0
        for i in courses:
            if i.semester == "First":
                total_first_semester_credit += int(i.credit)
            if i.semester == "Second":
                total_sec_semester_credit += int(i.credit)
        for i in registered_courses:
            total_registered_credit += int(i.credit)
        context = {
            "is_calender_on": True,
            "all_courses_are_registered": all_courses_are_registered,
            "no_course_is_registered": no_course_is_registered,
            "current_semester": current_semester,
            "courses": courses,
            "total_first_semester_credit": total_first_semester_credit,
            "total_sec_semester_credit": total_sec_semester_credit,
            "registered_courses": registered_courses,
            "total_registered_credit": total_registered_credit,
            "student": student,
        }
        return render(request, "course/course_registration.html", context)


@login_required
@student_required
def course_drop(request):
    if request.method == "POST":
        student = Student.objects.get(student__pk=request.user.id)
        ids = ()
        data = request.POST.copy()
        data.pop("csrfmiddlewaretoken", None)  # remove csrf_token
        for key in data.keys():
            ids = ids + (str(key),)
        for s in range(0, len(ids)):
            course = Course.objects.get(pk=ids[s])
            obj = TakenCourse.objects.get(student=student, course=course)
            obj.delete()
        messages.success(request, "Successfully Dropped!")
        return redirect("course_registration")


# ########################################################


@login_required
def user_course_list(request):
    course_type = request.GET.get('course_type', 'qcm_course')  # Default to 'qcm_course'

    if request.user.is_superuser:  # Check for super admin
        courses = Course.objects.all()  # Or any other logic you need
    elif request.user.is_lecturer:
        courses = Course.objects.filter(allocated_course__lecturer__pk=request.user.id)
    elif request.user.is_student:
        student = Student.objects.get(student__pk=request.user.id)
        taken_courses = TakenCourse.objects.filter(student__student__id=student.student.id)
        courses = Course.objects.filter(level=student.level, program__pk=student.program.id)

    # Apply filtering based on course type
    if course_type:
        courses = courses.filter(course_type=course_type)  # Adjust according to your field name

    return render(
        request,
        "course/user_course_list.html",
        {"courses": courses, "taken_courses": taken_courses, "course_type": course_type, "student": student if request.user.is_student else None},
    )

    

