from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(User)
admin.site.register(Store)
admin.site.register(Admin)
admin.site.register(MechanicCategory)
admin.site.register(Mechanic)
admin.site.register(ProductCategory)
admin.site.register(ProductStatus)
admin.site.register(Products)
admin.site.register(Status)
admin.site.register(OrderMechanic)
admin.site.register(OrderUser)
admin.site.register(Delivery_options)
admin.site.register(Payment_options)
admin.site.register(OrderproductsUser)
admin.site.register(OrderproductsMechanic)
admin.site.register(Carts)
# admin.site.register(Conversations)
admin.site.register(Storck)
