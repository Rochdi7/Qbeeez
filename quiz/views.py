from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, render, redirect
from django.utils.decorators import method_decorator
from django.views.generic import (
    DetailView,
    ListView,
    TemplateView,
    FormView,
    CreateView,
    UpdateView,
)
from django.contrib import messages
from django.db import transaction
        
from django.shortcuts import render
from datetime import timedelta
from django.utils import timezone
from .models import Sitting
from django.db.models import Count
from django.db.models.functions import TruncDate, TruncWeek, TruncMonth
from accounts.decorators import lecturer_required
from .models import Course, Progress, Sitting, EssayQuestion, Quiz, MCQuestion, Question
from .forms import (
    QuizAddForm,
    MCQuestionForm,
    MCQuestionFormSet,
    QuestionForm,
    EssayForm,
)

def statistics_view(request):
    # Add your logic for statistics here
    return render(request, 'statistics.html')

from django.shortcuts import get_object_or_404, redirect
from django.views.generic import CreateView
from django.db import transaction
from .models import Quiz, Course
from .forms import QuizAddForm

class QuizCreateView(CreateView):
    model = Quiz
    form_class = QuizAddForm

    def get_context_data(self, **kwargs):
        context = super(QuizCreateView, self).get_context_data(**kwargs)
        course = get_object_or_404(Course, slug=self.kwargs["slug"])  # Safely get the course
        context["course"] = course
        
        if self.request.POST:
            context["form"] = QuizAddForm(self.request.POST, course=course)  # Pass course
        else:
            context["form"] = QuizAddForm(initial={"course": course})  # Pass course

        return context

    def form_valid(self, form):
        with transaction.atomic():
            self.object = form.save(commit=False)
            form.instance = self.object  # Make sure to set the instance
            form.save()
            # Redirect to the quiz question creation page
            return redirect("mc_create", slug=self.kwargs["slug"], quiz_id=self.object.id)
        
    def form_invalid(self, form):
        return super(QuizCreateView, self).form_invalid(form)



@method_decorator([login_required, lecturer_required], name="dispatch")
class QuizUpdateView(UpdateView):
    model = Quiz
    form_class = QuizAddForm

    def get_context_data(self, *args, **kwargs):
        context = super(QuizUpdateView, self).get_context_data(**kwargs)
        context["course"] = Course.objects.get(slug=self.kwargs["slug"])
        quiz = Quiz.objects.get(pk=self.kwargs["pk"])
        if self.request.POST:
            context["form"] = QuizAddForm(self.request.POST, instance=quiz)
        else:
            context["form"] = QuizAddForm(instance=quiz)
        return context

    def form_valid(self, form, **kwargs):
        context = self.get_context_data()
        course = context["course"]
        form = context["form"]
        with transaction.atomic():
            self.object = form.save()
            if form.is_valid():
                form.instance = self.object
                form.save()
                return redirect("quiz_index", course.slug)
        return super(QuizUpdateView, self).form_invalid(form)


@login_required
@lecturer_required
def quiz_delete(request, slug, pk):
    quiz = Quiz.objects.get(pk=pk)
    course = Course.objects.get(slug=slug)
    quiz.delete()
    messages.success(request, f"successfuly deleted.")
    return redirect("quiz_index", quiz.course.slug)


