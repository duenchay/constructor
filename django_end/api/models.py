
from django.contrib.admin.sites import DefaultAdminSite
from django.db import models
from django.db.models.deletion import CASCADE
from django.contrib.auth.models import AbstractUser
from django.conf import settings
from django.shortcuts import reverse
class Users(AbstractUser): 
    # pass
    # admin = models.AutoField(primary_key=True)
    # user= models.ForeignKey(User,on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100,default=' ',verbose_name = 'ชื่อ')
    last_name = models.CharField(max_length=100,default=' ',verbose_name = 'นามสกุล')
    email = models.CharField(max_length=50,default=' ',verbose_name = 'อีเมล')
    avatar = models.ImageField(upload_to='images/users/', default='images/users/no-img.png' ,verbose_name = 'รูปโปรไฟล์')
    # username = models.CharField(max_length=100,default=' ')
    password = models.CharField(max_length=500,default=' ')
    # USERNAME_FIELD = "username"
    def __str__(self):
        return f'{self.username} '

    # def name(self):
    #     return self.username    
   
    class Meta:
        verbose_name = 'แอดมิน2' 


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
    store_name = models.CharField(max_length=100,default='- ',verbose_name = 'ชื่อร้าน',null=True)
    store_img = models.ImageField(upload_to='images/store/', default='images/store/no-img.png', verbose_name = 'รูปร้าน',null=True)
    store_phone = models.CharField(max_length=100,default=' -',verbose_name = 'เบอร์โทรศัพท์ร้าน',null=True)
    store_address = models.CharField(max_length=100,default=' -',verbose_name = 'ที่อยู่ร้าน',null=True)
    lat =  models.CharField(max_length=1000,default=' -',null=True)
    lng =  models.CharField(max_length=1000,default='- ',null=True)
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

    name = models.CharField(max_length=1000,default=' ',verbose_name = 'ชื่อสินค้า')
    # product_price = models.FloatField(verbose_name = 'ราคาสินค้า')
    price = models.DecimalField(max_digits=7, decimal_places=2)
    product_detail = models.TextField(max_length=10000,default=' ',verbose_name = 'รายละเอียดสินค้า')
    product_img = models.ImageField(upload_to='images/product/', default='images/product/no-img.png' ,verbose_name = 'รูปสินค้า')
    product_type = models.ForeignKey(Product_Type,on_delete=models.CASCADE,verbose_name = 'หมวดหมู่สินค้า') #หมวดหมู่สินค้า
    product_status =  models.ForeignKey(Product_Status,on_delete=models.CASCADE,verbose_name = 'สถานะสินค้า')  #สถานะสินค้า
    quantity = models.IntegerField(verbose_name = 'จำนวนสินค้า') #จำนวนสินค้า
    received_quantity = models.IntegerField(default = 0, null = True, blank = True)
   
    # slug = models.SlugField()
    def __str__(self):
        return f'{self.name}  '
    class Meta:
        verbose_name = 'สินค้า'

class Sale(models.Model):
    item = models.ForeignKey(Product, on_delete = models.CASCADE)
    quantity = models.IntegerField(default = 0, null = True, blank = True)
    # amount_received = models.IntegerField(default = 0, null = True, blank = True)
    # issued_to = models.CharField(max_length = 50, null = True, blank = True)
    # unit_price = models.IntegerField(default = 0, null = True, blank = True)

    # def get_total(self):
    #     total = self.quantity * self.item.unit_price
    #     return int(total)
    
    # def get_change(self):
    #     change = self.get_total() - self.amount_received
    #     return abs(int(change))

    
    def __str__(self):
        return self.item.item_name

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


class Order(models.Model):
    name = models.CharField(max_length=191)
    email = models.EmailField()
    postal_code = models.IntegerField()
    address = models.CharField(max_length=191)
    date = models.DateTimeField(auto_now_add=True)
    paid = models.BooleanField(default=False)

    def __str__(self):
        return "{}".format(self.id)
        # return "{}:{}".format(self.id, self.email)

    def total_cost(self):
        return sum([ li.cost() for li in self.lineitem_set.all() ] )


class LineItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=7, decimal_places=2)
    quantity = models.IntegerField()
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{}:{}".format(self.product.name, self.id)

    def cost(self):
        return self.price * self.quantity
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

# สั่งซื้อ
# class Order (models.Model): 
#     # order_id = models.AutoField(primary_key=True) #รหัสสั่งซื้อ
#     date = models.DateTimeField(auto_now=False,  verbose_name='วันที่สั่งสินค้า')
#     # shopping_date =  models.CharField(max_length=100,default=' ') 
#     user = models.ForeignKey(settings.AUTH_USER_MODEL,
#                              on_delete=models.CASCADE,verbose_name = 'รหัสผู้สั่งซื้อสินค้า')
#     # admin =  models.ForeignKey(Admin,on_delete=models.CASCADE,verbose_name = 'รหัสผู้ขายสินค้า')
#     all_price =  models.FloatField(verbose_name = 'ราคารวม')
#     lat =  models.CharField(max_length=1000,default=' ')
#     lng =  models.CharField(max_length=1000,default=' ')
#     # money_status = models.ForeignKey(Money_Status,on_delete=models.CASCADE,verbose_name = 'สถานะการชำระเงิน') #สถานะการชำระเงิน
#     # delivery_options = models.ForeignKey(Delivery_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการจัดส่ง')
#     # payment_options = models.ForeignKey(Payment_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการชำระเงิน')
#     def __str__(self):
#         return f'{self.user} '
#     class Meta:
#         verbose_name = 'ข้อมูลการสั่งซื้อ'
#     def get_total(self):
#         total = 0
#         for order_item in self.items.all():
#             total += order_item.get_final_price()
#         if self.coupon:
#             total -= self.coupon.amount
#         return total

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
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=models.CASCADE ,verbose_name = 'รหัสผู้ใช้งาน')
    ordered = models.BooleanField(default=False)
    product= models.ForeignKey(Product,on_delete=models.CASCADE,verbose_name = 'รหัสสินค้า')
    quantity  = models.IntegerField(default=1 ,verbose_name = 'จำนวนสินต้าที่เลือก') #จำนวนสินค้าที่เลือก
    # order_id = models.ForeignKey(Order,on_delete=models.CASCADE)
    # def __str__(self):
    #     return f'{self.user} {self.product}  '
    class Meta:
        verbose_name = 'ตะกร้าสินค้า'
    def __str__(self):
        return f"{self.quantity} of {self.product.product_name}"

    def get_total_item_price(self):
        return self.quantity * self.product.product_price

    # def get_total_discount_item_price(self):
    #     return self.quantity * self.product.product_price

    def get_amount_saved(self):
        return self.get_total_item_price() - self.get_total_discount_item_price()

    def get_final_price(self):
        # if self.product.product_price:
        #     return self.get_total_discount_item_price()
        return self.get_total_item_price()



#บทสนทนา  
class Conversations(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name = 'รหัสผู้ใช้งาน',)
    # admin = models.ForeignKey(Admin,on_delete=models.CASCADE)
    message = models.CharField(max_length=1000,default=' ',verbose_name = 'ข้อความ')
    joined_at = models.DateTimeField(auto_now_add=True)  
    # updated_at = models.DateTimeField(auto_now=True)  
    def __str__(self):
        return f'{self.user}  '
    class Meta:
        verbose_name = 'บทสนทนา'

# //Stock
class Storck(models.Model):
    product= models.ForeignKey(Product,on_delete=models.CASCADE,verbose_name = 'รหัสสินค้า')
    all_products= models.IntegerField(verbose_name = 'จำนวนสินค้าทั้งหมด')
    Sold = models.IntegerField(verbose_name = 'จำนวนสินค้าที่ขายได้')
    inventories = models.IntegerField(verbose_name = 'จำนวนสินค้าที่คงเหลือ')
    # def __str__(self):
    #     return f'{self.inventories}   '
    class Meta:
        verbose_name = 'คลังสินค้า'


