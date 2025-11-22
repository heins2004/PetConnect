 🐾 PetConnect – Online Pet Adoption Platform

PetConnect is a modern and user-friendly web application designed to connect pet seekers with individuals and shelters looking to rehome animals. The platform ensures a smooth, transparent, and responsible adoption process through an intuitive interface, efficient communication, and secure data handling.

---
📌 Features

Admin
* Login and manage profile
* View, search, and manage users
* Add, view, filter, and delete pet transactions
* View and delete pet adoption requests
* View and delete user queries
* Manage admin activity

User
* Login and sign up
* View and search pets
* Request for adoption
* Add inquiries
* Add, edit, or delete listed pets
* View request status and transactions
* Manage user profile

🛠️ Tech Stack
| Layer        | Technology                   |
| ------------ | ---------------------------- |
| Frontend     | HTML, CSS, JavaScript        |
| Backend      | Python (Django Framework)    |
| Database     | MySQL (via XAMPP/phpMyAdmin) |
| Local Server | Django runserver             |
| Environment  | Virtual Environment (venv)   |

🗄️ Database Setup (MySQL + XAMPP)

PetConnect uses MySQL, hosted locally through XAMPP.
1. Start MySQL
a. Open XAMPP Control Panel
b. Start Apache
c. Start MySQL

2. Create Database

Open:
```
http://localhost/phpmyadmin/
```
Create or import the database:
* Import: `djangodb.sql`

3. Install MySQL Connector
```
pip install mysqlclient
```
🚀 Run the Project
1. Activate Virtual Environment
Environment folder is named `venv2`:
```
venv2\Scripts\activate
```

2. Install Required Packages
If you have a `requirements.txt`:
```
pip install -r requirements.txt
```
Or manually install:
```
pip install django
pip install mysqlclient
pip install pillow
```

3. Apply Migrations

```
python manage.py makemigrations
python manage.py migrate
```

4. Start Django Local Server

```
python manage.py runserver
```
Or:
```
python .\manage.py runserver
```

Then open your website:
* [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
* [http://localhost:8000/](http://localhost:8000/)

📌 Future Enhancements
* Real-time chat for seekers and owners
* Cloud-based image storage
* Dedicated shelter dashboard
* Donation/payment integration
* Advanced admin analytics

👨‍💻 Contributors

Heins Devasia – Developer
