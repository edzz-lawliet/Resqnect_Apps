from django.contrib import admin
from .models import Incident

@admin.register(Incident)
class IncidentAdmin(admin.ModelAdmin):
    list_display = ("id", "title", "category", "reporter", "status", "created_at")
    list_filter = ("category", "status", "created_at")
    search_fields = ("title", "description", "reporter__username")
