from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User  # built-in User for admin & normal users
from datetime import timedelta
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.db.models import F





class Admin(models.Model):
    admin_id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    role = models.TextField(blank=True)
    email = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return self.user.username if self.user else "No User Assigned"


# ---------------- Universe ----------------
class Universe(models.Model):
    STATUS_CHOICES = [
        ('Safe', 'Safe'),
        ('Destroyed', 'Destroyed'),
        ('Unstable', 'Unstable'),
        ('Unknown', 'Unknown'),
    ]
    UNIVERSE_TYPES = [
        ('Prime', 'Prime'),
        ('Cronenberg', 'Cronenberg'),
        ('Fantasy', 'Fantasy'),
        ('Post-Apocalyptic', 'Post-Apocalyptic'),
        ('Virtual', 'Virtual'),
        ('Unknown', 'Unknown'),
    ]
    universe_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)
    universe_type = models.CharField(max_length=50, choices=UNIVERSE_TYPES, default='Unknown')
    visit_date = models.DateField(null=True, blank=True)
    destroyed_date = models.DateField(null=True, blank=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='Unknown')
    visited_intergalactic_beings = models.TextField(blank=True)
    danger_level = models.IntegerField(default=0, choices=[(0,'Low'),(1,'High')])
    description = models.TextField(blank=True)
    admin = models.ForeignKey(User, on_delete=models.DO_NOTHING, null=True, blank=True)

    class Meta:
        ordering = ['universe_id']

    def __str__(self):
        return self.name

    def get_danger_display(self):
        return "Low" if self.danger_level == 0 else "High"

    def is_travel_safe(self):
        return self.status=='Safe' and self.danger_level==0


# ---------------- Artefact ----------------
class Artefact(models.Model):
    artefact_id = models.AutoField(primary_key=True)
    name = models.TextField()
    price = models.IntegerField()
    collection_date = models.DateField()
    details = models.TextField()
    origin_universe_id = models.TextField()
    artefact_type = models.TextField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)
    u = models.ForeignKey(Universe, on_delete=models.DO_NOTHING)
    rare_artifact = models.TextField()
    common_artifact = models.TextField()

    def __str__(self):
        return self.name


# ---------------- Auction ----------------
class Auction(models.Model):
    auction_id = models.AutoField(primary_key=True)
    starting_bidding_price = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Auction {self.auction_id}"


# ---------------- Marketplace ----------------
class Marketplace(models.Model):
    marketplace_id = models.AutoField(primary_key=True)
    price = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Marketplace {self.marketplace_id}"
    



  #Random event
    
class RandomEvent(models.Model):
    event_id = models.AutoField(primary_key=True)
    name = models.TextField()
    effect = models.CharField(max_length=50)
    date_triggered = models.DateField()
    a = models.ForeignKey('Artefact', on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name







from django.db import models
from django.contrib.auth.models import User
from datetime import date

class PortalTimeScheduler(models.Model):
    travel_id = models.AutoField(primary_key=True)
    source_universe = models.ForeignKey(
        'Universe', on_delete=models.SET_NULL, null=True, related_name='source_travel'
    )
    destination_universe = models.ForeignKey(
        'Universe', on_delete=models.SET_NULL, null=True, related_name='destination_travel'
    )
    date = models.DateField()
    max_capacity = models.IntegerField(default=10)
    admin = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"{self.source_universe.name} → {self.destination_universe.name} on {self.date}"

    # ---------------- Helper Properties ----------------
    @property
    def booked_count(self):
        # Replace 'booking_set' with actual related_name if you have a Booking model
        return getattr(self, 'booking_set', []).filter(canceled=False).count() if hasattr(self, 'booking_set') else 0

    @property
    def available_slots(self):
        return max(self.max_capacity - self.booked_count, 0)

    @property
    def status(self):
        if self.available_slots <= 0:
            return "Booked"
        elif self.date < date.today():
            return "Travel Failed"
        else:
            return "Available"


#Booking




# universe/models.py

class Booking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='bookings')
    schedule = models.ForeignKey(
        PortalTimeScheduler,
        on_delete=models.CASCADE,
        related_name='booking_set',
        null=True,
        blank=True
    )
    canceled = models.BooleanField(default=False)
    booked_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        if self.schedule:
            schedule_name = f"{self.schedule.source_universe.name} → {self.schedule.destination_universe.name} on {self.schedule.date} (ID: {self.schedule.travel_id})"
        else:
            schedule_name = "No Schedule"
        return f"{self.user.username} → {schedule_name}"






# Journey Log
class JourneyLog(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    universe = models.ForeignKey(Universe, on_delete=models.SET_NULL, null=True)
    travel_date = models.DateTimeField(auto_now_add=True)
    points_awarded = models.IntegerField(default=0)
    success = models.BooleanField(default=True)
    manual_entry = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.user} -> {self.universe} at {self.travel_date}"
    















from django.db import models
from django.contrib.auth.models import User
from .models import PortalTimeScheduler  # adjust if necessary

class TravelWishlist(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='wishlist')
    schedule = models.ForeignKey(PortalTimeScheduler, on_delete=models.CASCADE)
    added_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False  # Django won't try to create or migrate this table
        db_table = "universe_travelwishlist"  # Matches your manually created table
        verbose_name = "Travel Wishlist"
        verbose_name_plural = "Travel Wishlists"
        ordering = ['-added_at']

    def __str__(self):
        return f"{self.user.username} → {self.schedule}"

