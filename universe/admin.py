from django.contrib import admin
from .models import Admin, Universe, PortalTimeScheduler, JourneyLog, Booking, Artefact, Auction, Marketplace, RandomEvent
from .models import JourneyLog
from django.contrib import admin
from .models import PortalTimeScheduler
# Simple model registrations
admin.site.register(Admin)
admin.site.register(Universe)

admin.site.register(Booking)
admin.site.register(Artefact)
admin.site.register(Auction)
admin.site.register(Marketplace)
admin.site.register(RandomEvent)



admin.register(PortalTimeScheduler)
class PortalTimeSchedulerAdmin(admin.ModelAdmin):
    list_display = ('travel_id', 'source_universe', 'destination_universe', 'date', 'status', 'max_capacity')
    readonly_fields = ('status',)


@admin.register(JourneyLog)
class JourneyLogAdmin(admin.ModelAdmin):
    list_display = ('user', 'universe', 'travel_date', 'success', 'manual_entry', 'points_awarded')
    list_filter = ('success', 'manual_entry')
    search_fields = ('user__username', 'universe__name')

