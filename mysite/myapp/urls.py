from django.urls import path

from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('food',views.all_food, name='food_list'),
    path('search_food',views.search_food, name='search-food'),
    path('save_food', views.save_food, name='save_food'),
    path('saved_foods', views.view_saved_foods, name='saved_f'),
]