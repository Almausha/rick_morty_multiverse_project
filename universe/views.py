

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.models import User

# Models & Forms
from .models import Universe, PortalTimeScheduler, JourneyLog
from .forms import UniverseForm, UniverseFilterForm, PortalTimeSchedulerForm, JourneyLogForm
from datetime import date, timedelta
from django.db.models import Count
from django.utils import timezone

# ---------------- Helper ----------------
def is_admin(user):
    return user.is_superuser or user.is_staff

def admin_required(user):
    return user.is_staff

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

# ===================== Travel Scheduler =====================
def scheduler_dashboard(request):
    PortalTimeScheduler.objects.filter(date__lt=date.today()).delete()
    schedules = PortalTimeScheduler.objects.filter(date__gte=date.today())
    total_schedules = schedules.count()
    total_booked = sum(s.booked_count for s in schedules)
    total_available = sum(s.available_slots for s in schedules)
    recent_schedules = schedules.order_by('date')[:5]

    context = {
        'total_schedules': total_schedules,
        'total_booked': total_booked,
        'total_available': total_available,
        'recent_schedules': recent_schedules,
    }
    return render(request, 'universe/scheduler/dashboard.html', context)

def scheduler_list(request):
    schedules = PortalTimeScheduler.objects.filter(date__gte=date.today()).order_by('date')
    source_universe = request.GET.get('source_universe')
    destination_universe = request.GET.get('destination_universe')
    status = request.GET.get('status')
    travel_date = request.GET.get('travel_date')

    if source_universe:
        schedules = schedules.filter(source_universe_id=source_universe)
    if destination_universe:
        schedules = schedules.filter(destination_universe_id=destination_universe)
    if travel_date:
        schedules = schedules.filter(date=travel_date)
    if status:
        schedules = [s for s in schedules if s.status == status]

    universes = Universe.objects.filter(status='Safe', danger_level=0)

    context = {
        'schedules': schedules,
        'universes': universes,
        'source_universe_selected': source_universe,
        'destination_universe_selected': destination_universe,
        'status_selected': status,
        'travel_date_selected': travel_date,
    }
    return render(request, 'universe/scheduler/list.html', context)




from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import PortalTimeSchedulerForm

def scheduler_create(request):
    if request.method == 'POST':
        form = PortalTimeSchedulerForm(request.POST)
        if form.is_valid():
            source = form.cleaned_data.get('source_universe')
            destination = form.cleaned_data.get('destination_universe')

            if source == destination:
                messages.error(request, "Source and Destination cannot be the same.")
                return render(request, 'universe/scheduler/form.html', {'form': form})

            scheduler = form.save(commit=False)
            scheduler.admin = request.user
            scheduler.save()
            messages.success(request, "Schedule created successfully!")
            return redirect('scheduler_list')
    else:
        form = PortalTimeSchedulerForm()
    return render(request, 'universe/scheduler/form.html', {'form': form})


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

def scheduler_delete(request, pk):
    schedule = get_object_or_404(PortalTimeScheduler, pk=pk)
    schedule.delete()
    messages.success(request, "Schedule deleted successfully!")
    return redirect('scheduler_list')

# ===================== Journey Logs =====================
@user_passes_test(admin_required)
def journey_dashboard(request):
    logs = JourneyLog.objects.order_by('-travel_date')
    query = request.GET.get('q')
    if query:
        logs = logs.filter(user__username__icontains=query)

    most_visited = JourneyLog.objects.values('universe__name') \
                    .annotate(visits=Count('id')) \
                    .order_by('-visits').first()

    three_days_ago = timezone.now() - timedelta(days=3)
    recent_success = JourneyLog.objects.filter(success=True, travel_date__gte=three_days_ago)
    recent_counts = recent_success.values('user__username').annotate(travel_count=Count('id'))

    context = {'logs': logs, 'most_visited': most_visited, 'recent_counts': recent_counts}
    return render(request, 'universe/journey/journey_dashboard.html', context)

@user_passes_test(admin_required)
def create_journey(request):
    if request.method == 'POST':
        form = JourneyLogForm(request.POST, admin_user=request.user)
        if form.is_valid():
            form.save()
            return redirect('journey_dashboard')
    else:
        form = JourneyLogForm(admin_user=request.user)
    return render(request, 'universe/journey/create_journey.html', {'form': form})

@user_passes_test(admin_required)
def edit_journey(request, pk):
    log = get_object_or_404(JourneyLog, pk=pk, user=request.user)
    if request.method == 'POST':
        form = JourneyLogForm(request.POST, instance=log, admin_user=request.user)
        if form.is_valid():
            form.save()
            return redirect('journey_dashboard')
    else:
        form = JourneyLogForm(instance=log, admin_user=request.user)
    return render(request, 'universe/journey/edit_journey.html', {'form': form})

@user_passes_test(admin_required)
def delete_journey(request, pk):
    log = get_object_or_404(JourneyLog, pk=pk, user=request.user)
    if request.method == 'POST':
        log.delete()
        return redirect('journey_dashboard')
    return render(request, 'universe/journey/delete_journey.html', {'log': log})






from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.models import User
from django.contrib import messages
from universe.models import PortalTimeScheduler, Booking, TravelWishlist, Universe
from datetime import date

# ===================== Welcome Page =====================
def welcome(request):
    return render(request, "universe/welcome.html", {"show_admin_nav": False})

# ===================== Admin Login =====================
def admin_login(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)
        if user is not None and user.is_staff:
            login(request, user)
            return redirect("admin_dashboard")
        else:
            messages.error(request, "Invalid admin credentials.")
    return render(request, "universe/admin_login.html")

