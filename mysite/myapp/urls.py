from django.urls import path

from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('food',views.all_food, name='food_list'),
    path('search_food',views.search_food, name='search-food'),
    path('save_food', views.save_food, name='save_food'),
    path('saved_foods', views.view_saved_foods, name='saved_f'),
    path('login_user', views.login_user, name="login"),
    path('logout_user', views.logout_user, name="logout"),
    path('register_user', views.register_user, name="register_user"),
]