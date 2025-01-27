Installation Guide

Download the Zip file
Download Python 3.12 or another version, and add the path to your system environment variables.
Download MySQL 9.0 or another version, and add path to your system environment variables.
Configure MySQL and Create your Database
Configure Database in the Project’s Settings.py with this format: DATABASES = { 'default': { 'ENGINE':
'django.db.backends.mysql', 'NAME': 'your_database_name', 'USER': 'your_mysql_username', 'PASSWORD':
'your_mysql_password', 'HOST': 'localhost', 'PORT': '3306', } }
Dump the Bularentalsdump.sql into your database by navigating into the project directory in the folder and
using the commands: “Cd Bularentalswebsite” then “Get-Content bularentalsdump.sql | mysql -u (your
username) -p (your database name)”
Create and activate a virtual environment (such as Pipenv) in the project directory. Create it using the
command: pip install pipenv, and activate it with the command: pipenv shell.
Install Dependencies from requirements.txt using the command: pip install -r requirements.txt
Run Project using the command: Python manage.py
For easy access to explore how the site works and to check UI responsiveness and design on different
devices, visit our deployment on Heroku: http://bula-rentals-ba36ce12ccc7.herokuapp.com.
