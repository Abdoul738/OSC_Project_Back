from django.contrib import admin
from .models import users
from .models import equipement
from .models import donneestr
from .models import analyse

# Register your models here.
admin.site.register(users)
admin.site.register(equipement)
admin.site.register(donneestr)
admin.site.register(analyse)
