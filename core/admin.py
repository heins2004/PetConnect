from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Transaction, Request, Queries

@admin.register(User)
class CustomUserAdmin(UserAdmin):
    model = User
    list_display = ['id', 'email', 'is_staff', 'is_superuser']
    ordering = ['id']

admin.site.register(Transaction)
admin.site.register(Request)
admin.site.register(Queries)

