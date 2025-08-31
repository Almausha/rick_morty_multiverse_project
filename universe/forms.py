from django import forms
from django.contrib.auth.models import User
from .models import Universe, PortalTimeScheduler, JourneyLog

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
from .models import PortalTimeScheduler, Universe
from datetime import date

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

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Only safe universes
        safe_universes = Universe.objects.filter(status='Safe', danger_level=0)
        self.fields['source_universe'].queryset = safe_universes
        self.fields['destination_universe'].queryset = safe_universes

    def clean_date(self):
        travel_date = self.cleaned_data.get('date')
        if travel_date < date.today():
            raise forms.ValidationError("Travel date must be in the future.")
        return travel_date
    

from django import forms
from .models import Universe

class ScheduleFilterForm(forms.Form):
    source_universe = forms.ModelChoiceField(
        queryset=Universe.objects.filter(status='Safe', danger_level=0),
        required=False,
        label="Source Universe"
    )
    destination_universe = forms.ModelChoiceField(
        queryset=Universe.objects.filter(status='Safe', danger_level=0),
        required=False,
        label="Destination Universe"
    )
    status = forms.ChoiceField(
        choices=[('', 'All'), ('Available', 'Available'), ('Booked', 'Booked'), ('Travel Failed', 'Travel Failed')],
        required=False
    )
    start_date = forms.DateField(required=False, widget=forms.DateInput(attrs={'type':'date'}))
    end_date = forms.DateField(required=False, widget=forms.DateInput(attrs={'type':'date'}))




# ---------------- JourneyLog form ----------------
class JourneyLogForm(forms.ModelForm):
    class Meta:
        model = JourneyLog
        fields = ['user', 'universe', 'success', 'manual_entry', 'points_awarded']
        widgets = {
            'success': forms.CheckboxInput(),
            'manual_entry': forms.CheckboxInput(),
        }

    def __init__(self, *args, **kwargs):
        admin_user = kwargs.pop('admin_user', None)
        super().__init__(*args, **kwargs)

        if admin_user:
            # Only allow the admin to select themselves as user
            self.fields['user'].queryset = User.objects.filter(id=admin_user.id)
            self.fields['user'].initial = admin_user

            # Filter universes by single admin field
            self.fields['universe'].queryset = Universe.objects.filter(admin=admin_user)
