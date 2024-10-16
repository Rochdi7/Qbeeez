from django.urls import path
from .views import SearchView
from .views import PrivacyPolicyView, TermsOfUseView


urlpatterns = [
    path('privacy/', PrivacyPolicyView.as_view(), name='privacy_policy'),
    path('terms/', TermsOfUseView.as_view(), name='terms_of_use'),
    path("", SearchView.as_view(), name="query"),
]
