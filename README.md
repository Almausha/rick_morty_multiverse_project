Rick & Morty Multiverse Project:

A Django-based web application simulating multiverse exploration, travel scheduling, artifact marketplace, and journey tracking inspired by the Rick & Morty universe. Supports both admin and user functionalities with hybrid database management.
Repository: https://github.com/Almausha/rick_morty_multiverse_project

##Features
1.Welcome Page
Landing page with Admin Login and User Sign Up/Login.


2.Admin Dashboard
Admin Login: Only specific admin usernames with password almausha:


rick → Rick admin


morty → Morty admin


rick_morty → Joint account


3.Universe Vault: Add, update, delete, and view all universes.


4.Search by name, type, or visit date.


5.Dashboard shows recent 5 visited universes, count of Safe vs Destroyed, and Travel Safe vs Dangerous universes.


6.Travel Scheduler:


7.Create schedules only for safe universes.


8.Shows availability and booked counts.


9.Recent 5 schedules in dashboard.


10.Full schedule list searchable by source, destination, and date.


11.Automatic update: If a normal user books, after the date passes the booking is auto-updated or deleted.


12.Validation: Source and destination universe cannot be the same.


13.Journey Log: Records all admin journeys.


14.Points system: Safe = 1, Unstable = 2, Destroyed = 5 points.


15.Points awarded to admin account(s) traveling.


16.Dashboard shows most visited universe and users with most points.


17.Django Admin Shortcut: View all managed data.


18.Logout: Returns to welcome page.


19.User Dashboard
User Sign Up & Login.


20.Booking Scheduler: View, wishlist, book schedules.


21.Cannot book same date twice; capacity limited.


22.Upcoming schedules displayed.


23.View booking history and search past bookings.


24.Marketplace & Rare Artifacts:


25.Browse common and rare listings.


26.Add items to cart/wishlist and checkout.


27.View order details and recent transactions.


28.Separate view for rare artifact transactions.



##Database Structure:

Hybrid approach with Django-managed tables and manually created tables:

Database Setup (Hybrid Managed/Unmanaged Tables):

1.Managed=True (Django migrations handle these):

Admin, Universe, PortalTimeScheduler, Booking, JourneyLog → Core features

2.Managed=False (Manually created/imported from SQL dump):

TransactionRecord, TravelWishlist, Artefact, Cart, CartItem, Order, OrderItem, Notification → Fully functional if SQL dump is imported

3.Django default tables (Managed=True):

LogEntry, Permission, Group, User, ContentType, Session → Authentication & permissions

Notes:

1.Some tables in the SQL dump are unused and can be ignored.

2.This hybrid setup allows combining Django-managed features with pre-existing SQL data.

Notes:
1.managed=False tables are not managed by django migration but fully functional if SQL dump is imported.


2.Some tables in the SQL dump are unused; can be ignored.


3.Django migrations only affect tables with managed=True.

4.The hybrid setup allows you to experiment with both Django ORM and raw SQL, showing flexibility in database handling while maintaining full project functionality.



####Installation & Setup

1.First:

Clone the repo:

 git clone https://github.com/Almausha/rick_morty_multiverse_project.git
cd rick_morty_multiverse_project

2.Create virtual environment:

 python -m venv venv
venv\Scripts\activate  # Windows
source venv/bin/activate  # Linux/Mac

3.Install dependencies:

 pip install -r requirements.txt

 
4.Import SQL database dump:

 source database_sql_dumps/rick_morty_multiverse_vault.sql;

5.Apply Django migrations:

 python manage.py migrate

6.Run server:

 python manage.py runserver


7.Usage
Navigate to http://127.0.0.1:8000/.


#Admin can manage universes, travel schedules, and journey logs.


#Users can book schedules, manage wishlist, browse marketplace, checkout, and track transactions.


#Admin dashboard displays analytics and points system.



#Notes
1.Admin accounts: rick, morty, rick_morty | Password: almausha


2.Database import is mandatory for full feature access.


3.Hybrid setup demonstrates Django migrations and manual SQL integration.


necessary screenshots: 
<img width="1693" height="933" alt="image" src="https://github.com/user-attachments/assets/948f438d-75be-4f0a-921c-6c780c34d5d3" />

![WhatsApp Image 2025-09-06 at 20 27 22_f145368a](https://github.com/user-attachments/assets/958af759-3ae0-486a-9096-41e9a77fc7b2)
![WhatsApp Image 2025-09-06 at 20 27 41_6cc0ff73](https://github.com/user-attachments/assets/60751d6d-2021-4eca-aae7-e4b2ab9c4829)
![WhatsApp Image 2025-09-06 at 20 32 05_ae115fff](https://github.com/user-attachments/assets/376b9746-4796-4f6f-a20b-6b3f7a330009)
![WhatsApp Image 2025-09-06 at 20 32 18_52ea6011](https://github.com/user-attachments/assets/4f51ca13-ce9d-44fb-b92b-34ab87d1855e)
![WhatsApp Image 2025-09-06 at 20 32 49_a7e2286d](https://github.com/user-attachments/assets/dc2028ae-6f93-45ea-b4fe-a51e8a2001aa)
![WhatsApp Image 2025-09-06 at 20 33 03_7797652d](https://github.com/user-attachments/assets/8d5c183c-cd61-4371-913f-fa0e816ec84c)








