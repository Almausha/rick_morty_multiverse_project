from django.db import models

class Admin(models.Model):
    admin_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=10)
    password = models.CharField(max_length=10)
    role = models.TextField()
    email = models.CharField(max_length=50)

    def __str__(self):
        return self.username


from django.db import models
from django.contrib.auth.models import User  # ✅ built-in User for admin

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
    danger_level = models.IntegerField(
        default=0,
        choices=[(0, 'Low'), (1, 'High')]  # ✅ only Low or High
    )
    description = models.TextField(blank=True)

    # ✅ admin linked to Django's built-in User table
    admin = models.ForeignKey(User, on_delete=models.DO_NOTHING, null=True, blank=True)

    class Meta:
        ordering = ['universe_id']

    def __str__(self):
        return self.name

    def get_danger_display(self):
        return "Low" if self.danger_level == 0 else "High"

    def is_travel_safe(self):
        return self.status == 'Safe' and self.danger_level == 0



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


class Auction(models.Model):
    auction_id = models.AutoField(primary_key=True)
    starting_bidding_price = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Auction {self.auction_id}"


class Marketplace(models.Model):
    marketplace_id = models.AutoField(primary_key=True)
    price = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Marketplace {self.marketplace_id}"


class PortalTimeScheduler(models.Model):
    travel_id = models.AutoField(primary_key=True)
    source = models.TextField()
    destination = models.TextField()
    date = models.DateField()
    max_capacity = models.IntegerField()
    status = models.TextField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Travel {self.travel_id}"


class JourneyLog(models.Model):
    log_id = models.AutoField(primary_key=True)
    destination = models.TextField()
    date = models.DateField()
    status = models.TextField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Log {self.log_id}"


class RandomEvent(models.Model):
    event_id = models.AutoField(primary_key=True)
    name = models.TextField()
    effect = models.CharField(max_length=50)
    date_triggered = models.DateField()
    a = models.ForeignKey(Artefact, on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name


class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.TextField()
    email = models.CharField(max_length=30)
    reg_date = models.DateField()
    address = models.CharField(max_length=30)
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)
    u = models.ForeignKey(Universe, on_delete=models.DO_NOTHING)
    tr = models.ForeignKey(PortalTimeScheduler, on_delete=models.DO_NOTHING)
    m = models.ForeignKey(Marketplace, on_delete=models.DO_NOTHING)
    au = models.ForeignKey(Auction, on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name