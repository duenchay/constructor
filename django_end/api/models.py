# from typing import AbstractSet
from re import T
from django.contrib.admin.sites import DefaultAdminSite
from django.db import models
from django.db.models.deletion import CASCADE


class Role(models.Model):
    role = models.CharField(max_length=100,default=' ' ,verbose_name = 'บทบาทผู้ใช้งาน')
    def __str__(self):
        return f'{self.role} '
    class Meta:
        verbose_name = 'บทบาทผู้ใช้งาน'
   

class User(models.Model):
    # id = models.AutoField(primary_key=True)
    # user_name = models.CharField(max_length=100,default=' ')
    # user_lastname = models.CharField(max_length=100,default=' ')
    username = models.CharField(max_length=100,default=' ' )
    email = models.CharField(max_length=50,default=' ')
    password = models.CharField(max_length=100,default=' ')
    role = models.ForeignKey(Role,on_delete=models.CASCADE) 
    def __str__(self):
        return f'{self.email}{self.role} '
    class Meta:
        verbose_name = 'ผู้ใช้งานระบบ'

class Customer (models.Model):
    user= models.ForeignKey(User,on_delete=models.CASCADE)
    customer_fname = models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อ')
    customer_lname = models.CharField(max_length=100,default=' ',verbose_name = 'นามสกุล')
    customer_phone = models.CharField(max_length=100,default=' ',verbose_name = 'เบอร์โทรศัพท์')
    customer_email = models.CharField(max_length=100,default=' ',verbose_name = 'อีเมล')
    avatar = models.ImageField(upload_to='media/', verbose_name = 'รูปโปรไฟล์')
    def __str__(self):
        return f'{self.customer_email} '
    class Meta:
        verbose_name = 'ลูกค้า'


class Admin(models.Model): 
    # admin = models.AutoField(primary_key=True)
    user= models.ForeignKey(User,on_delete=models.CASCADE)
    admin_fname = models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อ')
    admin_lname = models.CharField(max_length=100,default=' ',verbose_name = 'นามสกุล')
    admin_email = models.CharField(max_length=50,default=' ',verbose_name = 'อีเมล')
    avatar = models.ImageField(upload_to='media/', verbose_name = 'รูปโปรไฟล์')
    # username = models.CharField(max_length=100,default=' ')
    # password = models.CharField(max_length=100,default=' ')
    def __str__(self):
        return f'{self.admin_email} '
    class Meta:
        verbose_name = 'แอดมิน'

class Mechanic_Type (models.Model):
    # mechanicCategory_id = models.AutoField(primary_key=True)
    mechanic_type= models.CharField(max_length=100,default=' ',verbose_name = 'ประเภทช่าง')
    def __str__(self):
        return f'{self.mechanic_type} '
    class Meta:
        verbose_name = 'ประเภทช่าง'

class Mechanic(models.Model): 
    user= models.ForeignKey(User,on_delete=models.CASCADE)
    mechanic_fname =models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อ')
    mechanic_lname =models.CharField(max_length=100,default=' ',verbose_name = 'นามสกุล')
    mechanic_phone =models.CharField(max_length=100,default=' ',verbose_name = 'เบอร์โทรศัพท์')
    mechanic_email =models.CharField(max_length=100,default=' ',verbose_name = 'อีเมล')
    avatar = models.ImageField(upload_to='images/mechanic/', default='images/mechanic/no-img.png', verbose_name = 'รูปโปรไฟล์')
    mechanic_img = models.ImageField(upload_to='media/', verbose_name =  'รูปงานช่าง')
    mechanic_detail =models.CharField(max_length=100,default=' ',verbose_name = 'รายละเอียดงานช่าง')
    mechanic_type= models.ForeignKey(Mechanic_Type,on_delete=models.CASCADE) #ประเภทช่าง
 
    def __str__(self):
        return f'{self.mechanic_email}  '
    class Meta:
        verbose_name = 'ช่าง'

