# from typing import AbstractSet
from django.contrib.admin.sites import DefaultAdminSite
from django.db import models
from django.db.models.deletion import CASCADE


# class Role(models.Model):
#     role = models.CharField(max_length=100,default=' ')
    # r_user = models.BooleanField(default=True)
    # r_metchanic  = models.BooleanField(default=False)
    # r_mechanic = models.CharField(max_length=100,default=' ')
    # r_mechanic = models.CharField(max_length=100,default=' ')

class User(models.Model):
    # user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=100,default=' ')
    user_lastname = models.CharField(max_length=100,default=' ')
    username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=100,default=' ')
    email = models.CharField(max_length=50,default=' ')
    phone =  models.IntegerField()
    avatar = models.CharField(max_length=1000,default=' ')  #รูปผู้ใช้งาน
    # role = models.ForeignKey(Role,on_delete=models.CASCADE) 
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    # def __str__(self):
    #     return f'{self.role} '

# class Customer (models.Model):
#     user_name = models.CharField(max_length=100,default=' ')
#     user_lastname = models.CharField(max_length=100,default=' ')

class Mechanic_Type (models.Model):
    # mechanicCategory_id = models.AutoField(primary_key=True)
    mechanic_type= models.CharField(max_length=100,default=' ')
    def __str__(self):
        return f'{self.mechanic_type} '

class Mechanic(models.Model): 
    mechanic_detail =models.CharField(max_length=100,default=' ')
    mechanic_img = models.CharField(max_length=100,default=' ')
    mechanic_type= models.ForeignKey(Mechanic_Type,on_delete=models.CASCADE) #ประเภทช่าง

    def __str__(self):
        return f'{self.mechanic_type} '

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



# หมวดหมู่สินค้า
class Product_Type (models.Model):
    # category_id = models.AutoField(primary_key=True)
    product_type = models.CharField(max_length=100,default=' ')
    def __str__(self):
        return f'{self.product_type} '

# สถานะสินค้า
class Product_Status (models.Model):
    product_status= models.CharField(max_length=100,default=' ') #สถานะสินค้า หมดแล้ว /ยังคงเหลือ
    def __str__(self):
        return f'{self.product_status} '

#สินค้า
class Product(models.Model): 
    product_name = models.CharField(max_length=1000,default=' ')
    product_price = models.IntegerField()
    product_detail = models.CharField(max_length=1000,default=' ')
    product_img = models.CharField(max_length=1000,default=' ')
    product_type = models.ForeignKey(Product_Type,on_delete=models.CASCADE) #หมวดหมู่สินค้า
    product_status =  models.ForeignKey(Product_Status,on_delete=models.CASCADE)  #สถานะสินค้า
    amount = models.IntegerField() #จำนวนสินค้า
    def __str__(self):
        return f'{self.product_type} {self.product_status} '

#สถานะการชำระเงิน
class Money_Status(models.Model):
    money_status =  models.CharField(max_length=100,default=' ') 
    def __str__(self):
        return f'{self.money_status} '
   

#ตัวเลือกการจัดส่ง

class Delivery_Options (models.Model):
   delivery_options =  models.CharField(max_length=1000) 
   def __str__(self):
        return f'{self.delivery_options} '

# class Delivery_options (models.Model):
#     by_yourself = models.BooleanField(default=True)
#     by_store  = models.BooleanField(default=False)



# ตัวเลือกการชำระเงิน
class Payment_Options (models.Model):
    payment_options =  models.CharField(max_length=1000) 
    # by_cash = models.BooleanField(default=True)
    # by_bank = models.BooleanField(default=False)
    def __str__(self):
        return f'{self.payment_options} '


# สั่งซื้อ
class Order (models.Model): 
    # order_id = models.AutoField(primary_key=True) #รหัสสั่งซื้อ
    date = models.CharField(max_length=1000) 
    # shopping_date =  models.CharField(max_length=100,default=' ') 
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    admin =  models.ForeignKey(Admin,on_delete=models.CASCADE)
    all_price =  models.CharField(max_length=100,default=' ') 
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    money_status = models.ForeignKey(Money_Status,on_delete=models.CASCADE) #สถานะการชำระเงิน
    delivery_options = models.ForeignKey(Delivery_Options,on_delete=models.CASCADE)
    payment_options = models.ForeignKey(Payment_Options,on_delete=models.CASCADE)
    def __str__(self):
        return f'{self.user} {self.admin} {self.money_status}  {self.delivery_options} {self.payment_options} '

class Payment (models.Model):
    date =  models.CharField(max_length=1000) 
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    order= models.ForeignKey(Order,on_delete=models.CASCADE) #รหัสการสั่งซื้อ
    img = models.CharField(max_length=1000) 
    payment_options = models.ForeignKey(Payment_Options,on_delete=models.CASCADE)

#รายการสินค้า
class Orderproduct (models.Model):
    # orderproducts_id = models.AutoField(primary_key=True) #รหัสรายการสินค้า
    # products = models.ForeignKey(Products,on_delete=models.CASCADE) #รหัสสินค้า
    order= models.ForeignKey(Order,on_delete=models.CASCADE) #รหัสการสั่งซื้อ
    orderproducts = models.ForeignKey(Product,on_delete=models.CASCADE)
    amount = models.IntegerField() #จำนวนสินค้า
    
    def __str__(self):
        return f' {self.order} {self.orderproducts} '

#ตะกร้าสินค้า
class Carts (models.Model):
    # carts_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    product= models.ForeignKey(Product,on_delete=models.CASCADE)
    amount  = models.IntegerField() #จำนวนสินค้าที่เลือก
    # order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
    def __str__(self):
        return f'{self.user} {self.product}  '

#บทสนทนา  
class Conversations(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    # admin = models.ForeignKey(Admin,on_delete=models.CASCADE)
    message = models.CharField(max_length=1000,default=' ')
    date =   models.DateTimeField(auto_now_add=True)
    time = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return f'{self.user} {self.admin} '


class Storck(models.Model):
    all_products= models.IntegerField()
    Sold = models.IntegerField()
    inventories = models.IntegerField()
    # def __str__(self):
    #     return f'{self.inventories}   '