from django.urls import reverse
@method_decorator([login_required, lecturer_required], name="dispatch")
class MCQuestionCreate(CreateView):
    model = MCQuestion
    form_class = MCQuestionForm

    def get_context_data(self, **kwargs):
        context = super(MCQuestionCreate, self).get_context_data(**kwargs)
        context["course"] = Course.objects.get(slug=self.kwargs["slug"])
        context["quiz_obj"] = Quiz.objects.get(id=self.kwargs["quiz_id"])
        context["quizQuestions"] = Question.objects.filter(quiz=self.kwargs["quiz_id"]).count()
        
        if self.request.POST:
            context["form"] = MCQuestionForm(self.request.POST)
            context["formset"] = MCQuestionFormSet(self.request.POST)
        else:
            context["form"] = MCQuestionForm(initial={"quiz": self.kwargs["quiz_id"]})
            context["formset"] = MCQuestionFormSet()

        return context

    def form_valid(self, form):
        context = self.get_context_data()
        formset = context["formset"]
        quiz_instance = get_object_or_404(Quiz, id=self.kwargs["quiz_id"])

        if formset.is_valid() and form.is_valid():  # Ensure both form and formset are valid
            with transaction.atomic():
                mc_question = form.save(commit=False)  # Don't commit yet
                
                # Use cleaned_data to get the fields
                mc_question.year = form.cleaned_data.get('year')
                mc_question.question_type = form.cleaned_data.get('question_type')  # Use cleaned data
                mc_question.correction_type = form.cleaned_data.get('correction_type')
                mc_question.save()  # Save to database

                mc_question.quiz.add(quiz_instance)  # Associate with the quiz
                
                formset.instance = mc_question
                formset.save()  # Save formset data

                messages.success(self.request, "Question saved successfully!")

                # Redirect based on button clicked
                if "another" in self.request.POST:
                    return redirect("mc_create", slug=self.kwargs["slug"], quiz_id=self.kwargs["quiz_id"])
                else:
                    return redirect("quiz_index", self.kwargs['slug'])  # Redirect to quiz index

        # Log errors for debugging
        print(form.errors)
        print(formset.errors)
        
        return self.form_invalid(form)

    def get_success_url(self):
        return reverse('quiz_index', args=[self.kwargs['slug']])







from django.shortcuts import get_object_or_404
from .models import Quiz, Course, Subcourse  # Ensure you import the Subcourse model

@login_required
def quiz_list(request, slug):
    course = get_object_or_404(Course, slug=slug)  # Retrieve the course
    subcourses = Subcourse.objects.filter(course=course)  # Get subcourses related to the course
    
    # Get the selected subcourse from the request
    selected_subcourse_id = request.GET.get('subcourse')
    
    # Filter quizzes based on the selected subcourse
    if selected_subcourse_id:
        quizzes = Quiz.objects.filter(course=course, subcourse_id=selected_subcourse_id).order_by("-timestamp")
    else:
        quizzes = Quiz.objects.filter(course=course).order_by("-timestamp")

    return render(
        request,
        "quiz/quiz_list.html",
        {"quizzes": quizzes, "course": course, "subcourses": subcourses, "selected_subcourse_id": selected_subcourse_id},
    )

    # return render(request, 'quiz/quiz_list.html', {'quizzes': quizzes})


@method_decorator([login_required, lecturer_required], name="dispatch")
class QuizMarkerMixin(object):
    @method_decorator(login_required)
    # @method_decorator(permission_required('quiz.view_sittings'))
    def dispatch(self, *args, **kwargs):
        return super(QuizMarkerMixin, self).dispatch(*args, **kwargs)


# @method_decorator([login_required, lecturer_required], name='get_queryset')
class SittingFilterTitleMixin(object):
    def get_queryset(self):
        queryset = super(SittingFilterTitleMixin, self).get_queryset()
        quiz_filter = self.request.GET.get("quiz_filter")
        if quiz_filter:
            queryset = queryset.filter(quiz__title__icontains=quiz_filter)

        return queryset


from django.utils.decorators import method_decorator
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required

