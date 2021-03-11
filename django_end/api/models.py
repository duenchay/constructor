
from django.contrib.admin.sites import DefaultAdminSite
from django.db import models
from django.db.models.deletion import CASCADE
from django.contrib.auth.models import AbstractUser
from django.conf import settings
from django.shortcuts import reverse

class Users(AbstractUser): 
    first_name = models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อ')
    last_name = models.CharField(max_length=100,default=' ',verbose_name = 'นามสกุล')
    email = models.CharField(max_length=50,default=' ',verbose_name = 'อีเมล')
    avatar = models.ImageField(upload_to='images/users/', default='images/users/no-img.png' ,verbose_name = 'รูปโปรไฟล์')
    password = models.CharField(max_length=500,default=' ')
    def __str__(self):
        return f'{self.username} '

    # def name(self):
    #     return self.username    
   
    class Meta:
        verbose_name = 'แอดมิน2' 

class Mechanic_Type (models.Model):
    # mechanicCategory_id = models.AutoField(primary_key=True)
    mechanic_type= models.CharField(max_length=100,default=' ',verbose_name = 'ประเภทช่าง')
    def __str__(self):
        return f'{self.mechanic_type} '
    class Meta:
        verbose_name = 'ประเภทช่าง'

class Mechanic(models.Model): 
    mechanic_fname =models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อ')
    mechanic_lname =models.CharField(max_length=100,default=' ',verbose_name = 'นามสกุล')
    mechanic_phone =models.CharField(max_length=100,default=' ',verbose_name = 'เบอร์โทรศัพท์')
    mechanic_email =models.CharField(max_length=100,default=' ',verbose_name = 'อีเมล')
    avatar = models.ImageField(upload_to='images/mechanic/', default='images/mechanic/no-img.png', verbose_name = 'รูปโปรไฟล์')
    mechanic_img = models.ImageField(upload_to='images/mechanic/', default='images/mechanic/no-img.png', verbose_name =  'รูปงานช่าง')
    mechanic_detail =models.TextField(max_length=1000,default=' ',verbose_name = 'รายละเอียดงานช่าง')
    mechanic_type= models.ForeignKey(Mechanic_Type,on_delete=models.CASCADE) 
 
    def __str__(self):
        return f'{self.mechanic_email}  '
    class Meta:
        verbose_name = 'ช่าง'

class Store (models.Model):
    store_name = models.CharField(max_length=100,default='- ',verbose_name = 'ชื่อร้าน',null=True)
    store_img = models.ImageField(upload_to='images/store/', default='images/store/no-img.png', verbose_name = 'รูปร้าน',null=True)
    store_phone = models.CharField(max_length=100,default=' -',verbose_name = 'เบอร์โทรศัพท์ร้าน',null=True)
    store_address = models.CharField(max_length=100,default=' -',verbose_name = 'ที่อยู่ร้าน',null=True)
  
    def __str__(self):
        return f'{self.store_name} '
    class Meta:
        verbose_name = 'ข้อมูลร้าน'



# หมวดหมู่สินค้า
class Product_Type (models.Model):
    product_type = models.CharField(max_length=100,default=' ',verbose_name = 'หมวดหมู่สินค้า')
    def __str__(self):
        return f'{self.product_type} '
    class Meta:
        verbose_name = 'หมวดหมู่สินค้า'

# สถานะสินค้า
class Product_Status (models.Model):
    product_status= models.CharField(max_length=100,default=' ',verbose_name = 'สถานะสินค้า') #สถานะสินค้า หมดแล้ว /ยังคงเหลือ
    def __str__(self):
        return f'{self.product_status} '
    class Meta:
        verbose_name = 'สถานะสินค้า'

#สินค้า
class Product(models.Model): 
    name = models.CharField(max_length=1000,default=' ',verbose_name = 'ชื่อสินค้า')
    price = models.DecimalField(max_digits=7, decimal_places=2)
    product_detail = models.TextField(max_length=10000,default=' ',verbose_name = 'รายละเอียดสินค้า')
    product_img = models.ImageField(upload_to='images/product/', default='images/product/no-img.png' ,verbose_name = 'รูปสินค้า')
    product_type = models.ForeignKey(Product_Type,on_delete=models.CASCADE,verbose_name = 'หมวดหมู่สินค้า') #หมวดหมู่สินค้า
    product_status =  models.ForeignKey(Product_Status,on_delete=models.CASCADE,verbose_name = 'สถานะสินค้า', null = True, blank = True)  #สถานะสินค้า
    quantity = models.IntegerField(verbose_name = 'จำนวนสินค้า') #จำนวนสินค้า
    received_quantity = models.IntegerField(default = 0, null = True, blank = True)
 
    def __str__(self):
        return f'{self.name}  '
    class Meta:
        verbose_name = 'สินค้า'

