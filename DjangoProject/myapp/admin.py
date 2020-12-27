from django.contrib import admin

# Register your models here.
from .models import *
admin.site.register(User)
admin.site.register(Admin)
admin.site.register(Mechanic)
admin.site.register(MechanicCategory)
admin.site.register(Products)
admin.site.register(ProductCategory)
admin.site.register(ProductStatus)
admin.site.register(Order)
admin.site.register(Orderproducts)
admin.site.register(Carts)
admin.site.register(Delivery_options)
admin.site.register(Payment_options)
admin.site.register(Conversations)
admin.site.register(Storck)
admin.site.register(Store)