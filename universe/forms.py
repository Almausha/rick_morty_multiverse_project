from django import forms
from .models import Universe, PortalTimeScheduler
import datetime

# ---------------- Universe forms ----------------
class UniverseForm(forms.ModelForm):
    class Meta:
        model = Universe
        fields = ['name', 'universe_type', 'visit_date', 'destroyed_date', 'status',
                  'visited_intergalactic_beings', 'danger_level', 'description']
        widgets = {
            'visit_date': forms.DateInput(attrs={'type': 'date'}),
            'destroyed_date': forms.DateInput(attrs={'type': 'date'}),
            'description': forms.Textarea(attrs={'rows': 3}),
            'visited_intergalactic_beings': forms.Textarea(attrs={'rows': 2}),
            'danger_level': forms.Select(choices=[(0, 'Low'), (1, 'High')])
        }

class UniverseFilterForm(forms.Form):
    search_name = forms.CharField(required=False, label='Search by Name')
    status = forms.ChoiceField(choices=[('', 'All')] + Universe.STATUS_CHOICES, required=False)
    universe_type = forms.ChoiceField(choices=[('', 'All')] + Universe.UNIVERSE_TYPES, required=False)
    danger_level = forms.ChoiceField(choices=[('', 'All'), ('Low', 'Low'), ('High', 'High')], required=False)


from django import forms
from .models import PortalTimeScheduler

class PortalTimeSchedulerForm(forms.ModelForm):
    class Meta:
        model = PortalTimeScheduler
        fields = ['source_universe', 'destination_universe', 'date', 'max_capacity']
        widgets = {
            'date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
            'max_capacity': forms.NumberInput(attrs={'class': 'form-control'}),
            'source_universe': forms.Select(attrs={'class': 'form-select'}),
            'destination_universe': forms.Select(attrs={'class': 'form-select'}),
        }

