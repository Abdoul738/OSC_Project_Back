from django.contrib import admin
from .models import users
from .models import equipement
from .models import donneestr
from .models import analyse
from .models import awsimage
from .models import prediction

# Register your models here.
admin.site.register(users)
admin.site.register(equipement)
admin.site.register(donneestr)
admin.site.register(analyse)
admin.site.register(awsimage)
admin.site.register(prediction)