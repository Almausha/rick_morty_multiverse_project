from django.urls import path
from . import views

urlpatterns = [
    path('', views.universe_dashboard, name='universe_dashboard'),
    path('list/', views.universe_list, name='universe_list'),
    path('create/', views.universe_create, name='universe_create'),
    path('update/<int:pk>/', views.universe_update, name='universe_update'),
    path('delete/<int:pk>/', views.universe_delete, name='universe_delete'),
]
