# Generated by Django 4.1 on 2022-09-09 19:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ApphytoApp', '0002_rename_prediction_awsimage_predictions_prediction'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='awsimage',
            name='predictions',
        ),
        migrations.RemoveField(
            model_name='awsimage',
            name='title',
        ),
        migrations.RemoveField(
            model_name='prediction',
            name='image_url',
        ),
        migrations.AddField(
            model_name='awsimage',
            name='date',
            field=models.DateTimeField(null=True),
        ),
    ]
