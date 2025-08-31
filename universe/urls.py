from django.urls import path
from . import views
from django.urls import path, include
from django.contrib import admin
from django.views.generic import TemplateView
from django.contrib.auth import views as auth_views
from . import views


urlpatterns = [
    # ---------------- Universe Vault ----------------
    path('', views.universe_dashboard, name='universe_dashboard'),
    path('list/', views.universe_list, name='universe_list'),
    path('create/', views.universe_create, name='universe_create'),
    path('update/<int:pk>/', views.universe_update, name='universe_update'),
    path('delete/<int:pk>/', views.universe_delete, name='universe_delete'),

    # ---------------- Travel Scheduler ----------------
    path('scheduler/dashboard/', views.scheduler_dashboard, name='scheduler_dashboard'),
    path('scheduler/list/', views.scheduler_list, name='scheduler_list'),
    path('scheduler/create/', views.scheduler_create, name='scheduler_create'),
    path('scheduler/<int:pk>/update/', views.scheduler_update, name='scheduler_update'),
    path('scheduler/<int:pk>/delete/', views.scheduler_delete, name='scheduler_delete'),
    

    # ---------------- Journey Logs ----------------
    path('journey_dashboard/', views.journey_dashboard, name='journey_dashboard'),
    path('journey/create/', views.create_journey, name='create_journey'),
    path('journey/edit/<int:pk>/', views.edit_journey, name='edit_journey'),
    path('journey/delete/<int:pk>/', views.delete_journey, name='delete_journey'),
    


    
]