@method_decorator([login_required], name="dispatch")
class QuizUserProgressView(TemplateView):
    template_name = "progress.html"

    def dispatch(self, request, *args, **kwargs):
        return super(QuizUserProgressView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(QuizUserProgressView, self).get_context_data(**kwargs)
        progress, _ = Progress.objects.get_or_create(user=self.request.user)

        # Fetching exams
        exams = progress.show_exams()
        context["exams"] = exams
        context["exams_counter"] = exams.count()

        # Prepare data for the chart
        exam_titles = [exam.quiz.title for exam in exams]
        exam_scores = [exam.current_score for exam in exams]

        context["exam_titles"] = exam_titles
        context["exam_scores"] = exam_scores

        return context



from django.db.models import Count, Q
from django.db.models.functions import TruncDate, TruncWeek, TruncMonth
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView
from .models import Question, Comment
from .forms import CommentForm
from django.shortcuts import render, redirect, get_object_or_404
from .models import Question, Comment
from .forms import CommentForm
from django.shortcuts import render, get_object_or_404, redirect
from .models import Question, Comment
from .forms import CommentForm

def question_detail(request, question_id):
    question = get_object_or_404(Question, id=question_id)
    comments = Comment.objects.filter(question=question)

    if request.method == 'POST':
        form = CommentForm(request.POST)  # Initialize the form with POST data
        if form.is_valid():
            comment = form.save(commit=False)  # Create a comment instance but don't save yet
            comment.question = question
            
            # Check for the is_anonymous checkbox
            is_anonymous = request.POST.get('is_anonymous') == 'on'  # Get value from checkbox
            comment.is_anonymous = is_anonymous  # Set the is_anonymous field

            # Set user based on authentication
            if is_anonymous:
                comment.user = None  # Set user to None for anonymous comments
            else:
                comment.user = request.user if request.user.is_authenticated else None

            comment.save()  # Save the comment
            return redirect('question_detail', question_id=question.id)
    else:
        form = CommentForm()  # Initialize a blank form for GET request

    return render(request, 'quiz/question_detail.html', {
        'question': question,
        'form': form,
        'comments': comments
    })

from course.models import Course, Upload  # Ensure Upload is imported

def pdf_list_view(request, course_id):
    course = get_object_or_404(Course, id=course_id)  # Fetch the course
    pdf_files = Upload.objects.filter(course=course, file__endswith='.pdf')  # Fetch only PDFs related to the course
    
    context = {
        'course': course,
        'pdf_files': pdf_files,
    }
    return render(request, 'quiz/pdf_list.html', context)

from django.shortcuts import render, get_object_or_404, redirect
from .models import Quiz, Question, Note  # Assuming you have a Note model for storing notes

from django.shortcuts import get_object_or_404, redirect
from .models import Note, Quiz, Question

from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.decorators import login_required

@login_required
def save_notes(request, quiz_id, question_id):
    quiz = get_object_or_404(Quiz, id=quiz_id)
    question = get_object_or_404(Question, id=question_id)
    user = request.user

    if request.method == 'POST':
        # Get the notes content from the POST request
        notes = request.POST.get('notes', '')

        # Save or update the note
        note, created = Note.objects.get_or_create(user=user, quiz=quiz, question=question)

        # Correct the field name to 'notes' instead of 'text'
        note.notes = notes  # Ensure you're using the correct field name here
        note.save()

        # Return a JSON response with notes and timestamp
        return JsonResponse({
            'success': True,
            'notes': note.notes,  # Include the saved note
            'created_at': note.created_at.isoformat()  # Include the created timestamp
        })

    # If the request is not POST, we return an error response
    return JsonResponse({'success': False, 'message': 'Invalid request.'}, status=400)

@login_required
def delete_note(request, note_id):
    note = get_object_or_404(Note, id=note_id, user=request.user)
    if request.method == 'POST':
        note.delete()
        return redirect('notes_list')

    return render(request, 'confirm_delete.html', {'note': note})

@login_required
def edit_note(request, note_id):
    note = get_object_or_404(Note, id=note_id, user=request.user)
    
    if request.method == 'POST':
        # Update the note content
        note.notes = request.POST.get('notes', '')
        note.save()
        return redirect('notes_list')

    return render(request, 'edit_note.html', {'note': note})

@login_required
def notes_list(request):
    # Get all notes for the logged-in user
    notes = Note.objects.filter(user=request.user)

    # Render a template that shows the list of notes
    return render(request, 'notes_list.html', {'notes': notes})



from accounts.decorators import student_required, lecturer_required
from django.utils.decorators import method_decorator
from collections import defaultdict
from django.db.models.functions import TruncDate, TruncWeek, TruncMonth
from django.db.models import Count, Q
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView
from .models import Sitting
from django.utils.decorators import method_decorator
from collections import defaultdict
from django.db.models.functions import TruncDate, TruncWeek, TruncMonth
from django.db.models import Count, Q
from accounts.decorators import *
from accounts.decorators import student_required, lecturer_required
from django.utils.decorators import method_decorator
from collections import defaultdict
from django.db.models.functions import TruncDate, TruncWeek, TruncMonth
from django.db.models import Count, Q
from django.contrib.auth.mixins import LoginRequiredMixin

from accounts.decorators import student_required, lecturer_required
from django.utils.decorators import method_decorator
from collections import defaultdict
from django.db.models.functions import TruncDate, TruncWeek, TruncMonth
from django.db.models import Count, Q
from django.contrib.auth.mixins import LoginRequiredMixin

@method_decorator(login_required, name="dispatch")
class QuizMarkingList(LoginRequiredMixin, ListView):
    model = Sitting
    template_name = 'quiz/marking_list.html'
    context_object_name = 'sitting_list'

    def get_queryset(self):
        # Check if the user is superuser, lecturer, or student and adjust the queryset accordingly
        if self.request.user.is_superuser:
            queryset = Sitting.objects.filter(complete=True)
        elif hasattr(self.request.user, 'is_lecturer') and self.request.user.is_lecturer:
            queryset = Sitting.objects.filter(
                quiz__course__allocated_course__lecturer__pk=self.request.user.id,
                complete=True
            )
        elif hasattr(self.request.user, 'is_student') and self.request.user.is_student:
            # Students should only see their own completed quizzes
            queryset = Sitting.objects.filter(user=self.request.user, complete=True)
        else:
            queryset = Sitting.objects.none()  # No access if neither lecturer nor student

        # Filter by user, if provided (applicable to lecturers or superusers)
        user_filter = self.request.GET.get("user_filter")
        if user_filter and (self.request.user.is_superuser or self.request.user.is_lecturer):
            queryset = queryset.filter(user__username__icontains=user_filter)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        # Initialize totals
        total_correct = 0
        total_incorrect = 0

        # Dictionaries to aggregate correct and incorrect counts by course
        course_correct_counts = defaultdict(int)
        course_incorrect_counts = defaultdict(int)

        # Prepare performance data (daily, weekly, monthly)
        daily_performance = (
            context['sitting_list']
            .annotate(day=TruncDate('start'))
            .values('day')
            .annotate(correct_count=Count('correct_questions', filter=Q(correct_questions__isnull=False)), 
                      incorrect_count=Count('incorrect_questions', filter=Q(incorrect_questions__isnull=False)))
            .order_by('day')
        )

        weekly_performance = (
            context['sitting_list']
            .annotate(week=TruncWeek('start'))
            .values('week')
            .annotate(correct_count=Count('correct_questions', filter=Q(correct_questions__isnull=False)), 
                      incorrect_count=Count('incorrect_questions', filter=Q(incorrect_questions__isnull=False)))
            .order_by('week')
        )

        monthly_performance = (
            context['sitting_list']
            .annotate(month=TruncMonth('start'))
            .values('month')
            .annotate(correct_count=Count('correct_questions', filter=Q(correct_questions__isnull=False)), 
                      incorrect_count=Count('incorrect_questions', filter=Q(incorrect_questions__isnull=False)))
            .order_by('month')
        )

        # Calculate totals and performance by course
        for sitting in context['sitting_list']:
            correct_questions = sitting.correct_questions.split(",") if sitting.correct_questions else []
            incorrect_questions = sitting.incorrect_questions.split(",") if sitting.incorrect_questions else []
            total_correct += len(correct_questions)
            total_incorrect += len(incorrect_questions)

            # Adjust this line based on your Course model's attribute for the name
            course_name = sitting.course.title  # Ensure 'title' is the correct attribute for course name
            course_correct_counts[course_name] += len(correct_questions)
            course_incorrect_counts[course_name] += len(incorrect_questions)

        # Prepare course-wise totals
        courses = list(course_correct_counts.keys())
        correct_counts = list(course_correct_counts.values())
        incorrect_counts = list(course_incorrect_counts.values())

        # Add the totals and performance data to the context
        context['total_correct'] = total_correct
        context['total_incorrect'] = total_incorrect
        context['daily_performance'] = daily_performance
        context['weekly_performance'] = weekly_performance
        context['monthly_performance'] = monthly_performance
        context['courses'] = courses
        context['correct_counts'] = correct_counts
        context['incorrect_counts'] = incorrect_counts

        return context


@method_decorator([login_required, lecturer_required], name="dispatch")
class QuizMarkingDetail(QuizMarkerMixin, DetailView):
    model = Sitting

    def post(self, request, *args, **kwargs):
        sitting = self.get_object()

        q_to_toggle = request.POST.get("qid", None)
        if q_to_toggle:
            q = Question.objects.get_subclass(id=int(q_to_toggle))
            if int(q_to_toggle) in sitting.get_incorrect_questions:
                sitting.remove_incorrect_question(q)
            else:
                sitting.add_incorrect_question(q)

        return self.get(request)

    def get_context_data(self, **kwargs):
        context = super(QuizMarkingDetail, self).get_context_data(**kwargs)
        context["questions"] = context["sitting"].get_questions(with_answers=True)
        return context
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib import messages
from django.core.exceptions import PermissionDenied
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from django.views.generic import FormView
import logging
from .models import Quiz, Sitting, Progress, Question, EssayQuestion, Course  # Ensure necessary models are imported
from .forms import QuestionForm, EssayForm  # Ensure your form imports are correct
from django.utils import timezone
from datetime import timedelta
from course.models import Course, Upload

logger = logging.getLogger(__name__)

@method_decorator([login_required], name="dispatch")
class QuizTake(FormView):
    form_class = QuestionForm
    template_name = "question.html"
    result_template_name = "result.html"

    def dispatch(self, request, *args, **kwargs):
        self.pdf_files = []  # Initialize to an empty list
        self.quiz = get_object_or_404(Quiz, slug=self.kwargs["slug"])
        self.course = get_object_or_404(Course, pk=self.kwargs["pk"])

        # Check if exam mode toggle button was pressed
        if request.method == 'POST' and 'toggle_exam_mode' in request.POST:
            request.session['exam_mode'] = not request.session.get('exam_mode', False)

        self.exam_mode = request.session.get('exam_mode', False)

        # Ensure quiz has questions
        quiz_questions = Question.objects.filter(quiz=self.quiz).count()
        if quiz_questions <= 0:
            messages.warning(request, "Question set of the quiz is empty. Try later!")
            return redirect("quiz_index", self.course.slug)

        # Permission check
        if self.quiz.draft and not request.user.has_perm("quiz.change_quiz"):
            raise PermissionDenied

        self.sitting = Sitting.objects.user_sitting(request.user, self.quiz, self.course)

        if self.sitting is False:
            messages.info(request, "You have already sat this exam and only one sitting is permitted.")
            return redirect("quiz_index", self.course.slug)

        return super(QuizTake, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(QuizTake, self).get_context_data(**kwargs)
        context['pdf_files'] = Upload.objects.filter(course=self.course, file__endswith='.pdf')
        context.update({
            "question": self.question,
            "quiz": self.quiz,
            "course": self.course,
            "exam_mode": self.exam_mode,
            "previous": getattr(self, "previous", {}),
            "progress": getattr(self, "progress", 0)
        })
        return context

    def get_form(self, *args, **kwargs):
        self.question = self.sitting.get_current_question()
        if not self.question:
            logger.error('No current question found. Cannot render form.')
            messages.error(self.request, "There was an error retrieving the question. Please try again.")
            return redirect("quiz_index", self.course.slug)

        self.progress = self.sitting.progress()
        form_class = EssayForm if isinstance(self.question, EssayQuestion) else self.form_class
        return form_class(**self.get_form_kwargs())

    def get_form_kwargs(self):
        kwargs = super(QuizTake, self).get_form_kwargs()
        return {**kwargs, "question": self.question}

    def form_valid(self, form):
        if not self.question or not self.question.id:
            logger.error('Invalid question ID, cannot process form.')
            messages.error(self.request, "There was an error processing your answer. Please try again.")
            return redirect("quiz_index", self.course.slug)

        # Check if 'next_question' or 'previous_question' was submitted
        if 'next_question' in self.request.POST:
            self.sitting.move_to_next_question()
            return self.redirect_to_question()

        elif 'previous_question' in self.request.POST:
            self.sitting.move_to_previous_question()
            return self.redirect_to_question()

        # If 'Check' button was clicked, validate the answer
        guess = form.cleaned_data.get("answers")
        if guess is None:  # Or handle the empty string case
            messages.info(self.request, "You did not select an answer for this question.")
            self.sitting.move_to_next_question()
            return self.redirect_to_question()

        self.form_valid_user(form)

        # Check if there are more questions
        if not self.sitting.has_more_questions():
            return self.final_result_user()  # Redirect to results since there are no more questions

        # Clear POST data after processing
        self.request.POST = {}

        return super(QuizTake, self).get(self.request)

    def form_valid_user(self, form):
        progress, _ = Progress.objects.get_or_create(user=self.request.user)
        guess = form.cleaned_data["answers"]
        is_correct = self.question.check_if_correct(guess)

        if is_correct:
            self.sitting.add_to_score(1)
            self.sitting.add_correct_question(self.question)  # Save correct question
            progress.update_score(self.question, 1, 1)
        else:
            self.sitting.add_incorrect_question(self.question)
            progress.update_score(self.question, 0, 1)

        if not self.exam_mode and not self.quiz.answers_at_end:
            self.previous = {
                "previous_answer": guess,
                "previous_outcome": is_correct,
                "previous_question": self.question,
                "answers": self.question.get_choices(),
                "question_type": {self.question.__class__.__name__: True},
            }
        else:
            self.previous = {}

        self.sitting.add_user_answer(self.question, guess)
        self.sitting.move_to_next_question()

    def redirect_to_question(self):
        return redirect('quiz_question', slug=self.quiz.slug, pk=self.course.pk)

    def final_result_user(self):
        self.request.session['timeElapsed'] = 0  # Reset session variable
    # Reset localStorage when rendering the results
        time_elapsed = self.request.session.get('timeElapsed', 0) # Get time elapsed, default to 0 if not found
        minutes = time_elapsed // 60
        seconds = time_elapsed % 60      
        results = {
            "course": self.course,
            "quiz": self.quiz,
            "score": self.sitting.get_current_score,
            "max_score": self.sitting.get_max_score,
            "percent": self.sitting.get_percent_correct,
            "sitting": self.sitting,
            "previous": self.previous,
            "time_elapsed": time_elapsed,  # Original time elapsed
            "minutes": minutes,  # Calculated minutes
            "seconds": seconds,  # Calculated seconds

        }

        self.sitting.mark_quiz_complete()

        if self.quiz.answers_at_end:
            results["questions"] = self.sitting.get_questions(with_answers=True)
            results["incorrect_questions"] = self.sitting.get_incorrect_questions()

        return render(self.request, self.result_template_name, results)
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from quiz.models import Quiz, Sitting
from collections import defaultdict  # For easier aggregation

@login_required
def quiz_statistics(request, quiz_id):
    quiz = get_object_or_404(Quiz, id=quiz_id)

    # Initialize counters
    user_correct_counts = defaultdict(int)
    user_incorrect_counts = defaultdict(int)

    # Fetch all sittings for the specific quiz
    sittings = Sitting.objects.filter(quiz=quiz)

    # Debugging output for number of sittings
    print(f"Number of sittings found: {sittings.count()}")

    # Aggregate correct and incorrect counts for each user
    for sitting in sittings:
        # Count correct and incorrect questions using methods from the Sitting model
        user_correct_counts[sitting.user.id] += len(sitting.get_correct_questions())
        user_incorrect_counts[sitting.user.id] += len(sitting.get_incorrect_questions())

        # Debugging output for each sitting
        print(f"User ID: {sitting.user.id}, Correct: {user_correct_counts[sitting.user.id]}, Incorrect: {user_incorrect_counts[sitting.user.id]}")

    # Prepare data for the chart
    user_ids = list(user_correct_counts.keys())
    correct_data = list(user_correct_counts.values())
    incorrect_data = list(user_incorrect_counts.values())

    # Debugging output for final context data
    print(f'User IDs: {user_ids}')
    print(f'Correct Data: {correct_data}')
    print(f'Incorrect Data: {incorrect_data}')

    # Pass data to the template for rendering
    context = {
        'quiz': quiz,
        'correct_data': correct_data,
        'incorrect_data': incorrect_data,
        'user_ids': user_ids,  # Pass user IDs to the context
    }

    return render(request, 'statistics.html', context)
