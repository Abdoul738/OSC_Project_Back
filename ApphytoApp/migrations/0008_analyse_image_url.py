# Generated by Django 4.1 on 2022-08-29 09:19

import ApphytoApp.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ApphytoApp', '0007_remove_analyse_image_url'),
    ]

    operations = [
        migrations.AddField(
            model_name='analyse',
            name='Image_url',
            field=models.ImageField(blank=True, null=True, upload_to=ApphytoApp.models.upload_to),
        ),
    ]