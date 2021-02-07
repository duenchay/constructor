
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth.models import User
from api.models import *
from api import views
from api.views import router
from django.conf import settings # new

from django.conf.urls.static import static
from django.conf.urls import url

urlpatterns = [
    path('',views.store, name='store'),
    path('index',views.index),
    path('login',views.login),
    path('register',views.register),
    path('editstore/<int:id>/', views.editstore), 
    path('store',views.store),
    path('tables',views.tables),
    path('product/',views.product),
    path('addproduct',views.addproduct),
    # path('editproduct',views.editproduct),
    path('editproduct/<int:id>/', views.editproduct),
    path('deleteproduct/<int:id>', views.deleteproduct),
    # path('product_search/', views.product_search, name='product_search'),
    path('mechanic',views.mechanic),
     path('editmechanic/<int:id>/', views.editmechanic),
    path('storck',views.storck),
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls'))
]


if settings.DEBUG: # new
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

