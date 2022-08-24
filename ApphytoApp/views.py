from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import UsersSerializer
from .serializers import EquipementSerializer
from .serializers import AnalyseSerializer
from .serializers import DonneestrSerializer
from .models import users
from .models import equipement
from .models import analyse
from .models import donneestr

# Create your views here.

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
        serializer.save()
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
