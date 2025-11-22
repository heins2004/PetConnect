from django.conf import settings  # ✅ Keep this
from django.conf.urls.static import static  # ✅ Keep this
from django.urls import path, include  # ✅ Keep this

# ✅ Move this import BELOW Django imports
from . import views  
from .views import approve_request, reject_request, hide_request  # ✅ Import the functions

urlpatterns = [
    path("", views.homeRenderer, name="index-page"),
    path("explore/", views.exploreRenderer, name="explore-page"),
    path("about/", views.aboutRenderer, name="about-page"),
    path("contact/", views.contactRenderer, name="contact-page"),
    path("pet/<int:transaction_id>", views.petDetailsRenderer, name="pet-details-page"),
    path('transaction/<int:transaction_id>/requests/', views.view_requests, name='view-requests-page'), 
    path("profile/<int:user_id>", views.profileRenderer, name="profile-page"),
    path("request-delete/<int:request_id>", views.deleteReqest, name="request-delete-page"),
    path("transaction-delete/<int:transaction_id>", views.transactionDeleter, name="transaction-delete-page"),
    path("login/", views.user_login, name='login-page'),
    path("register/", views.register, name="registration-page"),
    path("logout/", views.user_logout, name="logout"),
    path('transaction-closing/<int:transaction_id>', views.transactionAcceptedAndClosed, name="transaction-closing-page"),
    path("transaction-create/", views.transactionCreator, name="transaction-create-page"),
    path('edit_pet/<int:transaction_id>/', views.edit_pet, name='edit_pet'),
    path('edit_profile/', views.edit_profile, name='edit_profile'),
    path("admin-login/", views.admin_login, name="admin-login"),
    path("admin-dashboard/", views.admin_dashboard, name="admin-dashboard"),
    path('transactions_list/', views.transactions_list, name='transactions_list'),
    path('report/', views.report, name='report'),
    path('requests_list/', views.requests_list, name='requests_list'),
    path('generate_report/', views.generate_report, name='generate_report'),
    path('demo/', views.demo, name='demo'),
    path("transaction-status-change/<int:transaction_id>/", views.transaction_status_change, name="transaction-status-change"), 
    path('admin-dashboard/', views.backtohome, name='backtohome'),  
    path('request/<int:request_id>/approve/', approve_request, name='approve-request'),
    path('request/<int:request_id>/reject/', reject_request, name='reject-request'),
    path('request/<int:request_id>/hide/', hide_request, name='hide-request'),
    path('inquiries/', views.inquiries_list, name='inquiries_list'),
    path('inquiries/delete/<int:id>/', views.delete_inquiry, name='delete_inquiry'),
    path('admin-dashboard/', views.home, name='home'),
    ]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
