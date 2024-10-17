from django import forms
from django.forms.widgets import RadioSelect, Textarea
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.utils.translation import gettext_lazy as _
from django.db import transaction

from django.forms.models import inlineformset_factory

from accounts.models import User
from .models import Question, Quiz, MCQuestion, Choice


class QuestionForm(forms.Form):
    def __init__(self, question, *args, **kwargs):
        super(QuestionForm, self).__init__(*args, **kwargs)
        choice_list = [x for x in question.get_choices_list()]
        self.fields["answers"] = forms.ChoiceField(
            choices=choice_list, widget=RadioSelect, required=False
        )

    def clean_answers(self):
        data = self.cleaned_data.get('answers')
        if data == '':
            # You might want to do something specific here if required
            return None  # Return None if you want to treat it as no answer selected.
        return data



class EssayForm(forms.Form):
    def __init__(self, question, *args, **kwargs):
        super(EssayForm, self).__init__(*args, **kwargs)
        self.fields["answers"] = forms.CharField(
            widget=Textarea(attrs={"style": "width:100%"})
        )

from django import forms
from django.forms.widgets import RadioSelect, Textarea
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.utils.translation import gettext_lazy as _
from django.db import transaction
from django.forms.models import inlineformset_factory
from accounts.models import User
from .models import Question, Quiz, MCQuestion, Choice, Course  # Ensure Subcourse is imported
from course.models import Subcourse
from django import forms
from .models import Quiz  # Ensure you import the CourseSubcourse model

from django import forms
from django.forms.widgets import RadioSelect
from django.utils.translation import gettext_lazy as _
from django.contrib.admin.widgets import FilteredSelectMultiple
from .models import Quiz, Question  # Ensure correct models are imported
from .models import Comment

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content']  # Only include content field

    def __init__(self, *args, **kwargs):
        # Pop the question argument if it exists
        question = kwargs.pop('question', None)
        super().__init__(*args, **kwargs)
        
        if question:
            # Automatically assign the question to the comment instance
            self.instance.question = question

class QuizAddForm(forms.ModelForm):
    class Meta:
        model = Quiz
        exclude = []

    questions = forms.ModelMultipleChoiceField(
        queryset=Question.objects.all().select_subclasses(),
        required=False,
        label=_("Questions"),
        widget=FilteredSelectMultiple(verbose_name=_("Questions"), is_stacked=False),
    )

    # Field for Subcourse selection, populated from the course_subcourse table
    subcourse = forms.ModelChoiceField(
        queryset=Subcourse.objects.all(),  # Fetch all Subcourse objects
        required=True,  # Make it mandatory
        label=_("Subcourse"),
    )

    def __init__(self, *args, **kwargs):
        course = kwargs.pop('course', None)  # Ensure we pop 'course' from kwargs
        super(QuizAddForm, self).__init__(*args, **kwargs)

        if self.instance.pk:
            self.fields["questions"].initial = self.instance.question_set.all().select_subclasses()

        # Check if course is passed to filter subcourses
        if course:
            self.fields['subcourse'].queryset = Subcourse.objects.filter(course=course)

    def save(self, commit=True):
        quiz = super(QuizAddForm, self).save(commit=False)
        quiz.save()
        quiz.question_set.set(self.cleaned_data["questions"])
        self.save_m2m()
        return quiz
from django import forms

class MCQuestionForm(forms.ModelForm):
    class Meta:
        model = MCQuestion
        fields = ['content', 'year', 'question_type', 'correction_type', 'choice_order', 'figure', 'explanation']


class MCQuestionFormSet(forms.BaseInlineFormSet):
    def clean(self):
        """
        Custom validation for the formset to ensure:
        1. At least two choices are provided and not marked for deletion.
        2. At least one of the choices is marked as correct.
        """
        super().clean()

        # Collect non-deleted forms
        valid_forms = [form for form in self.forms if not form.cleaned_data.get('DELETE', True)]

        valid_choices = ['choice' in form.cleaned_data.keys() for form in valid_forms]
        if(not all(valid_choices)):
            raise forms.ValidationError("Vous devez ajouter un nom de choix valide.")

        # If all forms are deleted, raise a validation error
        if len(valid_forms) < 2:
            raise forms.ValidationError("Vous devez fournir au moins deux choix.")

        # Check if at least one of the valid forms is marked as correct
        correct_choices = [form.cleaned_data.get('correct', False) for form in valid_forms]

        if not any(correct_choices):
            raise forms.ValidationError("Un choix doit être marqué comme correct.")
        
        if correct_choices.count(True)>1:
            raise forms.ValidationError("Un seul choix doit être marqué comme correct.")


MCQuestionFormSet = inlineformset_factory(
    MCQuestion,
    Choice,
    form=MCQuestionForm,
    formset=MCQuestionFormSet,
    fields=["choice", "correct"],
    can_delete=True,
    extra=5,
)
