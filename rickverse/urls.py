

from django.contrib import admin
from django.urls import path, include  # ✅ include must be imported
from django.views.generic import RedirectView

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('universes/', include('universe.urls')),
    path('', RedirectView.as_view(url='/universes/', permanent=False)),  # Redirect homepage
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


