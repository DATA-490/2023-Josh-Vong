from django.contrib import admin,messages
from .models import Food
from .models import WebUser
from django.urls import path
from django.shortcuts import render
from django import forms
from django.http import HttpResponseRedirect
# Register your models here.

#admin.site.register(Food)
admin.site.register(WebUser)

class CsvImportForm(forms.Form):
    csv_upload = forms.FileField()

@admin.register(Food)
class FoodAdmin(admin.ModelAdmin):
    list_display = ('brand','date_scrape', 'category' , 'name', 'price')
    search_fields = ('name','price','category','brand')

    def get_urls(self):
        urls = super().get_urls()
        new_urls = [path('upload-csv/',self.upload_csv),]
        return new_urls + urls
    
    def upload_csv(self, request):

        if request.method == "POST":
            csv_file = request.FILES["csv_upload"]

            if not csv_file.name.endswith('.csv'):
                messages.warning(request, 'The wrong filetype was uploaded')
                return HttpResponseRedirect(request.path_info)

            file_data = csv_file.read().decode("utf-8")
            csv_data = file_data.split("\n")

            for x in csv_data:
                fields = x.split(",")
                created = Food.objects.update_or_create(
                    date_scrape = fields[0],
                    category = fields[1],
                    name = fields[2],
                    price = fields[3],
                    brand = fields[4],
                )

        form = CsvImportForm()
        data = {"form": form}
        return render(request, "admin/csv_upload.html", data)
