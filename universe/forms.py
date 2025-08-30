from django import forms
from .models import Universe

class UniverseForm(forms.ModelForm):
    class Meta:
        model = Universe
        fields = '__all__'
        widgets = {
            'visit_date': forms.DateInput(attrs={'type': 'date'}),
            'destroyed_date': forms.DateInput(attrs={'type': 'date'}),
            'description': forms.Textarea(attrs={'rows': 3}),
            'visited_intergalactic_beings': forms.Textarea(attrs={'rows': 2}),
            'danger_level': forms.Select(choices=[(0, 'Low'), (1, 'High')])  # only 0 or 1
        }

class UniverseFilterForm(forms.Form):
    search_name = forms.CharField(required=False, label='Search by Name')
    status = forms.ChoiceField(choices=[('', 'All')] + Universe.STATUS_CHOICES, required=False)
    universe_type = forms.ChoiceField(choices=[('', 'All')] + Universe.UNIVERSE_TYPES, required=False)
    danger_level = forms.ChoiceField(
        choices=[('', 'All'), ('Low', 'Low'), ('High', 'High')],  # only Low/High
        required=False
    )

