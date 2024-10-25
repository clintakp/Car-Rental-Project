from django.contrib import admin
from .models import Vehicles
from .models import Contact

@admin.register(Vehicles)
class VehiclesAdmin(admin.ModelAdmin):
    list_display = ('license_plate', 'status', 'daily_rate', 'brand', 'model')
    search_fields = ('license_plate', 'brand', 'model')

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'subject', 'feedback_type', 'attachment', 'submitted_at', 'status')