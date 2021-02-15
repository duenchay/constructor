
from typing import KeysView
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
    path('',views.index, name='index'), 
    path('index',views.index),
    # path('login',views.login),
    # path('register',views.register),
    path('login/',views.login),
    path('register/',views.register), 
    path('logout/',views.logout),     
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
    path('order',views.order),
    path('orderproduct/<int:id>/',views.orderproduct),
    path('storck',views.storck),
    path('payment',views.payment),  

    path('home2',views.home2),  
    path('home',views.home), 
    path('base2',views.base2), 
    path('orderUser',views.orderUser), 
    path('mechanicDetailUser/<int:id>/',views.mechanicDetailUser),   
    path('storeUser',views.storeUser),  
    path('register1',views.register1),
    path('mechanicUser',views.mechanicUser),    
    path('product_type',views.product_type,name='product_type'),
    path('productTypeUser/<int:id>',views.productTypeUser,name='productTypeUser'),
    path('product/<int:id>',views.productUser,name='productUser'),
    path('test',views.test),
    path('cart',views.cart),
    path('profileAdmin',views.profileAdmin),

    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls'))
]


if settings.DEBUG: # new
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

