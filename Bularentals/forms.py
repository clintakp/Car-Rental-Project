from django import forms
from .models import Contact


class ContactForm(forms.ModelForm):

    class Meta:
        model = Contact
        fields = ['feedback_type', 'subject', 'question', 'attachment']  # Only keep question since name and email are auto-filled
        widgets = {
            'question': forms.Textarea(attrs={
                'placeholder': 'Feedback',
                'maxlength': '250',
                'required': True,
                'class': 'form-control',  # Add your own classes or styles
            }),
        }