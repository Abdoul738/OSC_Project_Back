from django.db import models
import json

# # lets us explicitly set upload path and filename
# def upload_to(instance, filename):
#     return 'images/{filename}'.format(filename=filename)

# Create your models here.
class users(models.Model):
    nom = models.CharField(max_length=20,null=True)
    prenom = models.CharField(max_length=20,null=True)
    email = models.EmailField(max_length=50,null=True)
    contact = models.CharField(max_length=16)
#---------------------------------------------------
class equipement(models.Model):
    idcapteur = models.CharField(max_length=20)
    statut = models.BooleanField(False)
    lat = models.BigIntegerField(null=True)
    lng = models.BigIntegerField(null=True)
    user_id = models.ForeignKey('users',on_delete=models.CASCADE,)
#---------------------------------------------------
class donneestr(models.Model):
    capteur_id = models.ForeignKey('equipement',on_delete=models.CASCADE,)
    temp = models.FloatField()
    hamb = models.FloatField()
    hsol = models.FloatField()
    teau = models.FloatField(null=True)
    nitr = models.FloatField(null=True)
    phos = models.FloatField(null=True)
    pota = models.FloatField(null=True)
#---------------------------------------------------
class analyse(models.Model):
    capt_id = models.ForeignKey('equipement',on_delete=models.CASCADE,)
    date= models.DateTimeField(null=True)
    rslt = models.CharField(max_length=200,null=True)
    image_url = models.ImageField(upload_to='images', blank=True, null=True)
#---------------------------------------------------
class prediction(models.Model):
    img_id = models.ForeignKey('awsimage',on_delete=models.CASCADE,)
    predicts = models.CharField(max_length=200, null=True)
    degre = models.FloatField(null=True)
#---------------------------------------------------
class awsimage(models.Model):
    image_url = models.ImageField(upload_to='images', blank=True, null=True)
    date= models.DateTimeField(null=True)