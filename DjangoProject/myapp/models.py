from django.db import models

class Address (models.Model):
    address_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    def __str__(self):
        return f'{self.user_id}'

# class Imformationsn(models.Model):
#     pass

# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=100,default=' ')
    user_lastname = models.CharField(max_length=100,default=' ')
    phone =  models.IntegerField()
    email = models.CharField(max_length=50,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    avatar = models.CharField(max_length=100,default=' ')  #รูปผู้ใช้งาน
    address = models.ForeignKey(Address,on_delete=models.CASCADE)
    def __str__(self):
        return f'{self.address} '

class Admin(models.Model): 
    admin_id = models.AutoField(primary_key=True)
    admin_name = models.CharField(max_length=100,default=' ')
    admin_lastname = models.CharField(max_length=100,default=' ')
    email = models.CharField(max_length=50,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    avatar = models.CharField(max_length=100,default=' ')

class Mechanic(models.Model): 
    mechanic_id = models.AutoField(primary_key=True)
    mechanic_name = models.CharField(max_length=100,default=' ')
    mechanic_lastname = models.CharField(max_length=100,default=' ')
    address = models.ForeignKey(Address,on_delete=models.CASCADE)
    phone =  models.IntegerField()
    email = models.CharField(max_length=50,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    avatar = models.CharField(max_length=100,default=' ')
    mechanic_detail =models.CharField(max_length=100,default=' ')
    mechanic_img = models.CharField(max_length=100,default=' ')
    mechanicCategory_id = models.ForeignKey(MechanicCategory,on_delete=models.CASCADE)

#ประเภทช่าง
class MechanicCategory (models.Model):
    mechanicCategory_id = models.AutoField(primary_key=True)
    mechanicCategory_name = models.CharField(max_length=100,default=' ')

#สินค้า
class Products(models.Model): 
    products_id = models.AutoField(primary_key=True)
    products_name = models.CharField(max_length=1000,default=' ')
    products_price = models.IntegerField()
    products_detail = models.CharField(max_length=1000,default=' ')
    products_img = models.CharField(max_length=1000,default=' ')
    category_id = models.ForeignKey(ProductCategory,on_delete=models.CASCADE)
    status_id =  models.ForeignKey(ProductStatus,on_delete=models.CASCADE)
    stock = models.IntegerField() #จำนวนสินค้า

# หมวดหมู่สินค้า
class ProductCategory (models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=100,default=' ')

# สถานะสินค้า
class ProductStatus (models.Model):
    status_id = models.AutoField(primary_key=True)
    status_name = models.CharField(max_length=100,default=' ') #สถานะสินค้า หมดแล้ว /ยังคงเหลือ

# สั่งซื้อ
class Order(models.Model): 
    order_id = models.AutoField(primary_key=True) #รหัสสั่งซื้อ
    date =   models.DateTimeField(auto_now_add=True)
    address_id =  models.ForeignKey(Address,on_delete=models.CASCADE)
    buyer_id = models.ForeignKey(User,Mechanic,on_delete=models.CASCADE)
    seller_id =  models.ForeignKey(Admin,on_delete=models.CASCADE)
    all_price =  models.CharField(max_length=100,default=' ') 

#รายการสินค้า
class Orderproducts (models.Model):
    orderproducts_id = models.AutoField(primary_key=True) #รหัสรายการสินค้า
    products_id = models.ForeignKey(Products,on_delete=models.CASCADE) #รหัสสินค้า
    order_id = models.ForeignKey(Order,on_delete=models.CASCADE) #รหัสการสั่งซื้อ
    orderproducts_name = models.ForeignKey(Products,on_delete=models.CASCADE)
    orderproducts_price = models.ForeignKey(Products,on_delete=models.CASCADE)
    orderproducts_storck = models.IntegerField() #จำนวนสินค้า
    delivery_options = models.ForeignKey(Delivery_options,on_delete=models.CASCADE)
    payment_options = models.ForeignKey(Payment_options,on_delete=models.CASCADE)

#ตะกร้าสินค้า
class Carts (models.Model):
    carts_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User,on_delete=models.CASCADE)
    products_id = models.ForeignKey(Products,on_delete=models.CASCADE)
    order_id = models.ForeignKey(Order,on_delete=models.CASCADE)

#ตัวเลือกการจัดส่ง
class Delivery_options (models.Model):
    by_yourself =  models.CharField(max_length=100,default=' ')
    by_store = models.CharField(max_length=100,default=' ')
#ตัวเลือกการชำระเงิน
class Payment_options (models.Model):
    by_cash = models.CharField(max_length=100,default=' ')
    by_bank = models.CharField(max_length=100,default=' ')

#บทสนทนา  
class Conversations(models.Model):
    Id = models.CharField(max_length=100,default=' ')
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    admin = models.ForeignKey(Admin,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    username = models.CharField(max_length=100,default=' ')
    text_chat1 = models.CharField(max_length=1000,default=' ')
    text_chat = models.CharField(max_length=1000,default=' ')
    date =   models.DateTimeField(auto_now_add=True)
    day = models.DateTimeField(auto_now_add=True)
    
    #   def __str__(self):
    #       return self.id

class Storck(models.Model):
    all_products= models.IntegerField()
    products_that_have_been_sold = models.IntegerField()
    inventories = models.IntegerField()

#ข้อมูลร้าน
class Store (models.Model):
    store_name = models.CharField(max_length=100,default=' ')
    store_img = models.CharField(max_length=100,default=' ')
    store_phone = models.CharField(max_length=100,default=' ')
    adddres_id  =  models.ForeignKey(Address,on_delete=models.CASCADE)