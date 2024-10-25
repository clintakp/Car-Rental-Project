from django.shortcuts import render, redirect
from django.views import View
from django.contrib.auth.models import User
from django.contrib import messages
from validate_email import validate_email
from django.http import JsonResponse
from django.contrib import auth
import json
from django.core.mail import EmailMessage
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_str, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.template.loader import render_to_string
from .utils import account_activation_token
from django.urls import reverse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.contrib.auth import get_user_model
import threading

# Create your views here.

class UsernameValidationView(View):
    def post(self, request):
        data = json.loads(request.body)
        username = data['username']
        if not str(username).isalnum():
            return JsonResponse({'username_error': 'Username should only contain alphanumeric characters.'}, status=400)
        if User.objects.filter(username=username).exists():
            return JsonResponse({'username_error': 'Username is already taken, choose another one.'}, status=409)
        return JsonResponse({'username_valid': True})

class EmailValidationView(View):
    def post(self, request):
        data = json.loads(request.body)
        email = data['email']
        if not validate_email(email):
            return JsonResponse({'email_error': 'Email is invalid.'}, status=400)
        if User.objects.filter(email=email).exists():
            return JsonResponse({'email_error': 'Email is already in use, choose another one.'}, status=409)
        return JsonResponse({'email_valid': True})
    
class EmailThread(threading.Thread):
    def __init__(self, email_message):
        self.email_message = email_message
        threading.Thread.__init__(self)
    
    def run(self):
        self.email_message.send(fail_silently=False)

class RegistrationView(View):
    def get(self, request):
        return render(request, 'authenication/register.html')

    def post(self, request):
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']
        username = request.POST['username']
        password = request.POST['password']

        context = {
            'fieldValues': request.POST
        }

        if not User.objects.filter(username=username).exists():
            if not User.objects.filter(email=email).exists():
                if len(password) < 6:
                    messages.error(request, 'Password too short')
                    return render(request, 'authenication/register.html', context)

                user = User.objects.create_user(username=username, email=email)
                user.set_password(password)
                user.first_name = first_name
                user.last_name = last_name
                user.is_active = False
                user.save()

                current_site = get_current_site(request)
                email_body = {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'token': account_activation_token.make_token(user),
                }

                link = reverse('activate', kwargs={
                               'uidb64': email_body['uid'], 'token': email_body['token']})

                email_subject = 'Activate your account'
                activate_url = 'http://' + current_site.domain + link

                recipient_email = email  

                email_message = EmailMessage(
                    email_subject,
                    'Hi '+user.username+', Please click the link below to activate your account:\n' + activate_url,
                    'noreply@semycolon.com',
                    to=[recipient_email],
                )

                EmailThread(email_message).start()
                messages.success(request, "Your account has been created successfully. Please check your email for activation.")
                return redirect('login')  # Consider redirecting here

        return render(request, 'authenication/register.html', context)

class VerificationView(View):
    def get(self, request, uidb64, token):
        try:
            id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=id)

            if not account_activation_token.check_token(user, token):
                messages.error(request, 'User already activated')
                return redirect('login')

            if user.is_active:
                return redirect('login')
            user.is_active = True
            user.save()

            messages.success(request, 'Account activated successfully')
            return redirect('login')

        except Exception as ex:
            print(f"Activation error: {ex}")  # Logging the error for better debugging

        return redirect('login')

class LoginView(View):
    def get(self, request):
        return render(request, 'authenication/login.html')

    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']

        if username and password:
            user = auth.authenticate(username=username, password=password)

            if user:
                if user.is_active:
                    auth.login(request, user)
                    messages.success(request, 'Welcome, ' + user.first_name + '  - You have successfully logged in')
                    return redirect('home')
                messages.error(
                    request, 'Account is not active,please check your email')
                return render(request, 'authenication/login.html')
            messages.error(
                request, 'Invalid credentials, try again')
            return render(request, 'authenication/login.html')

        messages.error(
            request, 'Please fill all fields')
        return render(request, 'authenication/login.html')

def logout_view(request):
    auth.logout(request)
    messages.success(request, 'You have successfully logged out')
    messages.info(request, 'Thanks for Visiting our site, Hope to see you again')
    return redirect('login')

class ResetPassword_EmailView(View):
    def get(self, request):
        return render(request,'authenication/reset-password.html')

    def post(self, request):

        email = request.POST['email']

        context = {
            'fieldValues': request.POST
        }

        if not validate_email(email):
            messages.error(request, 'Enter a Valid Email Address')
            return render(request,'authenication/reset-password.html', context)
        
        current_site = get_current_site(request)

        User = get_user_model()
        user = User.objects.filter(email=email)

        if user.exists():
            email_contents = {
            'user': user[0],
            'domain': current_site.domain,
            'uid': urlsafe_base64_encode(force_bytes(user[0].pk)),
            'token': PasswordResetTokenGenerator().make_token(user[0]),
            }

            link = reverse('Reset-user-password', kwargs={
                'uidb64': email_contents['uid'], 'token': email_contents['token']})

            email_subject = 'Password Reset'
            reset_url = 'http://' + current_site.domain + link

            recipient_email = email  

            email_message = EmailMessage(
                email_subject,
                'Hi there, Please click the link below to reset your password:\n' + reset_url,
                'noreply@semycolon.com',
                to=[recipient_email],
            )

            EmailThread(email_message).start()

        messages.success(request, 'Please Check your Email for the Reset Link')
            
        return render(request,'authenication/reset-password.html')
    
class PasswordReset(View):
    def get(self, request, uidb64, token):

        context = {
            'uidb64': uidb64,
            'token': token
        }

        try:
            user_id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=user_id)
            
            if not PasswordResetTokenGenerator().check_token(user, token):
                messages.info(request, 'Password Link is Expired, Request a New one')
                return render(request, 'authenication/reset-password.html')

        except Exception as identifier:
            pass
        return render(request, 'authenication/set-new-password.html', context)
    
    def post(self, request, uidb64, token):
        context = {
            'uidb64': uidb64,
            'token': token
        }

        password=request.POST['password']
        password2=request.POST['password2']

        if password != password2:
            messages.error(request, 'Password do not match')
            return render(request, 'authenication/set-new-password.html', context)
        
        if len(password) < 6:
            messages.error(request, 'Password too short')
            return render(request, 'authenication/set-new-password.html', context)
        
        try:
            user_id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=user_id)

            if user.check_password(password):
                messages.error(request, 'You cannot use your old password. Please choose a new one.')
                return render(request, 'authenication/set-new-password.html', context)
        
            user.set_password(password)
            user.save()

            messages.success(request, 'Password Reset Successful, Proceed to Login with New Credentials')
            return redirect('login')
        except Exception as identifier:
            messages.info(request, 'Something went wrong, try again')
            return render(request, 'authenication/set-new-password.html', context)