from django.urls import path
from .views import *
from . import views
from .views import save_notes, notes_list
from .views import delete_note
from course.views import course_pdfs_view
urlpatterns = [

    path('course/<int:course_id>/pdfs/', pdf_list_view, name='pdf_list'),
    
    path('quiz-marking/', QuizMarkingList.as_view(), name='quiz_marking_list'),
    path('notes/', notes_list, name='notes_list'),
    path('notes/edit/<int:note_id>/', edit_note, name='edit_note'),
    path('notes/delete/<int:note_id>/', delete_note, name='delete_note'),
    path('question/<int:question_id>/', views.question_detail, name='question_detail'),
    path('quiz/<int:quiz_id>/question/<int:question_id>/save-notes/', views.save_notes, name='save_notes'),
    path('quiz/notes/', notes_list, name='notes_list'),  # No arguments needed here
    path('delete_note/', delete_note, name='delete_note'),

    path('statistics/', views.statistics_view, name='statistics'),
    path('quiz/<int:pk>/<slug:slug>/question/', QuizTake.as_view(), name='quiz_question'),
    path("<slug>/quizzes/", quiz_list, name="quiz_index"),
    path("progress/", view=QuizUserProgressView.as_view(), name="quiz_progress"),
    # path('marking/<int:pk>/', view=QuizMarkingList.as_view(), name='quiz_marking'),
    path("marking_list/", view=QuizMarkingList.as_view(), name="quiz_marking"),
    path(
        "marking/<int:pk>/",
        view=QuizMarkingDetail.as_view(),
        name="quiz_marking_detail",
    ),
    path("<int:pk>/<slug>/take/", view=QuizTake.as_view(), name="quiz_take"),
    path("<slug>/quiz_add/", QuizCreateView.as_view(), name="quiz_create"),
    path("<slug>/<int:pk>/add/", QuizUpdateView.as_view(), name="quiz_update"),
    path("<slug>/<int:pk>/delete/", quiz_delete, name="quiz_delete"),
    path(
        "mc-question/add/<slug>/<int:quiz_id>/",
        MCQuestionCreate.as_view(),
        name="mc_create",
    ),
    # path('mc-question/add/<int:pk>/<quiz_pk>/', MCQuestionCreate.as_view(), name='mc_create'),
]
