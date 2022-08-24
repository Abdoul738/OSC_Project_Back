from django.urls import path
from . import views

urlpatterns = [
    # START API FOR USERS   
    path('users/',views.allUsers),
    path('user/<int:id>/',views.oneUser),
    path('addusers/',views.addUser),
    path('updateuser/<int:id>/',views.updateUser),
    path('deleteuser/<int:id>/',views.delUser),
    # END API FOR USERS
    
    # START API FOR EQUIPEMENT
    path('addequipement/',views.addEquipement),
    path('updateequipement/<int:id>/',views.updateEquipement),
    path('deleteequipement/<int:id>/',views.delEquipement),
    path('equipements/',views.allEquipement),
    path('equipement/<int:id>/',views.oneEquipement),
    # START API FOR EQUIPEMENT
    
    # START API FOR DONNEESTR
    path('adddonneestr/',views.addDonneestr),
    path('updatedonneestr/<int:id>/',views.updateDonneestr),
    path('deletedonneestr/<int:id>/',views.delDonneestr),
    path('donneestrs/',views.allDonneestr),
    path('donneestr/<int:id>/',views.oneDonneestr),
    # START API FOR DONNEESTR
    
    # START API FOR ANALYSE
    path('addanalyse/',views.addAnalyse),
    path('updateanalyse/<int:id>/',views.updateAnalyse),
    path('deleteanalyse/<int:id>/',views.delAnalyse),
    path('analyses/',views.allAnalyse),
    path('analyse/<int:id>/',views.oneAnalyse),
    # START API FOR ANALYSE
]
