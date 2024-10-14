# accounts/pipeline.py

from .models import User
from django.shortcuts import redirect
from django.urls import reverse
def save_user_profile(backend, user, response, *args, **kwargs):
    if backend.name == 'google-oauth2':
        user.email = response.get('email', '')
        user.first_name = response.get('given_name', '')
        user.last_name = response.get('family_name', '')
        user.save()

def set_user_role(backend, user, response, *args, **kwargs):
    if backend.name == 'google-oauth2':
        # Set user role logic here
        user.is_student = True  # Example
        user.save()