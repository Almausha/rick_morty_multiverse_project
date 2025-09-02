

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


from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.models import User
from django.contrib import messages
from universe.models import PortalTimeScheduler, Booking, TravelWishlist, Universe
from datetime import date







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

from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import UniverseForm

def universe_create(request):
    if request.method == 'POST':
        form = UniverseForm(request.POST)
        if form.is_valid():
            universe = form.save(commit=False)
            # If admin selected from dropdown, use it; otherwise, default to current user
            if form.cleaned_data.get('admin'):
                universe.admin = form.cleaned_data['admin']
            else:
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












from django.db.models import Sum, Count
from django.shortcuts import render
from .models import JourneyLog
from django.contrib.auth.models import User

def journey_dashboard(request):
    logs = JourneyLog.objects.all().order_by('-travel_date')

    # Filters
    username = request.GET.get('username', '').strip()
    points = request.GET.get('points', '').strip()
    date = request.GET.get('date', '').strip()

    if username:
        logs = logs.filter(user__username__iexact=username)  # exact, case-insensitive

    if points:
        try:
            logs = logs.filter(points_awarded=int(points))  # exact match
        except ValueError:
            pass

    if date:
        logs = logs.filter(travel_date__date=date)

    # Last 5 journeys
    last_five = logs[:5]

    # Most visited universe
    most_visited = logs.values('universe__name')\
                       .annotate(visits=Count('universe'))\
                       .order_by('-visits').first()

    # Top points earned by a user
    points_summary = logs.values('user__username')\
                         .annotate(total_points=Sum('points_awarded'))\
                         .order_by('-total_points').first()

    # Total points per user
    total_points_per_user = logs.values('user__username')\
                                .annotate(total_points=Sum('points_awarded'))\
                                .order_by('-total_points')

    return render(request, 'universe/journey_dashboard.html', {
        'logs': last_five,
        'most_visited': most_visited,
        'points_summary': points_summary,
        'total_points_per_user': total_points_per_user,
        'request': request
    })


def full_journey_list(request):
    logs = JourneyLog.objects.all().order_by('-travel_date')

    # Filters
    username = request.GET.get('username', '').strip()
    points = request.GET.get('points', '').strip()
    date = request.GET.get('date', '').strip()

    if username:
        logs = logs.filter(user__username__iexact=username)  # exact, case-insensitive

    if points:
        try:
            logs = logs.filter(points_awarded=int(points))  # exact match
        except ValueError:
            pass

    if date:
        logs = logs.filter(travel_date__date=date)

    return render(request, 'universe/full_journey_list.html', {
        'logs': logs,
        'request': request
    })




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





@staff_member_required
def admin_dashboard(request):
    """Admin dashboard for managing rare artefacts (no auctions)"""
    rare_artefacts = Artefact.objects.filter(is_rare=True, quantity=1, listed=True)

    if request.method == "POST":
        artefact_id = request.POST.get("artefact_id")
        artefact = get_object_or_404(Artefact, artefact_id=artefact_id)

        # Example action: unlist artefact directly (or mark as sold, etc.)
        artefact.listed = False
        artefact.save()

        return redirect("admin_dashboard")  # reload page to show updated list

    return render(
        request,
        "universe/admin_dashboard.html",
        {
            "show_admin_nav": True,
            "rare_artefacts": rare_artefacts,
        },
    )



@login_required
def user_dashboard(request):
    return render(request, "universe/user_dashboard.html", {"show_admin_nav": False})





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



















# universe/views.py
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.utils import timezone
from django.db import transaction
from django.db.models import F
from django.http import JsonResponse
from .models import Artefact, Cart, CartItem, Order, OrderItem,  Notification, TransactionRecord

# ---------------- Marketplace ----------------
@login_required
def marketplace_list(request):
    """List all common artefacts with quantity > 1 and optional search by name or price"""
    artifacts = Artefact.objects.filter(is_common=True, quantity__gt=1, listed=True).order_by('-created_at')

    # Search by artifact name
    search_name = request.GET.get('name')
    if search_name:
        artifacts = artifacts.filter(name__icontains=search_name)

    # Search by price range
    min_price = request.GET.get('min_price')
    max_price = request.GET.get('max_price')
    if min_price:
        artifacts = artifacts.filter(price__gte=min_price)
    if max_price:
        artifacts = artifacts.filter(price__lte=max_price)

    return render(request, 'universe/marketplace_list.html', {'artifacts': artifacts})


@login_required
def artefact_detail(request, pk):
    """Detail view of a single artefact"""
    artefact = get_object_or_404(Artefact, artefact_id=pk)
    return render(request, 'universe/artefact_detail.html', {'artefact': artefact})


@login_required
def add_to_cart(request, pk):
    """Add an artefact to the user's cart with chosen quantity"""
    artefact = get_object_or_404(Artefact, artefact_id=pk)

    if artefact.quantity <= 0:
        return redirect('marketplace_list')

    # Get quantity from POST, default to 1
    try:
        qty = int(request.POST.get('quantity', 1))
    except ValueError:
        qty = 1

    if qty < 1:
        qty = 1
    if qty > artefact.quantity:
        qty = artefact.quantity  # cannot exceed stock

    cart, _ = Cart.objects.get_or_create(user=request.user)
    item, created = CartItem.objects.get_or_create(cart=cart, artefact=artefact)

    if not created:
        # Update quantity, ensure it does not exceed stock
        item.quantity = min(item.quantity + qty, artefact.quantity)
    else:
        item.quantity = qty

    item.save()
    return redirect('cart_view')










