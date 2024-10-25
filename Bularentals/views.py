from django.core.mail import send_mail
from django.shortcuts import render, redirect
from django.conf import settings
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.http import HttpResponse
from .models import Vehicles
from django.db.models import Q
from django.core.paginator import Paginator
from django.contrib import messages
from .models import Contact
from .forms import ContactForm


def home(request):
    return render(request, 'home/Home.html')

def reservation(request):
    return render(request, 'home/Reservation.html')

def about_us(request):
    return render(request, 'home/About_us.html')

def fleet(request):
    vehicles = Vehicles.objects.all()
    sort_by = request.GET.get('sort', 'daily_rate')
    vehicles = vehicles.order_by(sort_by)
    return render(request, 'home/fleet.html', {'vehicles': vehicles})

def My_booking(request):
    return render(request, 'home/Booking.html')

#Search Function
def vehicle_search(request):
    query = request.GET.get('q')
    brand_filter = request.GET.get('brand')
    size_filter = request.GET.get('size')
    classes_filter = request.GET.get('classes')
    sort_by = request.GET.get('sort', 'daily_rate')  

    vehicles = Vehicles.objects.all()

    if query:
        vehicles = vehicles.filter(
            Q(brand__icontains=query)       |         # Search by brand
            Q(model__icontains=query)       |         # Search by model
            Q(seating_capacity__icontains=query) |    # Search by seats
            Q(classes__icontains=query)     |         # Search by classes
            Q(description__icontains=query) |         # Search by description
            Q(size__icontains=query)                  # Search by size
        )

    if brand_filter:
        vehicles = vehicles.filter(brand__icontains=brand_filter)

    if size_filter:
        vehicles = vehicles.filter(size__icontains=size_filter)

    if classes_filter:
        vehicles = vehicles.filter(classes__icontains=classes_filter)

    vehicles = vehicles.order_by(sort_by)   # Sort vehicles

    context = {
        'vehicles': vehicles,
        'brand_filter': brand_filter,
        'size_filter': size_filter,
        'classes_filter': classes_filter,
        'sort_by': sort_by,
    }
    return render(request, 'home/Vehicles_Search.html', context)

#contact us function
def contact_us(request):
    if request.method == 'POST':
        # Create a form instance with submitted data
        form = ContactForm(request.POST, request.FILES)

        # Check if the user is authenticated
        if request.user.is_authenticated:
            if form.is_valid():
                # Get form data
                subject = form.cleaned_data['subject']
                question = form.cleaned_data['question']
                feedback_type = form.cleaned_data['feedback_type']
                attachment = form.cleaned_data['attachment']

                # Get user data
                name = request.user.get_full_name()
                email = request.user.email

                # Save the form data to the Contact model
                contact = Contact(
                    name=name,
                    email=email,
                    subject=subject,
                    question=question,
                    feedback_type=feedback_type,
                    attachment=attachment
                )
                contact.save()

                return redirect('contact_success')
        else:
            messages.error(request, "You must be logged in to submit your Feedback.")
            return redirect('contact_us')
    
    else:
        form = ContactForm()  # Create an empty form for GET requests

    return render(request, 'home/contact_us.html', {'form': form})

def contact_success(request):
    return render(request, 'contact_success.html')