class Store (models.Model):
    store_name = models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อร้าน')
    store_img = models.ImageField(upload_to='images/store/', default='images/store/no-img.png', verbose_name = 'รูปร้าน')
    store_phone = models.CharField(max_length=100,default=' ',verbose_name = 'เบอร์โทรศัพท์ร้าน')
    store_address = models.CharField(max_length=100,default=' ',verbose_name = 'ที่อยู่ร้าน')
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    # time_open =models.CharField(max_length=100,default=' ')
    # time_close =models.CharField(max_length=100,default=' ')
    def __str__(self):
        return f'{self.store_name} '
    class Meta:
        verbose_name = 'ข้อมูลร้าน'



# หมวดหมู่สินค้า
class Product_Type (models.Model):
    # id = models.AutoField(primary_key=True)
    product_type = models.CharField(max_length=100,default=' ',verbose_name = 'หมวดหมู่สินค้า')
    def __str__(self):
        return f'{self.product_type} '
    class Meta:
        verbose_name = 'หมวดหมู่สินค้า'

# สถานะสินค้า
class Product_Status (models.Model):
    # id = models.AutoField(primary_key=True)
    product_status= models.CharField(max_length=100,default=' ',verbose_name = 'สถานะสินค้า') #สถานะสินค้า หมดแล้ว /ยังคงเหลือ
    def __str__(self):
        return f'{self.product_status} '
    class Meta:
        verbose_name = 'สถานะสินค้า'

#สินค้า
class Product(models.Model): 
    # id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=1000,default=' ',verbose_name = 'ชื่อสินค้า')
    product_price = models.FloatField(verbose_name = 'ราคาสินค้า')
    product_detail = models.TextField(max_length=10000,default=' ',verbose_name = 'รายละเอียดสินค้า')
    product_img = models.ImageField(upload_to='images/product/', default='images/product/no-img.png' ,verbose_name = 'รูปสินค้า')
    product_type = models.ForeignKey(Product_Type,on_delete=models.CASCADE,verbose_name = 'หมวดหมู่สินค้า') #หมวดหมู่สินค้า
    product_status =  models.ForeignKey(Product_Status,on_delete=models.CASCADE,verbose_name = 'สถานะสินค้า')  #สถานะสินค้า
    product_amount = models.IntegerField(verbose_name = 'จำนวนสินค้า') #จำนวนสินค้า
    def __str__(self):
        return f'{self.product_type} {self.product_status} '
    class Meta:
        verbose_name = 'สินค้า'

#สถานะการชำระเงิน
class Money_Status(models.Model):
    money_status =  models.CharField(max_length=100,default=' ',verbose_name = 'สถานะการรชำระเงิน') 
    def __str__(self):
        return f'{self.money_status} '
    class Meta:
        verbose_name = 'สถานะการชำระเงิน'
   

#ตัวเลือกการจัดส่ง

class Delivery_Options (models.Model):
    delivery_options =  models.CharField(max_length=100,verbose_name = 'ตัวเลือกการจัดส่ง') 
    def __str__(self):
        return f'{self.delivery_options} '
    class Meta:
        verbose_name = 'ตัวเลือกการจัดส่ง'
    

# ตัวเลือกการชำระเงิน
class Payment_Options (models.Model):
    payment_options =  models.CharField(max_length=100,verbose_name = 'ตัวเลือกการชำระเงิน') 
    def __str__(self):
        return f'{self.payment_options} '
    class Meta:
        verbose_name = 'ตัวเลือกการชำระเงิน'

