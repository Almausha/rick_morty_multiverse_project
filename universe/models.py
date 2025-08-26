from django.db import models

class Admin(models.Model):
    admin_id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=10)
    password = models.CharField(max_length=10)
    role = models.TextField()
    email = models.CharField(max_length=50)

    def __str__(self):
        return self.username


class Universe(models.Model):
    universe_id = models.IntegerField(primary_key=True)
    name = models.TextField()
    universe_type = models.TextField()
    visit_date = models.DateField(null=True, blank=True)
    destroyed_date = models.DateField(null=True, blank=True)
    status = models.TextField()
    visited_intergalectic_beings = models.TextField()
    danger_level = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name


class Artefact(models.Model):
    artefact_id = models.IntegerField(primary_key=True)
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
    auction_id = models.IntegerField(primary_key=True)
    starting_bidding_price = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Auction {self.auction_id}"


class Marketplace(models.Model):
    marketplace_id = models.IntegerField(primary_key=True)
    price = models.IntegerField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Marketplace {self.marketplace_id}"


class PortalTimeScheduler(models.Model):
    travel_id = models.IntegerField(primary_key=True)
    source = models.TextField()
    destination = models.TextField()
    date = models.DateField()
    max_capacity = models.IntegerField()
    status = models.TextField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Travel {self.travel_id}"


class JourneyLog(models.Model):
    log_id = models.IntegerField(primary_key=True)
    destination = models.TextField()
    date = models.DateField()
    status = models.TextField()
    a = models.ForeignKey(Admin, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f"Log {self.log_id}"


class RandomEvent(models.Model):
    event_id = models.IntegerField(primary_key=True)
    name = models.TextField()
    effect = models.CharField(max_length=50)
    date_triggered = models.DateField()
    a = models.ForeignKey(Artefact, on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name


class User(models.Model):
    user_id = models.IntegerField(primary_key=True)
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