@login_required
def cart_view(request):
    """Display the user's cart"""
    cart, _ = Cart.objects.get_or_create(user=request.user)
    return render(request, 'universe/cart.html', {'cart': cart})

@login_required
def remove_cart_item(request, item_id):
    """Remove a cart item"""
    item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    item.delete()
    return redirect('cart_view')

@login_required
@login_required
def checkout(request):
    """Checkout: convert cart to order and deduct quantities atomically"""
    cart = get_object_or_404(Cart, user=request.user)
    if request.method == 'POST':
        with transaction.atomic():
            total = sum(ci.artefact.price * ci.quantity for ci in cart.items.select_related('artefact'))
            order = Order.objects.create(user=request.user, total=total, status='paid')
            for ci in cart.items.select_related('artefact'):
                arte = Artefact.objects.select_for_update().get(pk=ci.artefact.pk)
                if arte.quantity < ci.quantity:
                    transaction.set_rollback(True)
                    return render(request, 'universe/checkout_error.html', {
                        'error': f"Not enough stock for {arte.name}"
                    })
                arte.quantity = F('quantity') - ci.quantity
                arte.save()
                arte.refresh_from_db()
                OrderItem.objects.create(order=order, artefact=arte, price=arte.price, quantity=ci.quantity)
                TransactionRecord.objects.create(
                    user=request.user,
                    artefact=arte,
                    tx_type='purchase',
                    price=ci.artefact.price * ci.quantity
                )
            cart.items.all().delete()
        return redirect('order_detail', order_id=order.order_id)
    return render(request, 'universe/checkout.html', {'cart': cart})


@login_required
def order_detail(request, order_id):
    """Order details for a user"""
    order = get_object_or_404(Order, order_id=order_id, user=request.user)
    return render(request, 'universe/order_detail.html', {'order': order})




# ---------------- User Dashboard ----------------
from django.db.models import Sum
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import TransactionRecord


@login_required
def user_dashboard(request):
    # Only transactions (no bids anymore)
    recent_tx = TransactionRecord.objects.filter(user=request.user).order_by('-created_at')[:5]

    total_spent = TransactionRecord.objects.filter(user=request.user).aggregate(
        total=Sum('price')
    )['total'] or 0

    return render(request, 'universe/user_dashboard.html', {
        'recent_tx': recent_tx,
        'total_spent': total_spent,
    })


@login_required
def transactions_search(request):
    qs = TransactionRecord.objects.filter(user=request.user)

    # Search by artefact name
    q = request.GET.get('q')
    if q:
        qs = qs.filter(artefact__name__icontains=q)

    # Date range filter
    date_from = request.GET.get('from')
    if date_from:
        qs = qs.filter(created_at__date__gte=date_from)

    date_to = request.GET.get('to')
    if date_to:
        qs = qs.filter(created_at__date__lte=date_to)

    return render(request, 'universe/transactions.html', {'records': qs})





@login_required
def checkout_single_item(request, item_id):
    """
    Checkout a single cart item.
    """
    item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)

    with transaction.atomic():
        arte = Artefact.objects.select_for_update().get(pk=item.artefact.pk)
        if arte.quantity < item.quantity:
            transaction.set_rollback(True)
            return render(
                request,
                'universe/checkout_error.html',
                {'error': f"Not enough stock for '{arte.name}'"}
            )

        # Deduct quantity
        arte.quantity = F('quantity') - item.quantity
        arte.save()
        arte.refresh_from_db()

        # Create order for this single item
        order = Order.objects.create(user=request.user, total=item.subtotal(), status='paid')
        OrderItem.objects.create(order=order, artefact=arte, price=arte.price, quantity=item.quantity)

        # Record transaction
        TransactionRecord.objects.create(
            user=request.user,
            artefact=arte,
            tx_type='purchase',
            price=item.subtotal()
        )

        # Remove item from cart
        item.delete()

    return redirect('order_detail', order_id=order.order_id)







@login_required
def rare_artefact_list(request):
    """List all rare artefacts with search by name or price"""
    artefacts = Artefact.objects.filter(is_common=False, listed=True).order_by('-created_at')

    # Search by name
    search_name = request.GET.get('name')
    if search_name:
        artefacts = artefacts.filter(name__icontains=search_name)

    # Search by price
    min_price = request.GET.get('min_price')
    max_price = request.GET.get('max_price')
    if min_price:
        artefacts = artefacts.filter(price__gte=min_price)
    if max_price:
        artefacts = artefacts.filter(price__lte=max_price)

    return render(request, 'universe/rare_artefact_list.html', {
        'artefacts': artefacts,
        'message': "🎯 Grab your antics now!"
    })


@login_required
def rare_transactions_search(request):
    """Rare artefact transactions history"""
    qs = TransactionRecord.objects.filter(user=request.user, artefact__is_common=False)

    q = request.GET.get('q')
    if q:
        qs = qs.filter(artefact__name__icontains=q)

    date_from = request.GET.get('from')
    if date_from:
        qs = qs.filter(created_at__date__gte=date_from)

    date_to = request.GET.get('to')
    if date_to:
        qs = qs.filter(created_at__date__lte=date_to)

    return render(request, 'universe/rare_transactions.html', {'records': qs})



@login_required
def update_cart_item(request, item_id):
    """Update quantity of a cart item"""
    item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    if request.method == 'POST':
        qty = int(request.POST.get('quantity', 1))
        if qty > 0 and qty <= item.artefact.quantity:
            item.quantity = qty
            item.save()
    return redirect('cart_view')










