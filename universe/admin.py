


from django.contrib import admin
from django.contrib.auth.models import User
from .models import (
    Admin, Universe, PortalTimeScheduler, JourneyLog, Booking,
    Artefact, 
    Cart, CartItem, Order, OrderItem,  Notification, TransactionRecord
)


# ---------------- Universe ----------------
@admin.register(Universe)
class UniverseAdmin(admin.ModelAdmin):
    list_display = ('name', 'universe_type', 'status', 'danger_level', 'admin')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "admin":
            kwargs["queryset"] = User.objects.filter(is_staff=True)
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


# ---------------- Portal Time Scheduler ----------------
@admin.register(PortalTimeScheduler)
class PortalTimeSchedulerAdmin(admin.ModelAdmin):
    list_display = ('travel_id', 'source_universe', 'destination_universe', 'date', 'status', 'max_capacity')
    readonly_fields = ('status',)

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "admin":
            kwargs["queryset"] = User.objects.filter(is_staff=True)
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


# ---------------- Journey Log ----------------
@admin.register(JourneyLog)
class JourneyLogAdmin(admin.ModelAdmin):
    list_display = ('user', 'universe', 'travel_date', 'success', 'manual_entry', 'points_awarded')
    list_filter = ('success', 'manual_entry')
    search_fields = ('user__username', 'universe__name')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "user":
            kwargs["queryset"] = User.objects.filter(is_staff=True)
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


# ---------------- Simple Registrations ----------------
admin.site.register(Admin)
admin.site.register(Booking)
admin.site.register(Artefact)


admin.site.register(Cart)
admin.site.register(CartItem)
admin.site.register(Order)
admin.site.register(OrderItem)

admin.site.register(Notification)
admin.site.register(TransactionRecord)

