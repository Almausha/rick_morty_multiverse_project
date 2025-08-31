from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from .forms import PortalTimeSchedulerForm
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from django.contrib import messages


# Models & Forms

from .forms import UniverseForm, UniverseFilterForm

from .models import Universe, PortalTimeScheduler

# ---------------- Helper ----------------
def is_admin(user):
    return user.is_superuser or user.is_staff

# ===================== Universe Vault =====================
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

def universe_create(request):
    if request.method == 'POST':
        form = UniverseForm(request.POST)
        if form.is_valid():
            universe = form.save(commit=False)
            universe.admin = request.user
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
                universe.admin = request.user
            universe.save()
            messages.success(request, 'Universe updated!')
            return redirect('universe_list')
    else:
        form = UniverseForm(instance=universe)
    return render(request, 'universe/universe_form.html', {'form': form})

def universe_delete(request, pk):
    universe = get_object_or_404(Universe, pk=pk)
    if request.method == 'POST':
        universe.delete()
        messages.success(request, 'Universe deleted!')
        return redirect('universe_list')
    return render(request, 'universe/universe_confirm_delete.html', {'universe': universe})

# universe/views.py

from django.shortcuts import render
from .models import PortalTimeScheduler

# universe/views.py
from django.shortcuts import render
from .models import PortalTimeScheduler

def scheduler_dashboard(request):
    schedules = PortalTimeScheduler.objects.all()
    
    total_schedules = schedules.count()
    total_booked = sum(s.booking_set.filter(canceled=False).count() for s in schedules)
    total_available = sum(s.max_capacity - s.booking_set.filter(canceled=False).count() for s in schedules)
    recent_schedules = schedules.order_by('-date')[:5]

    context = {
        'total_schedules': total_schedules,
        'total_booked': total_booked,
        'total_available': total_available,
        'recent_schedules': recent_schedules,
    }
    return render(request, 'universe/scheduler/dashboard.html', context)







# ---------------- List ----------------
def scheduler_list(request):
    schedules = PortalTimeScheduler.objects.all().order_by('-date')
    return render(request, 'universe/scheduler/list.html', {'schedules': schedules})

# ---------------- Create ----------------
def scheduler_create(request):
    if request.method == 'POST':
        form = PortalTimeSchedulerForm(request.POST)
        if form.is_valid():
            scheduler = form.save(commit=False)
            scheduler.admin = request.user
            scheduler.save()
            messages.success(request, "Schedule created successfully!")
            return redirect('scheduler_list')
    else:
        form = PortalTimeSchedulerForm()
    return render(request, 'universe/scheduler/form.html', {'form': form})

# ---------------- Update ----------------
def scheduler_update(request, pk):
    schedule = get_object_or_404(PortalTimeScheduler, pk=pk)
    if request.method == 'POST':
        form = PortalTimeSchedulerForm(request.POST, instance=schedule)
        if form.is_valid():
            form.save()
            messages.success(request, "Schedule updated successfully!")
            return redirect('scheduler_list')
    else:
        form = PortalTimeSchedulerForm(instance=schedule)
    return render(request, 'universe/scheduler/form.html', {'form': form})

# ---------------- Delete ----------------
def scheduler_delete(request, pk):
    schedule = get_object_or_404(PortalTimeScheduler, pk=pk)
    schedule.delete()
    messages.success(request, "Schedule deleted successfully!")
    return redirect('scheduler_list')





from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import user_passes_test
from .models import JourneyLog, Universe
from .forms import JourneyLogForm
from django.db.models import Count
from django.utils import timezone
from datetime import timedelta

def admin_required(user):
    return user.is_staff

@user_passes_test(admin_required)
def journey_dashboard(request):
    logs = JourneyLog.objects.order_by('-travel_date')
    
    # Search
    query = request.GET.get('q')
    if query:
        logs = logs.filter(user__username__icontains=query)

    # Most visited universe
    most_visited = JourneyLog.objects.values('universe__name') \
                    .annotate(visits=Count('id')) \
                    .order_by('-visits').first()

    # Recent 3-day reward points
    three_days_ago = timezone.now() - timedelta(days=3)
    recent_success = JourneyLog.objects.filter(success=True, travel_date__gte=three_days_ago)
    recent_counts = recent_success.values('user__username').annotate(travel_count=Count('id'))

    context = {
        'logs': logs,
        'most_visited': most_visited,
        'recent_counts': recent_counts,
    }
    return render(request, 'universe/journey/journey_dashboard.html', context)


@user_passes_test(admin_required)
def create_journey(request):
    if request.method == 'POST':
        form = JourneyLogForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('journey_dashboard')
    else:
        form = JourneyLogForm()
    return render(request, 'universe/journey/create_journey.html', {'form': form})


@user_passes_test(admin_required)
def edit_journey(request, pk):
    log = get_object_or_404(JourneyLog, pk=pk)
    if request.method == 'POST':
        form = JourneyLogForm(request.POST, instance=log)
        if form.is_valid():
            form.save()
            return redirect('journey_dashboard')
    else:
        form = JourneyLogForm(instance=log)
    return render(request, 'universe/journey/edit_journey.html', {'form': form})


@user_passes_test(admin_required)
def delete_journey(request, pk):
    log = get_object_or_404(JourneyLog, pk=pk)
    if request.method == 'POST':
        log.delete()
        return redirect('journey_dashboard')
    return render(request, 'universe/journey/delete_journey.html', {'log': log})






