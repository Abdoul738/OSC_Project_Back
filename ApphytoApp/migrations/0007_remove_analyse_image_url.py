# Generated by Django 4.1 on 2022-08-29 09:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ApphytoApp', '0006_analyse'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='analyse',
            name='Image_url',
        ),
    ]