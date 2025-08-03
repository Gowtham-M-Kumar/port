from django import forms
from .models import AboutContent

class AboutContentForm(forms.ModelForm):
    class Meta:
        model = AboutContent
        fields = ['title', 'content', 'skills', 'image']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'content': forms.Textarea(attrs={'class': 'form-control', 'rows': 5}),
            'skills': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Python, Django, HTML, CSS'}),
        }

class SettingsPasswordForm(forms.Form):
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Enter admin password'}),
        label='Admin Password'
    ) 