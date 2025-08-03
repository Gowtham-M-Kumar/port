from django.db import models

# Create your models here.

class AboutContent(models.Model):
    title = models.CharField(max_length=200, default="Why Hire Me?")
    content = models.TextField()
    skills = models.TextField(help_text="Comma-separated skills")
    image = models.ImageField(upload_to='about_images/', blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.title

class Settings(models.Model):
    admin_password = models.CharField(max_length=128, help_text="Password for accessing settings page")
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return "Admin Settings"
