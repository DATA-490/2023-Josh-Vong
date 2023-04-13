from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib import messages
from .models import Food
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