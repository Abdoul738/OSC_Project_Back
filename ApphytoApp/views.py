from asyncio.windows_events import NULL
from tabnanny import verbose
from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework import viewsets
from rest_framework.response import Response
from .serializers import UsersSerializer
from .serializers import EquipementSerializer
from .serializers import AnalyseSerializer
from .serializers import DonneestrSerializer
from .serializers import AwsimageSerializer
from .serializers import PredictionSerializer
from .models import users
from .models import equipement
from .models import analyse
from .models import donneestr
from .models import awsimage
from .models import prediction
import numpy as np
import cv2
# from tensorflow.keras.models import load_model
from PIL import Image
import io
from flask import Flask, render_template, request
import os
from tensorflow.keras.preprocessing.image import load_img
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
import tensorflow as tf

from ApphytoApp import serializers

from django.core.files import File
import cv2

filepath = 'C:/Users/User/Desktop/phyto/phytolaafi.h5'
model = load_model(filepath)
class_names = ['Tomato___healthy', 'Tomato_disease']

# class awsimageView(viewsets.ModelViewSet):
#     queryset = awsimage.objects.all()
#     serializer_class = AwsimageSerializer

#     def perform_create(self, serializer):
#         im = self.request.data.get('image_url')

#         image_path = f'C:/Users/User/Desktop/phyto/mediafiles/images/{im.name}'
#         image = load_img(image_path, target_size = (256, 256)) # load image 

#         img_array = tf.keras.preprocessing.image.img_to_array(image)
#         img_array = tf.expand_dims(img_array, 0)
#         predictions = model.predict(img_array, verbose=1) 
#         predicted_class = class_names[np.argmax(predictions[0])]  
#         confidence = round(100 * (np.max(predictions[0])), 2) 

#         serializer.save(prediction=predicted_class)


class awsimageView(viewsets.ModelViewSet):
    queryset = awsimage.objects.all()
    serializer_class = AwsimageSerializer
#---------------------------------------------------------------------------
class predictView(viewsets.ModelViewSet):
    queryset = prediction.objects.all()
    serializer_class = PredictionSerializer

    def perform_create(self, serializer):
        img_id = self.request.data.get('img_id')
        img = awsimage.objects.get(id=img_id)
        image_path = img.image_url.path
        image_path.replace('\\','/')
        image = load_img(image_path, target_size = (256, 256)) # load image 
        img_array = tf.keras.preprocessing.image.img_to_array(image)
        img_array = tf.expand_dims(img_array, 0)
        predictions = model.predict(img_array, verbose=1) 
        predicted_class = class_names[np.argmax(predictions[0])]  
        confidence = round(100 * (np.max(predictions[0])), 2) 

        serializer.save(predicts=predicted_class,degre=confidence)

# START USER'S FUNCTION
#-------------------------------------------------------
@api_view(['GET'])
def allUsers(request):
    user = users.objects.all()
    serialization = UsersSerializer(user,many=True)
    return Response(serialization.data)
#-------------------------------------------------------
@api_view(['GET'])
def oneUser(request,id):
    oneuser = users.objects.get(id=id)
    serialization = UsersSerializer(oneuser)
    return Response(serialization.data)
#-------------------------------------------------------
@api_view(['POST'])
def addUser(request):
    # serializer = UsersSerializer(data = request.data, many=True)
    serializer = UsersSerializer(data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['PUT'])
def updateUser(request,id):
    user = users.objects.get(id=id)
    serializer = UsersSerializer(instance = user, data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['DELETE'])
def delUser(request,id):
    user = users.objects.get(id=id)
    user.delete()
    return Response('Utilisateur supprimé !!!')
#-------------------------------------------------------
# END USER'S FUNCTION

# START EQUIPEMENT'S FUNCTION
#-------------------------------------------------------
@api_view(['POST'])
def addEquipement(request):
    serializer = EquipementSerializer(data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['PUT'])
def updateEquipement(request,id):
    capteur = equipement.objects.get(id=id)
    serializer = EquipementSerializer(instance = capteur, data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['DELETE'])
def delEquipement(request,id):
    capteur = equipement.objects.get(id=id)
    capteur.delete()
    return Response('Equipement supprimé !!!')
#-------------------------------------------------------
@api_view(['GET'])
def allEquipement(request):
    capteur = equipement.objects.all()
    serialization = EquipementSerializer(capteur,many=True)
    return Response(serialization.data)
#-------------------------------------------------------
@api_view(['GET'])
def oneEquipement(request,id):
    capteur = equipement.objects.get(id=id)
    serialization = EquipementSerializer(capteur)
    return Response(serialization.data)
#-------------------------------------------------------
# END EQUIPEMENT'S FUNCTION

# START DONNEESTR'S FUNCTION
#-------------------------------------------------------
@api_view(['POST'])
def addDonneestr(request):
    serializer = DonneestrSerializer(data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['PUT'])
def updateDonneestr(request,id):
    donnes = donneestr.objects.get(id=id)
    serializer = DonneestrSerializer(instance = donnes, data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['DELETE'])
def delDonneestr(request,id):
    donnes = donneestr.objects.get(id=id)
    donnes.delete()
    return Response('donnees supprimé !!!')
#-------------------------------------------------------
@api_view(['GET'])
def allDonneestr(request):
    donnes = donneestr.objects.all()
    serialization = DonneestrSerializer(donnes,many=True)
    return Response(serialization.data)
#-------------------------------------------------------
@api_view(['GET'])
def oneDonneestr(request,id):
    donnes = donneestr.objects.get(id=id)
    serialization = DonneestrSerializer(donnes)
    return Response(serialization.data)
#-------------------------------------------------------
# END DONNEESTR'S FUNCTION

# START ANALYE'S FUNCTION
#-------------------------------------------------------
@api_view(['POST'])
def addAnalyse(request):
    serializer = AnalyseSerializer(data = request.data)
    if serializer.is_valid():
        serializer.save(
            image_url = request.data['image_url'],
            date = request.data['date'],
            rslt =request.data['rslt'],
            capt_id = request.data['capt_id']
        )
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['PUT'])
def updateAnalyse(request,id):
    donnes = analyse.objects.get(id=id)
    serializer = AnalyseSerializer(instance = donnes, data = request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)
#-------------------------------------------------------
@api_view(['DELETE'])
def delAnalyse(request,id):
    donnes = analyse.objects.get(id=id)
    donnes.delete()
    return Response('Analyse supprimé !!!')
#-------------------------------------------------------
@api_view(['GET'])
def allAnalyse(request):
    donnes = analyse.objects.all()
    serialization = AnalyseSerializer(donnes,many=True)
    return Response(serialization.data)
#-------------------------------------------------------
@api_view(['GET'])
def oneAnalyse(request,id):
    donnes = analyse.objects.get(id=id)
    serialization = AnalyseSerializer(donnes)
    return Response(serialization.data)
#-------------------------------------------------------
# END ANALYE'S FUNCTION
