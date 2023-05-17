# <Project Title>
* **Author**: <Name>, github: Joshua Vong [Jvong-max](<url link to github profile>)
* **Major**: <Major> Computer Science
* **Year**: <Year> Spring 2023

# Type of project
Webscraping prices of food from different retailers

# Purpose (including intended audience)
Purpose is to check the difference prices for food from 
different suppliers with a website. Users can search up a food item and 
it will search through the database and display the food name,
price, and which retailer has it. The intended audience for this 
are people looking to get the best prices for food items, like college students
or people with low income.

# Explanation of files

Link to file explanations: https://docs.google.com/document/d/1JZdFwaOqBvOwk3YUpvVFFdHEaMjrAaacmwpoy7fW9Xw/edit

├── combined_foods.csv

├── fake.csv

├── fareway_food_data.csv

├── mysite

│   ├── combined_foods.csv

│   ├── cub_food_data.csv

│   ├── db.sqlite3

│   ├── manage.py

│   ├── myapp

│   │   ├── admin.py

│   │   ├── apps.py

│   │   ├── __init__.py

│   │   ├── models.py

│   │   ├── templates

│   │   │   ├── admin
│   │   │   │   └── csv_upload.html
│   │   │   └── myapp
│   │   │       └── food
│   │   │           └── change_list.html

│   │   ├── tests.py

│   │   ├── urls.py

│   │   └── views.py

│   ├── mysite

│   │   ├── asgi.py

│   │   ├── settings.py

│   │   ├── urls.py

│   │   └── wsgi.py

│   └── sqlite3.exe

├── README.md

├── shoprite_food_data.csv

└── webscrape.R

12 directories, 66 files

# Completion status 

<as applicable> Pending steps include: 


## Enhancements: 
<List at least 2>

- [ ] Got rid of long names for food product
- [ ] Modify search page to look more appeaing

# Can someone else work on this project? 
Yes

# Requirements to run website locally
R version - 4.2.2
Python version - 3.9.13
Django version - 4.1.7

# How to run

cd to mysite (first mysite folder), inside folder contains manage.py file
use command: python3 .\manage.py runserver


Do this if database is not populated with food items
Might have to run command: python manage.py makemigrations
Then run: python manage.py makemigrations

This is populate database

# Public Display/dissemination
<List any existing public facing pages here>
Poster Link
https://docs.google.com/presentation/d/14Nj7Npc0WuFIaOxSGOTLknUu3imgazsq0DW-GC9y2VI/edit#slide=id.p

# License
Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)