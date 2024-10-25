from .views import RegistrationView, LoginView, UsernameValidationView, EmailValidationView, ResetPassword_EmailView, PasswordReset, logout_view, VerificationView
from django.urls import path
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('signup', RegistrationView.as_view(), name="sign_up"),
    path('validate-username', csrf_exempt(UsernameValidationView.as_view()), name="validate-username"),
    path('validate-email', csrf_exempt(EmailValidationView.as_view()), name="validate-email"),
    path('activate/<uidb64>/<token>', VerificationView.as_view(), name='activate'),
    path('login/', LoginView.as_view(), name="login"),
    path('logout', logout_view, name="logout"),
    path('request-reset-link', ResetPassword_EmailView.as_view(), name="Reset-password"),
    path('set-new-password/<uidb64>/<token>', PasswordReset.as_view(), name='Reset-user-password'),
]