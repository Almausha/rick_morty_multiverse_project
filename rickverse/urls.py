

from django.contrib import admin
from django.urls import path, include  # ✅ include must be imported
from django.views.generic import RedirectView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('universes/', include('universe.urls')),
    path('', RedirectView.as_view(url='/universes/', permanent=False)),  # Redirect homepage
]