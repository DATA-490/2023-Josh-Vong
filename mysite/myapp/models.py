from django.db import models
from django.utils.translation import gettext as _
# Create your models here.

class Food (models.Model):
    date_scrape = models.CharField(_("Date Scrape"), max_length=255)
    category = models.CharField(_("Category"), max_length=255)
    name = models.CharField(_("Name"), max_length=255)
    price = models.CharField(_("Price"), max_length=255)
    brand = models.CharField(_("Brand"), max_length=255, default='')

    def __str__(self):
        return self.name
    
class WebUser(models.Model):
    first_name = models.CharField(_("First Name"), max_length=30)
    last_name = models.CharField(_("Last Name"), max_length=30)
    email = models.EmailField('User Email')

    def __str__(self):
        return self.first_name + ' ' + self.last_name

