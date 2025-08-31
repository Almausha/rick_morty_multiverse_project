from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone
from .models import Universe, JourneyLog

@receiver(post_save, sender=Universe)
def log_admin_universe_action(sender, instance, created, **kwargs):
    if instance.admin:  # Ensure admin exists
        today = timezone.now().date()
        existing = JourneyLog.objects.filter(
            user=instance.admin,
            universe=instance,
            travel_date__date=today
        ).exists()
        if not existing:
            points = 1
            if instance.status == 'Destroyed':
                points = 5
            elif instance.status == 'Unstable':
                points = 2

            JourneyLog.objects.create(
                user=instance.admin,
                universe=instance,
                travel_date=timezone.now(),
                points_awarded=points,
                success=True,
                manual_entry=False
            )
