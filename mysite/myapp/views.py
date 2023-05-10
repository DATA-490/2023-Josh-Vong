from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib import messages
from .models import Food
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
import csv
import io
from django.contrib import admin
# Create your views here.

saved_foods = []  # global list to store saved foods

def save_food(request):
    if request.method == 'POST':
        food_id = request.POST.get('food_id')
        food = Food.objects.get(id=food_id)
        saved_foods.append(food)
        messages.success(request, f'Successfully saved {food.name}!')
        return render(request, 'myapp/saved_foods.html',
        {'saved_foods':saved_foods})
    
def view_saved_foods(request):
    context = {'saved_foods': saved_foods}
    return render(request, 'myapp/saved_foods.html', context)

def all_food(request):
    food_list = Food.objects.all()
    return render(request, 'myapp/food_list.html',
    {'food_list':food_list})

def search_food(request):
    if request.method == 'POST':
        searched = request.POST['searched']
        foods = Food.objects.filter(name__contains=searched)
        return render(request, 'myapp/search_food.html',
        {'searched':searched,
         'foods':foods})
    else:
        return render(request, 'myapp/search_food.html',
        {})

def home(request):
    return render(request, 'myapp/home.html', {})

def login_user(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.success(request, ("There was an error logging in try again"))
            return redirect('login')
    else:
        return render(request, 'myapp/login.html', {})
    
def logout_user(request):
    logout(request)
    messages.success(request, ("You have logged out"))
    return redirect('home')

def register_user(request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            login(request,user)
            messages.success(request, ("Registration sucessful"))
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'myapp/register_user.html', {
        'form':form,
    })