# ===================== User Login =====================
def user_login(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)
        if user is not None and not user.is_staff:
            login(request, user)
            return redirect("user_dashboard")
        else:
            messages.error(request, "Invalid user credentials.")
    return render(request, "universe/user_login.html")

# ===================== User Signup =====================
def user_signup(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        if User.objects.filter(username=username).exists():
            messages.error(request, "Username already exists.")
        else:
            user = User.objects.create_user(username=username, password=password)
            user.is_staff = False
            user.is_superuser = False
            user.save()
            messages.success(request, "Account created! Please log in.")
            return redirect("user_login")
    return render(request, "universe/user_signup.html")

# ===================== Logout =====================
def logout_view(request):
    logout(request)
    return redirect("welcome")

# ===================== Dashboards =====================
@staff_member_required
def admin_dashboard(request):
    return render(request, "universe/admin_dashboard.html", {"show_admin_nav": True})

@login_required
def user_dashboard(request):
    return render(request, "universe/user_dashboard.html", {"show_admin_nav": False})











from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from datetime import date
from .models import PortalTimeScheduler, Booking, TravelWishlist, Universe

# ===================== User Booking Scheduler =====================
@login_required
def user_booking_scheduler(request):
    # Get all future schedules
    schedules = PortalTimeScheduler.objects.filter(date__gte=date.today()).order_by("date")

    # Apply search filters
    source = request.GET.get('source')
    destination = request.GET.get('destination')
    travel_date = request.GET.get('date')

    if source:
        schedules = schedules.filter(source_universe_id=source)
    if destination:
        schedules = schedules.filter(destination_universe_id=destination)
    if travel_date:
        schedules = schedules.filter(date=travel_date)

    # Exclude fully booked schedules
    schedules = [s for s in schedules if s.available_slots > 0]

    # Get user's booked schedule IDs
    user_booked_schedule_ids = set(
        Booking.objects.filter(user=request.user, canceled=False)
        .values_list('schedule_id', flat=True)
    )

    # Annotate schedules with already_booked flag
    for s in schedules:
        s.already_booked = s.travel_id in user_booked_schedule_ids

    # Get next upcoming booking
    upcoming_booking = Booking.objects.filter(
        user=request.user,
        schedule__date__gte=date.today(),
        canceled=False
    ).order_by('schedule__date').first()

    universes = Universe.objects.filter(status='Safe', danger_level=0)
    return render(request, 'universe/user/booking_scheduler.html', {
        'schedules': schedules,
        'universes': universes,
        'source_selected': source,
        'destination_selected': destination,
        'date_selected': travel_date,
        'upcoming_booking': upcoming_booking,
    })


# ===================== Book a Schedule =====================
@login_required
def user_book_schedule(request, schedule_id):
    schedule = get_object_or_404(PortalTimeScheduler, pk=schedule_id)

    # Check if user already booked this schedule
    if Booking.objects.filter(user=request.user, schedule=schedule, canceled=False).exists():
        messages.warning(request, "You have already booked this schedule.")
        return redirect('user_booking_scheduler')

    # Check if user has another booking on the same date
    if Booking.objects.filter(user=request.user, schedule__date=schedule.date, canceled=False).exists():
        messages.warning(request, "You already have a booking on this date. Cannot book multiple schedules on the same day.")
        return redirect('user_booking_scheduler')

    # Check if schedule has available slots
    if schedule.available_slots <= 0:
        messages.error(request, "No slots available for this schedule.")
        return redirect('user_booking_scheduler')

    # Book the schedule
    Booking.objects.create(user=request.user, schedule=schedule)

    # Auto-remove from wishlist if exists
    TravelWishlist.objects.filter(user=request.user, schedule=schedule).delete()

    messages.success(request, f"Schedule {schedule} booked successfully!")
    return redirect('user_booking_history')


# ===================== Wishlist =====================
@login_required
def user_add_to_wishlist(request, schedule_id):
    schedule = get_object_or_404(PortalTimeScheduler, pk=schedule_id)
    TravelWishlist.objects.get_or_create(user=request.user, schedule=schedule)
    messages.success(request, f"{schedule} added to wishlist.")
    return redirect('user_wishlist')


@login_required
def user_wishlist(request):
    wishlist = TravelWishlist.objects.filter(user=request.user)
    search_query = request.GET.get('q')
    if search_query:
        wishlist = wishlist.filter(
            schedule__source_universe__name__icontains=search_query
        ) | wishlist.filter(
            schedule__destination_universe__name__icontains=search_query
        )
    return render(request, 'universe/user/wishlist.html', {'wishlist': wishlist})


@login_required
def user_remove_from_wishlist(request, wishlist_id):
    item = get_object_or_404(TravelWishlist, pk=wishlist_id)
    item.delete()
    messages.success(request, "Item removed from wishlist.")
    return redirect('user_wishlist')


# ===================== Booking History =====================
@login_required
def user_booking_history(request):
    bookings = Booking.objects.filter(user=request.user).order_by('-schedule__date')

    search_date = request.GET.get('date')
    source = request.GET.get('source')
    destination = request.GET.get('destination')

    if search_date:
        bookings = bookings.filter(schedule__date=search_date)
    if source:
        bookings = bookings.filter(schedule__source_universe_id=int(source))
    if destination:
        bookings = bookings.filter(schedule__destination_universe_id=int(destination))

    # Upcoming booking (nearest future booking)
    upcoming_booking = Booking.objects.filter(
        user=request.user,
        schedule__date__gte=date.today(),
        canceled=False
    ).order_by('schedule__date').first()

    universes = Universe.objects.filter(status='Safe', danger_level=0)
    return render(request, 'universe/user/booking_history.html', {
        'bookings': bookings,
        'upcoming_booking': upcoming_booking,
        'universes': universes,
        'source_selected': source,
        'destination_selected': destination,
        'date_selected': search_date,
    })
