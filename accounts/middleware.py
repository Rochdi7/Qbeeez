from user_agents import parse
from django.contrib.sessions.models import Session
from django.utils.timezone import now
from django.shortcuts import render, redirect
from django.contrib.auth import logout

# Function to get device info
def get_device_info(request):
    user_agent = request.META.get('HTTP_USER_AGENT', '')
    user_info = parse(user_agent)

    # Fallback for missing device info
    browser = user_info.browser.family if user_info.browser.family else "Unknown browser"
    os = user_info.os.family if user_info.os.family else "Unknown OS"
    os_version = user_info.os.version_string if user_info.os.version_string else ""

    return f"{browser} {os} {os_version}".strip()

# Middleware to allow only one session per user at a time
class SingleSessionMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.user.is_authenticated:
            current_session_key = request.session.session_key
            current_device_info = get_device_info(request)
            current_login_time = now()

            # Get all active sessions for this user
            sessions = Session.objects.filter(expire_date__gte=now())

            for session in sessions:
                session_data = session.get_decoded()
                if session_data.get('_auth_user_id') == str(request.user.id):
                    # If another session exists, delete it and show the page
                    if session.session_key != current_session_key:
                        previous_device_info = session_data.get('device_info', 'Unknown device')
                        previous_login_time = session.expire_date
                        session.delete()  # Delete the old session

                        # Render 'too_many_connections.html' with both device info
                        context = {
                            'current_device_info': current_device_info,
                            'previous_device_info': previous_device_info,
                            'previous_login_time': previous_login_time,
                        }
                        return render(request, 'too_many_connections.html', context)

        return self.get_response(request)

# View to handle session deletion
def delete_session(request):
    logout(request)  # Log out the user
    return redirect('login')  # Redirect to the login page
