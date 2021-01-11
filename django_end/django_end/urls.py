# from django.contrib import admin
# from django.urls import path
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.models import User
from django.utils import translation
# from rest_framework import routers, serializers, viewsets
from api.models import *
from api import views
from api.views import router

translation.activate('th')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index, name='index'),
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls'))
]
