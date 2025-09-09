RICK_MORTY_MULTIVERSE_VAULT

Rick & Morty Multiverse Project:


#A Django-based web application simulating multiverse exploration, travel scheduling, artifact marketplace, and journey tracking inspired by the Rick & Morty universe. Supports both admin and user functionalities with hybrid database management.#


Repository: https://github.com/Almausha/rick_morty_multiverse_project


##Features###


1.Welcome Page
Landing page with Admin Login and User Sign Up/Login.


2.Admin Dashboard
Admin Login: Only specific admin usernames with password almausha:


rick → Rick admin


morty → Morty admin


rick_morty → Joint account


3.Universe Vault: 

   -Add, update, delete, and view all universes.


   -Search by name, type, or visit date.


   -Dashboard shows recent 5 visited universes, count of Safe vs Destroyed, and Travel Safe vs Dangerous universes.


4.Travel Scheduler:


   -Create schedules only for safe universes.


   -Shows availability and booked counts.


   -Recent 5 schedules in dashboard.


   -Full schedule list searchable by source, destination, and date.


   -Automatic update: If a normal user books, after the date passes the booking is auto-updated or deleted.


   -Validation: Source and destination universe cannot be the same.


5.Journey Log:

   -Records all admin journeys.


   -Points system: Safe = 1, Unstable = 2, Destroyed = 5 points.


   -Points awarded to admin account(s) traveling.


   -Dashboard shows most visited universe and users with most points.


6.Django Admin Shortcut: View all managed data.


7.Logout: Returns to welcome page.


8.User Dashboard
         
   -User Sign Up & Login.


9.Booking Scheduler: 


   -View, wishlist, book schedules.


   -Cannot book same date twice; capacity limited.


   -Upcoming schedules displayed.


   -View booking history and search past bookings.


10.Marketplace & Rare Artifacts:


   -Browse common and rare listings.


   -Add items to cart and checkout or delete.


   -View order details and recent transactions and total transaction.


   -Separate view for rare artifact transactions.



##Database Structure##

Hybrid approach with Django-managed tables and manually created tables using MariaDB.


##Database Setup (Hybrid Managed/Unmanaged Tables):

1.Managed=True (Django migrations handle these):

   -Admin, Universe, PortalTimeScheduler, Booking, JourneyLog → Core features

2.Managed=False (Manually created/imported from SQL dump):

   -TransactionRecord, TravelWishlist, Artefact, Cart, CartItem, Order, OrderItem, Notification → Fully functional if SQL dump is imported

3.Django default tables (Managed=True):

   -LogEntry, Permission, Group, User, ContentType, Session → Authentication & permissions



##Notes:

1.managed=False tables are not managed by django migration but fully functional if SQL dump is imported.


2.Some tables in the SQL dump are unused; can be ignored.


3.Django migrations only affect tables with managed=True.


4.The hybrid setup allows  to combine Django-managed features with pre-existing SQL data and to experiment with both Django ORM and raw SQL, showing flexibility in database handling while maintaining full project functionality.



##Installation & Setup##

1.First Clone the repo:

 -Open your Windows Powershell or command prompt and type:

   git clone https://github.com/Almausha/rick_morty_multiverse_project.git
   cd rick_morty_multiverse_project
   

2.Create virtual environment:

   # Windows #
   
   python -m venv venv
   
   venv\Scripts\activate

   # Linux/Mac #
   
   python -m venv venv
   
   source venv/bin/activate
   

3.Install dependencies:


  pip install -r requirements.txt


 
4.Import SQL database dump: 

#Note: If you want full feature access , import the SQL dump.#

   -Open your Xampp Shell and type:

   -- Using MySQL client or phpMyAdmin

  source "database_sql_dumps/rick_morty_multiverse_vault (3).sql";


5.Apply Django migrations:

   python manage.py migrate

6.Run server:

 python manage.py runserver


7.Usage:


   In your browser, Navigate to -

   http://127.0.0.1:8000/


   Admin: manage universes, travel schedules, journey logs, and dashboard analytics and point system.


   Users: book schedules, manage wishlist, browse marketplace, checkout, track transactions.

8. Admin Accounts


   usernames with password almausha:


    rick → almausha


    morty → almausha


    rick_morty → almausha
    






##Notes##

1.Admin accounts: rick, morty, rick_morty | Password: almausha


2.Database import is mandatory for full feature access.


3.Hybrid setup demonstrates Django migrations and manual SQL integration.


##necessary screenshots##


<img width="1693" height="933" alt="image" src="https://github.com/user-attachments/assets/948f438d-75be-4f0a-921c-6c780c34d5d3" />

![WhatsApp Image 2025-09-06 at 20 27 22_f145368a](https://github.com/user-attachments/assets/958af759-3ae0-486a-9096-41e9a77fc7b2)
![WhatsApp Image 2025-09-06 at 20 27 41_6cc0ff73](https://github.com/user-attachments/assets/60751d6d-2021-4eca-aae7-e4b2ab9c4829)
![WhatsApp Image 2025-09-06 at 20 32 05_ae115fff](https://github.com/user-attachments/assets/376b9746-4796-4f6f-a20b-6b3f7a330009)
![WhatsApp Image 2025-09-06 at 20 32 18_52ea6011](https://github.com/user-attachments/assets/4f51ca13-ce9d-44fb-b92b-34ab87d1855e)
![WhatsApp Image 2025-09-06 at 20 32 49_a7e2286d](https://github.com/user-attachments/assets/dc2028ae-6f93-45ea-b4fe-a51e8a2001aa)
![WhatsApp Image 2025-09-06 at 20 33 03_7797652d](https://github.com/user-attachments/assets/8d5c183c-cd61-4371-913f-fa0e816ec84c)








