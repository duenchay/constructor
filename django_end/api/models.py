from django.contrib.admin.sites import DefaultAdminSite
from django.db import models
from django.db.models.deletion import CASCADE


class User(models.Model):
    # user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=100,default=' ')
    user_lastname = models.CharField(max_length=100,default=' ')
    phone =  models.IntegerField()
    email = models.CharField(max_length=50,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    avatar = models.CharField(max_length=100,default=' ')  #รูปผู้ใช้งาน
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    # address = models.ForeignKey(Address,on_delete=models.CASCADE)
    

# class Address (models.Model):
#     address_id = models.AutoField(primary_key=True)
#     user_id = models.ForeignKey(User,on_delete=models.CASCADE)
#     lat =  models.CharField(max_length=1000,default=' ')
#     lng =  models.CharField(max_length=1000,default=' ')
    # def __str__(self):
    #     return f'{self.user_id}'

# class Imformationsn(models.Model):
#     pass

# Create your models here.

#ข้อมูลร้าน
class Store (models.Model):
    store_name = models.CharField(max_length=100,default=' ')
    store_img = models.CharField(max_length=100,default=' ')
    store_phone = models.CharField(max_length=100,default=' ')
    adddres  =  models.CharField(max_length=100,default=' ')
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    time_open =models.CharField(max_length=100,default=' ')
    time_close =models.CharField(max_length=100,default=' ')

class Admin(models.Model): 
    # admin_id = models.AutoField(primary_key=True)
    admin_name = models.CharField(max_length=100,default=' ')
    admin_lastname = models.CharField(max_length=100,default=' ')
    avatar = models.CharField(max_length=100,default=' ')
    email = models.CharField(max_length=50,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    store = models.ForeignKey(Store,on_delete=models.CASCADE)
    def __str__(self):
        return f'{self.store} '
   

#ประเภทช่าง
class MechanicCategory (models.Model):
    # mechanicCategory_id = models.AutoField(primary_key=True)
    mechanicCategory_name = models.CharField(max_length=100,default=' ')

class Mechanic(models.Model): 
    # mechanic_id = models.AutoField(primary_key=True)
    mechanic_name = models.CharField(max_length=100,default=' ')
    mechanic_lastname = models.CharField(max_length=100,default=' ')
    phone =  models.IntegerField()
    email = models.CharField(max_length=50,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    avatar = models.CharField(max_length=100,default=' ')
    mechanic_detail =models.CharField(max_length=100,default=' ')
    mechanic_img = models.CharField(max_length=100,default=' ')
    mechanicCategory= models.ForeignKey(MechanicCategory,on_delete=models.CASCADE) #ประเภทช่าง
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    def __str__(self):
        return f'{self.mechanicCategory} '

# หมวดหมู่สินค้า
class ProductCategory (models.Model):
    # category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=100,default=' ')

# สถานะสินค้า
class ProductStatus (models.Model):
    # status_id = models.AutoField(primary_key=True)
    status_name = models.CharField(max_length=100,default=' ') #สถานะสินค้า หมดแล้ว /ยังคงเหลือ

#สินค้า
class Products(models.Model): 
    # products_id = models.AutoField(primary_key=True)
    products_name = models.CharField(max_length=1000,default=' ')
    products_price = models.IntegerField()
    products_detail = models.CharField(max_length=1000,default=' ')
    products_img = models.CharField(max_length=1000,default=' ')
    category = models.ForeignKey(ProductCategory,on_delete=models.CASCADE) #หมวดหมู่สินค้า
    status =  models.ForeignKey(ProductStatus,on_delete=models.CASCADE)  #สถานะสินค้า
    stock = models.IntegerField() #จำนวนสินค้า
    def __str__(self):
        return f'{self.category} {self.status} '

class Status(models.Model):
    name =  models.CharField(max_length=100,default=' ') 
   
# สั่งซื้อ
class OrderMechanic(models.Model): 
    # order_id = models.AutoField(primary_key=True) #รหัสสั่งซื้อ
    date =   models.DateTimeField(auto_now_add=True)
    shopping_date =  models.CharField(max_length=100,default=' ') 
    # address_id =  models.ForeignKey(Address,on_delete=models.CASCADE)
    buyer = models.ForeignKey(Mechanic,on_delete=models.CASCADE)
    seller =  models.ForeignKey(Admin,on_delete=models.CASCADE)
    # mechanic =  models.ForeignKey(Mechanic,on_delete=models.CASCADE)
    all_price =  models.CharField(max_length=100,default=' ') 
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    status = models.CharField(max_length=100,default=' ')
    def __str__(self):
        return f'{self.buyer} {self.seller}  '

# class Buyer (models.Model):
#     user = models.ForeignKey(User,on_delete=models.CASCADE)
#     mechanic = models.ForeignKey(Mechanic,on_delete=models.CASCADE)
class OrderUser(models.Model): 
    # order_id = models.AutoField(primary_key=True) #รหัสสั่งซื้อ
    date =   models.DateTimeField(auto_now_add=True)
    shopping_date =  models.CharField(max_length=100,default=' ') 
    # address_id =  models.ForeignKey(Address,on_delete=models.CASCADE)
    buyer = models.ForeignKey(User,on_delete=models.CASCADE)
    seller =  models.ForeignKey(Admin,on_delete=models.CASCADE)
    # mechanic =  models.ForeignKey(Mechanic,on_delete=models.CASCADE)
    all_price =  models.CharField(max_length=100,default=' ') 
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    status = models.CharField(max_length=100,default=' ')
    def __str__(self):
        return f'{self.buyer} {self.seller}  '

#ตัวเลือกการจัดส่ง
class Delivery_options (models.Model):
    by_yourself = models.BooleanField(default=True)
    by_store  = models.BooleanField(default=False)
# ตัวเลือกการชำระเงิน
class Payment_options (models.Model):
    by_cash = models.BooleanField(default=True)
    by_bank = models.BooleanField(default=False)
# class Payment (models.Model):
#     by_cash = models.BooleanField(default=True)
#     by_bank = models.BooleanField(default=False)

#รายการสินค้า
class OrderproductsUser (models.Model):
    # orderproducts_id = models.AutoField(primary_key=True) #รหัสรายการสินค้า
    # products = models.ForeignKey(Products,on_delete=models.CASCADE) #รหัสสินค้า
    order= models.ForeignKey(OrderUser,on_delete=models.CASCADE) #รหัสการสั่งซื้อ
    orderproducts = models.ForeignKey(Products,on_delete=models.CASCADE)
    # orderproducts_price = models.ForeignKey(Products,on_delete=models.CASCADE)
    orderproducts_storck = models.IntegerField() #จำนวนสินค้า
    delivery_options = models.ForeignKey(Delivery_options,on_delete=models.CASCADE)
    payment_options = models.ForeignKey(Payment_options,on_delete=models.CASCADE)
    def __str__(self):
        return f' {self.order} {self.orderproducts} {self.delivery_options} {self.payment_options}'

class OrderproductsMechanic (models.Model):
    # orderproducts_id = models.AutoField(primary_key=True) #รหัสรายการสินค้า
    # products = models.ForeignKey(Products,on_delete=models.CASCADE) #รหัสสินค้า
    order= models.ForeignKey(OrderMechanic,on_delete=models.CASCADE) #รหัสการสั่งซื้อ
    orderproducts = models.ForeignKey(Products,on_delete=models.CASCADE)
    # orderproducts_price = models.ForeignKey(Products,on_delete=models.CASCADE)
    orderproducts_storck = models.IntegerField() #จำนวนสินค้า
    delivery_options = models.ForeignKey(Delivery_options,on_delete=models.CASCADE)
    payment_options = models.ForeignKey(Payment_options,on_delete=models.CASCADE)
    def __str__(self):
        return f' {self.order} {self.orderproducts} {self.delivery_options} {self.payment_options}'
#ตะกร้าสินค้า
class Carts (models.Model):
    # carts_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    products_id = models.ForeignKey(Products,on_delete=models.CASCADE)
    # order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
    def __str__(self):
        return f'{self.user_id} {self.products_id}  '




#บทสนทนา  
# class Conversations(models.Model):
#     # Id = models.CharField(max_length=100,default=' ')
#     user = models.ForeignKey(User,on_delete=models.CASCADE)
#     admin = models.ForeignKey(Admin,on_delete=models.CASCADE)
#     # user1 = models.ForeignKey(User,on_delete=models.CASCADE)
#     # username = models.CharField(max_length=100,default=' ')
#     # text_chat1 = models.CharField(max_length=1000,default=' ')
#     text_chat = models.CharField(max_length=1000,default=' ')
#     date =   models.DateTimeField(auto_now_add=True)
#     time = models.DateTimeField(auto_now_add=True)
#     def __str__(self):
#         return f'{self.user} {self.admin} {self.user}  '


    

class Storck(models.Model):
    all_products= models.IntegerField()
    Sold = models.IntegerField()
    inventories = models.IntegerField()
    # def __str__(self):
    #     return f'{self.inventories}   '