# สั่งซื้อ
class Order (models.Model): 
    # order_id = models.AutoField(primary_key=True) #รหัสสั่งซื้อ
    date = models.DateTimeField(auto_now=False,  verbose_name='วันที่สั่งสินค้า')
    # shopping_date =  models.CharField(max_length=100,default=' ') 
    user = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name = 'รหัสผู้สั่งซื้อสินค้า')
    admin =  models.ForeignKey(Admin,on_delete=models.CASCADE,verbose_name = 'รหัสผู้ขายสินค้า')
    all_price =  models.FloatField(verbose_name = 'ราคารวม')
    lat =  models.CharField(max_length=1000,default=' ')
    lng =  models.CharField(max_length=1000,default=' ')
    money_status = models.ForeignKey(Money_Status,on_delete=models.CASCADE,verbose_name = 'สถานะการชำระเงิน') #สถานะการชำระเงิน
    delivery_options = models.ForeignKey(Delivery_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการจัดส่ง')
    payment_options = models.ForeignKey(Payment_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการชำระเงิน')
    def __str__(self):
        return f'{self.user} '
    class Meta:
        verbose_name = 'ข้อมูลการสั่งซื้อ'

class Payment (models.Model):
    date =  models.DateTimeField(auto_now=False,  verbose_name='วันที่ชำระเงิน') 
    user = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name = 'รหัสผู้สั่งซื้อสินค้า')
    order= models.ForeignKey(Order,on_delete=models.CASCADE,verbose_name = 'รหัสการสั่งซื้อสินค้า') #รหัสการสั่งซื้อ
    payment_img = models.ImageField(upload_to='media/', verbose_name = 'รูปสลิปโอนเงิน',null=True ,blank=True)
    payment_options = models.ForeignKey(Payment_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการชำระเงิน')
    def __str__(self):
        return f'{self.user} {self.order} {self.payment_options} '
    class Meta:
        verbose_name = 'การชำระเงิน'


#รายการสินค้า
class Order_Product (models.Model):
    # orderproducts_id = models.AutoField(primary_key=True) #รหัสรายการสินค้า
    # products = models.ForeignKey(Products,on_delete=models.CASCADE) #รหัสสินค้า
    order= models.ForeignKey(Order,on_delete=models.CASCADE,verbose_name = 'รหัสการสั่งซื้อ') #รหัสการสั่งซื้อ
    product = models.ForeignKey(Product,on_delete=models.CASCADE,verbose_name = 'รหัสสินค้า')
    amount = models.IntegerField(verbose_name = 'จำนวนสินค้า') #จำนวนสินค้า
    
    def __str__(self):
        return f' {self.order} {self.product} '
    class Meta:
        verbose_name = 'รายการสินค้า'

#ตะกร้าสินค้า
class Carts (models.Model):
    # carts_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name = 'รหัสผู้ใช้งาน')
    product= models.ForeignKey(Product,on_delete=models.CASCADE,verbose_name = 'รหัสสินค้า')
    amount  = models.IntegerField(verbose_name = 'จำนวนสินต้าที่เลือก') #จำนวนสินค้าที่เลือก
    # order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
    def __str__(self):
        return f'{self.user} {self.product}  '
    class Meta:
        verbose_name = 'ตะกร้าสินค้า'

#บทสนทนา  
class Conversations(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name = 'รหัสผู้ใช้งาน',)
    # admin = models.ForeignKey(Admin,on_delete=models.CASCADE)
    message = models.CharField(max_length=1000,default=' ',verbose_name = 'ข้อความ')
    joined_at = models.DateTimeField(auto_now_add=True)  
    updated_at = models.DateTimeField(auto_now=True)  
    def __str__(self):
        return f'{self.user}  '
    class Meta:
        verbose_name = 'บทสนทนา'


class Storck(models.Model):
    product= models.ForeignKey(Product,on_delete=models.CASCADE,verbose_name = 'รหัสสินค้า')
    all_products= models.IntegerField(verbose_name = 'จำนวนสินค้าทั้งหมด')
    Sold = models.IntegerField(verbose_name = 'จำนวนสินค้าที่ขายได้')
    inventories = models.IntegerField(verbose_name = 'จำนวนสินค้าที่คงเหลือ')
    # def __str__(self):
    #     return f'{self.inventories}   '
    class Meta:
        verbose_name = 'คลังสินค้า'


