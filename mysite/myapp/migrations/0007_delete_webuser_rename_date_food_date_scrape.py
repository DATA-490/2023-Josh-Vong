# Generated by Django 4.1.7 on 2023-03-29 04:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0006_rename_date_scrape_food_date'),
    ]

    operations = [
        migrations.DeleteModel(
            name='WebUser',
        ),
        migrations.RenameField(
            model_name='food',
            old_name='date',
            new_name='date_scrape',
        ),
    ]
