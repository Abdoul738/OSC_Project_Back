from rest_framework import serializers
from .models import users
from .models import equipement
from .models import donneestr
from .models import analyse

class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = users
        fields = '__all__'
class EquipementSerializer(serializers.ModelSerializer):
    class Meta:
        model = equipement
        fields = '__all__'
class DonneestrSerializer(serializers.ModelSerializer):
    class Meta:
        model = donneestr
        fields = '__all__'
class AnalyseSerializer(serializers.ModelSerializer):
    class Meta:
        model = analyse
        fields = '__all__'
