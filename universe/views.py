from django.shortcuts import render, redirect, get_object_or_404
from .models import Universe
from .forms import UniverseForm, UniverseFilterForm
from django.contrib import messages

def universe_dashboard(request):
    safe_universes = Universe.objects.filter(status='Safe').count()
    destroyed_universes = Universe.objects.filter(status='Destroyed').count()
    high_danger_universes = Universe.objects.filter(danger_level=1).count()
    travel_safe_universes = Universe.objects.filter(status='Safe', danger_level=0).count()
    recent_universes = Universe.objects.order_by('-universe_id')[:5]

    return render(request, 'universe/dashboard.html', {
        'safe_universes': safe_universes,
        'destroyed_universes': destroyed_universes,
        'high_danger_universes': high_danger_universes,
        'travel_safe_universes': travel_safe_universes,
        'recent_universes': recent_universes
    })


# List + Filter
def universe_list(request):
    universes = Universe.objects.all()
    form = UniverseFilterForm(request.GET)
    if form.is_valid():
        if form.cleaned_data['search_name']:
            universes = universes.filter(name__icontains=form.cleaned_data['search_name'])
        if form.cleaned_data['status']:
            universes = universes.filter(status=form.cleaned_data['status'])
        if form.cleaned_data['universe_type']:
            universes = universes.filter(universe_type=form.cleaned_data['universe_type'])
        if form.cleaned_data['danger_level']:
            level = form.cleaned_data['danger_level']
            if level == 'Low':
                universes = universes.filter(danger_level=0)
            elif level == 'High':
                universes = universes.filter(danger_level=1)

    return render(request, 'universe/universe_list.html', {'universes': universes, 'form': form})


# Add / Update
def universe_create(request):
    if request.method == 'POST':
        form = UniverseForm(request.POST)
        if form.is_valid():
            universe = form.save(commit=False)  # Don't save yet
            universe.admin = request.user       # Assign logged-in user
            universe.save()
            messages.success(request, 'Universe added!')
            return redirect('universe_list')
    else:
        form = UniverseForm()
    return render(request, 'universe/universe_form.html', {'form': form})


def universe_update(request, pk):
    universe = get_object_or_404(Universe, pk=pk)
    if request.method == 'POST':
        form = UniverseForm(request.POST, instance=universe)
        if form.is_valid():
            universe = form.save(commit=False)
            if not universe.admin:
                universe.admin = request.user  # Assign if missing
            universe.save()
            messages.success(request, 'Universe updated!')
            return redirect('universe_list')
    else:
        form = UniverseForm(instance=universe)
    return render(request, 'universe/universe_form.html', {'form': form})


# Delete
def universe_delete(request, pk):
    universe = get_object_or_404(Universe, pk=pk)
    if request.method == 'POST':
        universe.delete()
        messages.success(request, 'Universe deleted!')
        return redirect('universe_list')
    return render(request, 'universe/universe_confirm_delete.html', {'universe': universe})
