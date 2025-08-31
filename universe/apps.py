



from django.apps import AppConfig

class UniverseConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'universe'

    def ready(self):
        import universe.signals  # registers the signal


