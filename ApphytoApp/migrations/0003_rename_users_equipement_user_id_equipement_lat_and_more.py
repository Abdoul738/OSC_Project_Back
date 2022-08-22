# Generated by Django 4.1 on 2022-08-17 18:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ApphytoApp', '0002_equipement'),
    ]

    operations = [
        migrations.RenameField(
            model_name='equipement',
            old_name='users',
            new_name='user_id',
        ),
        migrations.AddField(
            model_name='equipement',
            name='lat',
            field=models.BigIntegerField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='equipement',
            name='lng',
            field=models.BigIntegerField(max_length=50, null=True),
        ),
        migrations.CreateModel(
            name='donneestr',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('temp', models.FloatField()),
                ('hamb', models.FloatField()),
                ('hsol', models.FloatField()),
                ('teau', models.FloatField()),
                ('nitr', models.FloatField()),
                ('phos', models.FloatField()),
                ('pota', models.FloatField()),
                ('capteur_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ApphytoApp.equipement')),
            ],
        ),
        migrations.CreateModel(
            name='analyse',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_analyse', models.DateTimeField()),
                ('rslt_analyse', models.CharField(max_length=200)),
                ('sugt_analyse', models.CharField(max_length=200)),
                ('img_url', models.CharField(max_length=200)),
                ('capteur_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ApphytoApp.equipement')),
            ],
        ),
    ]
