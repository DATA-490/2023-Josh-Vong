from django.contrib import admin
from .models import Food
from .models import WebUser
# Register your models here.

#admin.site.register(Food)
admin.site.register(WebUser)

@admin.register(Food)
class FoodAdmin(admin.ModelAdmin):
    list_display = ('date_scrape', 'category' , 'name', 'price')
    search_fields = ('name','price','category')
