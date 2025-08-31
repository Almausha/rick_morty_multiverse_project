from django.contrib import admin
from .models import Admin, Universe, PortalTimeScheduler, JourneyLog, Booking, Artefact, Auction, Marketplace, RandomEvent

# Simple model registrations
admin.site.register(Admin)
admin.site.register(Universe)
admin.site.register(JourneyLog)
admin.site.register(Booking)
admin.site.register(Artefact)
admin.site.register(Auction)
admin.site.register(Marketplace)
admin.site.register(RandomEvent)

@admin.register(PortalTimeScheduler)
class PortalTimeSchedulerAdmin(admin.ModelAdmin):
    list_display = ('travel_id', 'source_universe', 'destination_universe', 'date', 'status', 'max_capacity')
    list_filter = ('date', 'source_universe', 'destination_universe')
    search_fields = ('source_universe__name', 'destination_universe__name')
    readonly_fields = ('status',)  # status is computed, not stored