# class Sale(models.Model):
#     item = models.ForeignKey(Product, on_delete = models.CASCADE)
#     quantity = models.IntegerField(default = 0, null = True, blank = True)

class CartItem(models.Model):
    user = models.ForeignKey(Users,on_delete=models.CASCADE , null=True)
    cart_id = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=7, decimal_places=2)
    quantity = models.IntegerField()
    date_added = models.DateTimeField(auto_now_add=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return "{}:{}".format(self.product.name, self.id)

    def update_quantity(self, quantity):
        self.quantity = self.quantity + quantity
        self.save()

    def total_cost(self):
        return self.quantity * self.price

#สถานะการชำระเงิน
class Money_Status(models.Model):
    money_status =  models.CharField(max_length=100,default=' ',verbose_name = 'สถานะการชำระเงิน') 
    def __str__(self):
        return f'{self.money_status} '
    class Meta:
        verbose_name = 'สถานะการชำระเงิน'
   

#ตัวเลือกการจัดส่ง

class Delivery_Options (models.Model):
    delivery_options =  models.CharField(max_length=1000,verbose_name = 'ตัวเลือกการจัดส่ง') 
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


class Order(models.Model):

    user = models.ForeignKey(Users, on_delete=models.CASCADE, null=True)
    money_status = models.ForeignKey(Money_Status,on_delete=models.CASCADE,verbose_name = 'สถานะการชำระเงิน') #สถานะการชำระเงิน
    delivery_options = models.ForeignKey(Delivery_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการจัดส่ง')
    payment_options = models.ForeignKey(Payment_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการชำระเงิน')
    address = models.CharField(max_length=191)
    date = models.DateTimeField(auto_now_add=True)
    # paid = models.BooleanField(default=False)

    def __str__(self):
        # return f'ID:{self.id} Status:{self.money_status} Delivery_options:{self.delivery_options}'  
        # return "{}:{}".format(self.id, self.email)
        return "{}".format(self.id)

    def total_cost(self):
        return sum([ li.cost() for li in self.lineitem_set.all() ] )

    def as_bootstrap_status(self):
        if self.money_status.money_status =='ชำระเงินแล้ว':
            return 'success'
        elif self.money_status.money_status == 'ยังไม่ชำระ' :
            return 'danger'

#รายการสินค้า
class LineItem(models.Model):
    user = models.ForeignKey(Users,on_delete=models.CASCADE , null=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=7, decimal_places=2)
    quantity = models.IntegerField()
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{}:{}".format(self.product.name, self.id)

    def cost(self):
        return self.price * self.quantity


# class Payment (models.Model):
#     date =  models.DateTimeField(auto_now=False,  verbose_name='วันที่ชำระเงิน') 
#     order= models.ForeignKey(Order,on_delete=models.CASCADE,verbose_name = 'รหัสการสั่งซื้อสินค้า') #รหัสการสั่งซื้อ
#     payment_img = models.ImageField(upload_to='media/', verbose_name = 'รูปสลิปโอนเงิน',null=True ,blank=True)
#     def __str__(self):
#         return f'{self.user} {self.order} {self.payment_options} '
#     class Meta:
#         verbose_name = 'การชำระเงิน'


#รายการสินค้า
# class Order_Product (models.Model):
#     order= models.ForeignKey(Order,on_delete=models.CASCADE,verbose_name = 'รหัสการสั่งซื้อ') #รหัสการสั่งซื้อ
#     product = models.ForeignKey(Product,on_delete=models.CASCADE,verbose_name = 'รหัสสินค้า')
#     amount = models.IntegerField(verbose_name = 'จำนวนสินค้า') #จำนวนสินค้า
    
#     def __str__(self):
#         return f' {self.order} {self.product} '
#     class Meta:
#         verbose_name = 'รายการสินค้า'




