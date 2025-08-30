from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Admin, Universe, JourneyLog, Artefact, Auction, Marketplace, PortalTimeScheduler, RandomEvent, User

# Register your models here
admin.site.register(Admin)
admin.site.register(Universe)
admin.site.register(JourneyLog)
admin.site.register(Artefact)
admin.site.register(Auction)
admin.site.register(Marketplace)
admin.site.register(PortalTimeScheduler)
admin.site.register(RandomEvent)
admin.site.register(User)

