from django.contrib import admin
from .models import AboutContent, Settings

@admin.register(AboutContent)
class AboutContentAdmin(admin.ModelAdmin):
    list_display = ['title', 'updated_at']
    search_fields = ['title', 'content', 'skills']

@admin.register(Settings)
class SettingsAdmin(admin.ModelAdmin):
    list_display = ['updated_at']
    readonly_fields = ['updated_at']
    
    def has_add_permission(self, request):
        # Only allow one settings instance
        return not Settings.objects.exists()
