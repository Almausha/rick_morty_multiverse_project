


from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
    # ---------------- Welcome Page ----------------
    path('', views.welcome, name='welcome'),

    # ---------------- Admin & User Auth ----------------
    path('admin-login/', views.admin_login, name='admin_login'),
    path('user-login/', views.user_login, name='user_login'),
    path('user-signup/', views.user_signup, name='user_signup'),
    path('logout/', views.logout_view, name='logout'),

    # ---------------- Dashboards ----------------
    path('admin-dashboard/', views.admin_dashboard, name='admin_dashboard'),
    

   
    path('user-dashboard/', views.user_dashboard, name='user_dashboard'),

    # ---------------- Universe Vault ----------------
    path('universe/', views.universe_dashboard, name='universe_dashboard'),
    path('universe/list/', views.universe_list, name='universe_list'),
    path('universe/create/', views.universe_create, name='universe_create'),
    path('universe/update/<int:pk>/', views.universe_update, name='universe_update'),
    path('universe/delete/<int:pk>/', views.universe_delete, name='universe_delete'),

    # ---------------- Travel Scheduler ----------------
    path('scheduler/dashboard/', views.scheduler_dashboard, name='scheduler_dashboard'),
    path('scheduler/list/', views.scheduler_list, name='scheduler_list'),
    path('scheduler/create/', views.scheduler_create, name='scheduler_create'),
    path('scheduler/update/<int:pk>/', views.scheduler_update, name='scheduler_update'),
    path('scheduler/delete/<int:pk>/', views.scheduler_delete, name='scheduler_delete'),

    # ---------------- Journey Logs ----------------
    path('journey/dashboard/', views.journey_dashboard, name='journey_dashboard'),
    path('journey/full/', views.full_journey_list, name='full_journey_list'),
    
    






    


# ---------------- User Features ----------------
path('user/booking-scheduler/', views.user_booking_scheduler, name='user_booking_scheduler'),
path('user/book-schedule/<int:schedule_id>/', views.user_book_schedule, name='user_book_schedule'),

path('user/wishlist/', views.user_wishlist, name='user_wishlist'),
path('user/add-wishlist/<int:schedule_id>/', views.user_add_to_wishlist, name='user_add_to_wishlist'),
path('user/remove-wishlist/<int:wishlist_id>/', views.user_remove_from_wishlist, name='user_remove_from_wishlist'),

path('user/booking-history/', views.user_booking_history, name='user_booking_history'),










# Marketplace & Cart
    path('marketplace/', views.marketplace_list, name='marketplace_list'),
    path('artefact/<int:pk>/', views.artefact_detail, name='artefact_detail'),
    path('cart/add/<int:pk>/', views.add_to_cart, name='add_to_cart'),
    path('cart/', views.cart_view, name='cart_view'),
    path('cart/remove/<int:item_id>/', views.remove_cart_item, name='remove_cart_item'),
    path('checkout/', views.checkout, name='checkout'),
    path('orders/<int:order_id>/', views.order_detail, name='order_detail'),
    path('rare-artefacts/', views.rare_artefact_list, name='rare_artefact_list'),
    path('rare-transactions/', views.rare_transactions_search, name='rare_transactions_search'),



    

    

    # User dashboard
    path('dashboard/', views.user_dashboard, name='user_dashboard'),
 path('transactions/search/', views.transactions_search, name='transactions_search'),
 path('checkout/item/<int:item_id>/', views.checkout_single_item, name='checkout_single_item'),
path('cart/update/<int:item_id>/', views.update_cart_item, name='update_cart_item'),


]