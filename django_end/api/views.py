from api.forms import *
from .models import *
from .serializers import *
from django.http import request
from django.http.response import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.hashers import make_password
from django.shortcuts import render, get_object_or_404
from . import cart 
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.utils import timezone
# หน้าแรก
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.exceptions import ObjectDoesNotExist
from django.views.generic import  View #,ListView, DetailView,


def index(request):
    products_list = Product.objects.all().order_by('name')
    product_type=Product_Type.objects.all()
    paginator = Paginator(products_list,8) #จำนวนรายการ/หน้า
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    return render(request, 'api/index.html',{
         'product_type' :product_type,
         'products':products })


#แสดงสินค้าทั้งหมด
def showProductAll(request):
    product_type=Product_Type.objects.all() # แสดงประเภทช่างบน tap
    product=Product.objects.all()
 
    return render(request,'api/showProductAll.html',{
        'product_type':product_type,
		'product':product,
})

#ประวัติการซื้อ
def order(request):
  
    orders = Order.objects.filter(user =request.user, ordered=True)
    product_type=Product_Type.objects.all()

    return render(request, 'api/order.html',{
        'orders':orders,
        'product_type':product_type
    })

# หน้ารายการสินค้า
def orderproduct(request,id=0):
   
    orders = Order.objects.filter(user =request.user,id=id)
    litem = OrderItem.objects.filter(id=id)
    # order = Order.objects.get(user=self.request.user, ordered=False)
    print(id)
    # item_count = cart.item_count(request)
    product_type=Product_Type.objects.all()
    # print(litem)
    print(litem)
    print(orders)
    # users = Users.objects.get(username=request.user.username)
    return render(request, 'api/orderproduct.html',{
        'orders':orders,
        'litem':litem,
        # 'cart_item_count':item_count,
        'product_type':product_type
        # 'users':users
    })

# หน้าสินค้าแต่ละหมวดหมู่
# def productTypeUser(request,id=0): 
#     type=Product_Type.objects.get(pk=id)
#     product_type=Product_Type.objects.all()
#     # adminn = Adminn.objects.get(username=request.user.username)
#     product=Product.objects.filter(product_type=type).order_by('id')
#     # item_count = cart.item_count(request)
#     # mechanic= Mechanic.objects.all()
#     return render(request,'api/productTypeUser.html',{
#         'product':product,
#         # 'product_type' :product,
#         'product_type':product_type,
#         # 'cart_item_count':item_count
#         # 'adminn' :adminn
#         })

    # รายละเอียดสินค้า 
def productDetail(request,pk):
    # if request.user.is_anonymous:
    #     return redirect('/login')
    # else: 
    #     users= Users.objects.get(username=request.user.username)
   
    # except: pass
   
    product = get_object_or_404(Product, id=pk)
    # item_count = cart.item_count(request) #ตัวเลขบนตะกร้าสินค้า
    product_type=Product_Type.objects.all()

    # if request.method == 'POST':
    #     form = CartForm(request, request.POST)
    #     if form.is_valid():
    #         request.form_data = form.cleaned_data
    #         cart.add_item_to_cart(request)   #เพิ่มสินค้าเข้าตะกร้า
    #         return redirect('show_cart')

    # form = CartForm(request, initial={'pk': product.pk})
    return render(request, 'api/productDetail.html', {
                                            'product': product,
                                            # 'form': form,
                                            # 'cart_item_count': item_count,
                                            'product_type':product_type,
                                            # 'users':users
                                         
                                            })


def home(request):
    all_products = Product.objects.all()
    return render(request, "api/home.html", {
                                    'all_products': all_products,
                                 })
# @login_required(login_url='/login')                        
class OrderSummaryView(LoginRequiredMixin, View):
    def get(self, *args, **kwargs):
        try:
            order = Order.objects.get(user=self.request.user, ordered=False)

            context = {
                'object': order,

            }
            return render(self.request, 'api/order_summary.html', context)
        except ObjectDoesNotExist:
            messages.warning(self.request, "คุณไม่มีสินค้าในตระกร้าสินค้า")
            return redirect("/")

@login_required(login_url='/login') 
def add_to_cart(request, pk):
    product = get_object_or_404(Product, id=pk)
    order_product, created = OrderItem.objects.get_or_create(
        product=product, user=request.user, ordered=False)
    order_qs = Order.objects.filter(user=request.user, ordered=False)
    # if there is a order
    # หากมีการสั่งซื้อ
    if order_qs.exists():
        order = order_qs[0]
        # check if the order item is in the order ==(order ache,for same-orderitem
        # ตรวจสอบว่ารายการสั่งซื้ออยู่ในคำสั่งซื้อหรือไม่ == (สั่งซื้อสำหรับรายการสั่งซื้อเดียวกัน
        if order.products.filter(product__pk=product.pk).exists():
            order_product.quantity += 1
            # product.quantity -=  order_product.quantity
            if order_product.quantity  <= product.quantity:
                messages.info(request, "เพิ่มสินค้าเข้าตระกร้าสำเร็จ")
                # product.save()
                order_product.save()
                        # product.save()
            else:
                messages.warning(request, "สินค้าในสต๊อกไม่พอ")
            # order_product.save()
            print(product.quantity)
            print( order_product.quantity)
            print(order_product)
            return redirect("order-summary")
        else:
            # ==(order ache, different-orderitem ache)
            # สั่งซื้อสั่งซื้อที่แตกต่างกัน
            order.products.add(order_product)
            messages.info(request, "เพิ่มสินค้าเข้าตระกร้าสำเร็จ")
            return redirect("order-summary")
    # if there is no ordequantityr..first time order and first item
    # หากไม่มีคำสั่งซื้อ.. สั่งครั้งแรกและสินค้าชิ้นแรก
    else:
        ordered_date = timezone.now()
        order = Order.objects.create(
            user=request.user,
            ordered_date=ordered_date,
            # money_status =Money_Status.objects.get(pk=request.POST['money_status']),
            # delivery_options =Delivery_Options.objects.get(pk=request.POST['delivery_options']),
            # payment_options =Payment_Options.objects.get(pk=request.POST['payment_options']),
            # address = request.POST['address']

            )
        order.products.add(order_product)

        messages.info(request, "เพิ่มสินค้าเข้าตระกร้าสำเร็จ")
        return redirect("order-summary")

def remove_from_cart(request, pk):
    product = get_object_or_404(Product, id=pk)
    order_qs = Order.objects.filter(
        user=request.user,
        ordered=False
    )
    if order_qs.exists():
        order = order_qs[0]
        # check if the order item is in the order
        if order.products.filter(product__pk=product.pk).exists():
            order_product = OrderItem.objects.filter(
                product=product,
                user=request.user,
                ordered=False
            )[0]
            order_product.quantity = 1
            order_product.save()
            order.products.remove(order_product)
            messages.info(request, "ลบสินค้าออกจากตระสินค้าสำเร็จ")
            return redirect("order-summary")
        else:
            messages.info(request, "สินค้านี้ไม่ได้อยู่ในรถเข็นของคุณ")
            return redirect("product-detail", id=pk)
    else:
        messages.info(request, "คุณไม่มีคำสั่งซื้อที่ใช้งานอยู่")
        return redirect("product-detail", id=pk)


def remove_single_item_from_cart(request, pk):
    product = get_object_or_404(Product, id=pk)
    order_qs = Order.objects.filter(
        user=request.user,
        ordered=False
    )
    if order_qs.exists():
        order = order_qs[0]
        # check if the order item is in the order
        if order.products.filter(product__pk=product.pk).exists():
            order_product = OrderItem.objects.filter(
                product=product,
                user=request.user,
                ordered=False
            )[0]
            if order_product.quantity > 1:
                order_product.quantity -= 1
                messages.info(request, "ลดจำนวนสินค้าสำเร็จ")
                order_product.save()
            else:
                order.products.remove(order_product)
                messages.info(request, "ลบสินค้าสำเร็จ")
            return redirect("order-summary")
        else:
            messages.info(request, "This item was not in your cart")
            return redirect("product-detail", id=pk)

    else:
        messages.info(request, "คุณไม่มีคำสั่งซื้อที่ใช้งานอยู่")
        return redirect("product-detail", id=pk)


class CheckoutView(LoginRequiredMixin, View):
    def get(self, *args, **kwargs):
        # try:
        form = CheckoutForm()
        order = Order.objects.filter(user=self.request.user, ordered=False)
        context = {
            'order': order,
            'form': form,
            # 'payment_option': payment_option
            'delivery_options': Delivery_Options.objects.all(),
            # 'money_status': Money_Status.objects.all()
           
   }
        return render(self.request, 'api/checkout-page.html', context)
    def post(self, *args, **kwargs):
        # form = CheckoutForm(self.request.POST or None)
        # try:
            # order = Order.objects.get(user=self.request.user, ordered=False)
        form = CheckoutForm(self.request.POST or None)
        if form.is_valid():
            order = Order.objects.get(user=self.request.user, ordered=False)
            order.address = self.request.POST['address']
            order.phone = self.request.POST['phone']
            # order.payment_option =Order.objects.get(pk=self.request.POST['payment_option'])
            order.delivery_options =Delivery_Options.objects.get(pk=self.request.POST['delivery_options'])
            # order.payment_options =Payment_Options.objects.get(pk=self.request.POST['payment_options'])
            order.save()
          
            # order.payment_options =Payment_Options.objects.get(pk=self.request.POST['payment_options'])
            payment_option = form.cleaned_data.get('payment_option')
            if payment_option == 'โอนผ่านบัญชีธนาคาร':
                order.payment_option = payment_option
                order.save()
                
                return redirect('payment', payment_option='stripe')
        
            elif payment_option == 'เงินสด':
                order_products = order.products.all()
                order_products.update(ordered=True)
    
                # form.save()
                order.ordered = True
                order.payment_option = payment_option
                order.save()
                
                messages.success(self.request, "สั่งซื้อสินค้าสำเร็จ!")
                return redirect('/', )
            
            else:
                messages.warning(
                    self.request, "Invalid payment option selected")
                return redirect('check-out')
        # form.save()
    

class PaymentMethod(View):
    def get(self, *args, **kwargs):
        # order
        order = Order.objects.get(user=self.request.user, ordered=False)
        print("Billing = ", order.user)
        if order.user:
            context = {
                'order': order,
            }
            return render(self.request, 'api/payment.html', context)
        else:
            messages.error(
                self.request, "You have not added a billing address")
            return redirect("check-out")

    def post(self, *args, **kwargs):
        order = Order.objects.get(user=self.request.user, ordered=False)

        payment_option = Payment()
        payment_option.ppp = self.request.POST['ppp']
        payment_option.img = self.request.POST['img']
        # payment_option.stripe_charge_id = charge['id']
        payment_option.user = self.request.user
        payment_option.amount = order.get_total()
        payment_option.save()

        order_products = order.products.all()
        # print(order_items)
        order_products.update(ordered=True)
        # product = Product.objects.filter(id=self.kwargs.get('pk'))
        # print(product)
        # order_product = OrderItem.objects.filter(user=self.request.user, ordered=False)
        # # order_product = OrderItem.objects.filter(
        # # product=product, user=self.request.user, ordered=False)
        # # # # order.products.filter(product__pk=product.pk)
        # print(order.products)
        # print(order_product.quantity)
        # print(order_products)

        # product = get_object_or_404(Product, id=self.kwargs.get('pk'))
        # order_product, created = OrderItem.objects.get_or_create(
        # product=product, user=request.user, ordered=True)
        # product =Product.objects.filter(id=self.kwargs.get('pk'))
        
        # quantity =self.request.POST['quantity']
        # product.quantity -=  quantity
        # if order_products.quantity  <= product.quantity:
        #     # product.quantity -=  order_product.quantity
        #     messages.info(request, "อัปเดตสินค้าสำเร็จ")
        #     order_product.save()
        #             # product.save()

        # else:
        #     messages.warning(request, "สินค้าในสต๊อกไม่พอ")
      
        # order_products.save()
      
        # for item in order_products:

            
        #     item.save()
        # print(order)
        print(order_products)     
        # assign the payment
        order.ordered = True
        # order.payment_option = payment_option
        order.save()
        messages.success(self.request, "สั่งซื้อสินค้าสำเร็จ!")
        return redirect("/")



#สินค้าในตะกร้า
# def show_cart(request):
#     item_count = cart.item_count(request)  #จำนวนสินค้า
#     product_type=Product_Type.objects.all() #หมวดหมู่สินค้า

#     if request.method == 'POST':
#         if request.POST.get('submit') == 'Update': #เพิ่ม
#             cart.update_item(request)
#         if request.POST.get('submit') == 'Remove': # ลบ
#             cart.remove_item(request)
#         # form.instance.store = store
#         # form.save()

#     cart_items = cart.get_all_cart_items(request)
#     cart_subtotal = cart.subtotal(request)
#     return render(request, 'api/cart.html', {
#                                             'cart_items': cart_items,
#                                             'cart_subtotal': cart_subtotal,
#                                             'cart_item_count': item_count,
#                                             # 'users':users,
#                                             'product_type':product_type
#                                             })

# def checkout(request):
#     print(request.user)
#     product_type=Product_Type.objects.all()
#     item_count = cart.item_count(request)
#     if request.method == 'POST':
#         print(request.POST)
#         form = CheckoutForm(request.POST)
#         if form.is_valid():
#             order = Order() 
#             order.user = request.user
#             order.address = request.POST['address']
#             # order.money_status =Money_Status.objects.get(pk=request.POST['money_status'])
#             order.delivery_options =Delivery_Options.objects.get(pk=request.POST['delivery_options'])
#             order.payment_options =Payment_Options.objects.get(pk=request.POST['payment_options'])
#             # order.user = request.user
#             # cleaned_data = form.cleaned_data
#             # all_items = cart.get_all_cart_items(request)
#             # for cart_item in all_items:
#             # o = Order(
#             #     # name = cleaned_data.get('name'),
#             #     # user = cleaned_data.get('user'),
#             #     lat = cleaned_data.get('lat'),
#             #     lng = cleaned_data.get('lng'),
#             #     money_status = cleaned_data.get('money_status'),
#             #     delivery_options = cleaned_data.get('delivery_options'),
#             #     payment_options = cleaned_data.get('payment_options'),
#             #     # user = cart_item.user
#             #     user = request.user
                
#             # )
#             order.save()
#             # print(order.user)
#             all_items = cart.get_all_cart_items(request)
#             for cart_item in all_items:
#                 li = LineItem(          #รายการสินค้า
#                     product_id = cart_item.product_id,
#                     price = cart_item.price,
#                     quantity = cart_item.quantity,
#                     order_id = order.id,
#                     user = cart_item.user
#                 )
#                 # print("____________LI____________",type(li))
#                 li.save()

#             cart.clear(request)
            
#             request.session['order_id'] = order.id
#             # messages.info(request, "This item was not in your cart")
          
#            # messages.info(request, messages.INFO, 'Order Placed!')
#             return redirect('/order')
#     else:
#         form = CheckoutForm()
#     return render(request, 'api/checkout.html', {
#     'form': form,
#     # 'users':Users.objects.all(),
#     'product_type':product_type,
#     'cart_item_count':item_count,
#     # 'money_status': Money_Status.objects.all(),
#     'delivery_options': Delivery_Options.objects.all(),
#     'payment_options': Payment_Options.objects.all(),
    
#     })
    
def addstore(request):
    form = StoreForm()
    # users = Users.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = StoreForm(request.POST ,request.FILES)
        if form.is_valid():
            form.instance.users = Users.objects.get(username=request.user.username)
            form.save()
            # return redirect('/addstore')
    else:
        form = StoreForm()
        store = form.instance
    return render(request, 'api/addstore.html',{
                      'form': form,
                    #   'users':users,
                      'store': store
 })

# Searchสินค้า
def search (request):
   
    q=request.GET['q']
    data=Product.objects.filter(name__icontains=q).order_by('id')
    product_type=Product_Type.objects.all()
    return render(request,'api/search.html',{
    'data':data,
    'product_type':product_type
    })

#หน้าโปรไฟล์
def profile(request):
    
    users = Users.objects.get(username=request.user.username)
    product_type=Product_Type.objects.all()
    # item_count = cart.item_count(request)
    return render(request, 'api/profile.html', {
        'users': users,
        'product_type':product_type,
        # 'cart_item_count': item_count
    })


def editprofile(request, id=0):
    users = Users.objects.get(username=request.user.username)
    product_type=Product_Type.objects.all()
    # item_count = cart.item_count(request)
    if request.method == 'POST':
        form = EditProfileForm(request.POST, request.FILES, instance=users)
        if form.is_valid():
            form.save()
            return redirect('/profile')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = EditProfileForm(users)  

    return render(request, 'api/editprofile.html' ,{ 
        'form': form,
        'users':users,
        'product_type':product_type,
        # 'cart_item_count':item_count
    })



def logout(req):
    # if req.adminn.is_/authenticated:
    auth_logout(req)
    return redirect('/')

def login(request):
    if request.method == 'POST':
        # print(request.POST)
        users = authenticate(username=request.POST['username'], password=request.POST['password'])
        # print(users)
        if users is not None:
            print(users)
            auth_login(request, users)
            messages.info(request, "เข้าสู่ระบบสำเร็จ")
            if request.user.is_superuser :

                return redirect('/store')
            else:
                  return redirect('/')
        else: 
            messages.warning(request, "เข้าสู่ระบบไม่สำเร็จ")
    else:
        print('ยังไม่ได้กรอก login/password')
    return render(request, 'api/login.html')

def register(request):
    print('register()')
    form = UsersForm()
    print(request)
    if request.method == 'POST':
        form = UsersForm(request.POST, request.FILES)
        print("request.POST")
        print(request.POST)
        if form.is_valid():
            print('form valid')
            form.instance.password = make_password(request.POST['password'])
            form.save()
            return redirect('/login')
        else: 

            
            print("==== form.errors ====")
            print(form.errors)
    return render(request, 'api/register.html', { 
        'form': form,
       
        })

# หน้าาเทสสสสสสสสสสสสหมวดหมู่
def product_type(request):
    product_type=Product_Type.objects.all().order_by('id')
    # adminn = Adminn.objects.get(username=request.user.username)
    # mechanic= Mechanic.objects.all()
    return render(request,'api/product_type.html',{
        'product_type':product_type,
        # 'adminn' :adminn
        })

# หน้ารวมช่าง
def mechanicUser(request):
    mechanic= Mechanic.objects.all()
    product_type=Product_Type.objects.all()
    # item_count = cart.item_count(request)
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(request, 'api/mechanicUser.html',{
        'mechanic' :mechanic ,
        'product_type':product_type,
        # 'cart_item_count':item_count,
        # 'adminn': adminn
    })

# หน้ารายละเอียดช่าง
def mechanicDetailUser(request,id=0):
    product_type=Product_Type.objects.all()
    mechanic= Mechanic.objects.get(pk=id)
    # item_count = cart.item_count(request)
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(request, 'api/mechanicDetailUser.html',{
        'mechanic' :mechanic,
        'product_type':product_type,
        # 'cart_item_count':item_count
        # 'adminn' :adminn
    })

def base2(req):
    return render(req, 'api/base2.html')

def register1(req):
    return render(req, 'api/register1.html')

# หน้าข้อมูลร้าน
def storeUser(request):
    product_type=Product_Type.objects.all()
    # item_count = cart.item_count(request)
    store = Store.objects.get()
    return render(request, 'api/storeUser.html', {
        'store' :store,
        'product_type' :product_type,
        # 'cart_item_count': item_count
    })
# หมวดหมู่สินค้าบนแทป
def producttype(req):
    producttype = Product_Type.objects.get()
    return render(req, 'api/base1.html', {
        'producttype' :producttype
    })

##############################Admin#########################################################################

# ข้อมูลร้าน
def store(req):
    
    store = Store.objects.get() 
    users = Users.objects.get(username=req.user.username)
    return render(req, 'api/store.html', {
        'store': store,
        'users' : users
    })

# แก้ไขข้อมูลร้าน
def editstore(request,id):
    store = Store.objects.get(pk=id)
    users = Users.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = StoreForm(request.POST, request.FILES, instance=store)
        if form.is_valid():
            form.save()
            return redirect('/store')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = StoreForm(store)
    return render(request, 'api/editstore.html' ,{ 
        'form': form,
        'store': store,
        'users' : users
    }) 

# เพิ่มหมวดหมู่สินค้า
def addproductType(request):
    users = Users.objects.get(username=request.user.username)
    product_type = Product_Type.objects.all()
    if request.method == 'POST':
        form = Product_TypeForm(request.POST ,request.FILES)
        if form.is_valid():
            messages.info(request, "เพิ่มหมวดหมู่สินค้าสำเร็จ")
            form.save()
            return redirect('/addproductType')
    else:
        form = Product_TypeForm()
    return render(request, 'api/addproductType.html',
                  {
                      'form': form,
                    #   'product_types': Product_Type.objects.all(),
                    #   'product_statuss': Product_Status.objects.all(),
                      'users':users,
                      'product_type':product_type

                  }) 

def editproductType(request, id=0):
    product_type = Product_Type.objects.get(pk=id)
    users = Users.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = Product_TypeForm(request.POST, request.FILES, instance=product_type)
        if form.is_valid():
            form.save()
            return redirect('/addproductType')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = Product_Type(product_type)
       
    return render(request, 'api/editproductType.html' ,{ 
        'form': form,
        'product_type': product_type,
        'users':users
    })

@login_required(login_url='/login') 
def deleteproductType(req, id=0):
    product_types = Product_Type.objects.get(pk=id)
    product_types.delete()
    messages.success(req, "ลบหมวดหมู่สินค้าสำเร็จ")
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

@login_required(login_url='/login')    
def deleteproduct(req, id=0):
    product = Product.objects.get(pk=id)
    product.delete()
    messages.success(req, "ลบสินค้าสำเร็จ")
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

# เพิ่มสินค้า
def addproduct(request):
    if request.method == 'POST':
        form = ProductForm(request.POST ,request.FILES)
        if form.is_valid():
            messages.info(request, "เพิ่มสินค้าสำเร็จ")
            form.save()
            return redirect('/product')
    else:
        form = ProductForm()
    return render(request, 'api/addproduct.html',
                  {
                      'form': form,
                      'product_types': Product_Type.objects.all(),
                  }) 
# แก้ไขสินค้า
def editproduct(request, id=0):
    product = Product.objects.get(pk=id)
    product_types = Product_Type.objects.all()
    product_statuss = Product_Status.objects.all()
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('/product')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = ProductForm(product)
       
    return render(request, 'api/editproduct.html' ,{ 
        'form': form,
        'product': product,
        'product_types': product_types,
        'product_statuss': product_statuss,
    })

# ลบสินค้า


# แสดงสินค้า //
def product(request):
    products_list = Product.objects.all()
    paginator = Paginator(products_list,4) #1 หน้าแสดง 5รายการ
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)
    return render(request, 'api/product.html', {'products': products})


# หน้าคลังสินค้า
def stock(request):
    products = Product.objects.all()
    # comment = get_object_or_404(Comment, pk=comment_id)
    users = get_object_or_404(Users,username=request.user.username)
    return render(request, 'api/stock.html', {'products': products,
    'users':users
    })

def issue_item(request, pk):
    product = Product.objects.get(id = pk)
    form = SaleForm(request.POST)  
      
    if request.method == 'POST':     
        if form.is_valid():
            new_sale = form.save(commit=False)
            new_sale.product = product
            # # new_sale.unit_price = product.unit_price   
            # new_sale.save()
            #To keep track of the stock remaining after sales
            # product =Product()
            quantity =int(request.POST['quantity'])
            product.quantity -=  quantity
            if product.quantity >= 0:
                messages.success(request, "Issued success. " )
                product.save()
            else:
                messages.warning(request, "สินค้าในสต๊อกไม่พอ")
            # product.save()

            print(product.name) #ชื่อ
            print(request.POST['quantity']) #จำนวน
            # print(product.total_quantity)

            return redirect('/stock') 

    return render (request, 'api/issue_item.html',
     {
    'form': form,
    })

#เพิ่มจำนวนสินค้าในสต๊อก
def add_to_stock(request, pk):
    issued_item = Product.objects.get(id = pk)
    form = AddStockForm(request.POST)  #จำนวนสินค้าในสต๊อก
    if request.method == 'POST':
        if form.is_valid():
            added_quantity = int(request.POST['received_quantity'])
            issued_item.quantity += added_quantity
            issued_item.save()
            #To add to the remaining stock quantity is reducing
            print(added_quantity)
            print (issued_item.quantity)
            return redirect('/stock')
    return render (request, 'api/add_to_stock.html', {'form': form})

#ข้อมูลช่าง
def mechanic(request):
    mechanics = Mechanic.objects.all()
    users = Users.objects.get(username=request.user.username)
    # paginator = Paginator(mechanics_list, 100)
    # page = request.GET.get('page')
    # try:
    #     mechanics = paginator.page(page)
    # except PageNotAnInteger:
    #     mechanics = paginator.page(1)
    # except EmptyPage:
    #     mechanics = paginator.page(paginator.num_pages)
    return render(request, 'api/mechanic.html', {'mechanics': mechanics,'users':users})

def addmechanic(request):
    users = Users.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = MechanicForm(request.POST ,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/mechanic')
    else:
        form = MechanicForm()
    return render(request, 'api/addmechanic.html',
                  {
                      'form': form,
                      'mechanic_type': Mechanic_Type.objects.all(),
                    #   'product_statuss': Product_Status.objects.all(),
                      'users':users

                  }) 
def editmechanic(request, id=0):
    mechanic = Mechanic.objects.get(pk=id)
    mechanic_types = Mechanic_Type.objects.all()
    if request.method == 'POST':
        form = MechanicForm(request.POST, request.FILES, instance=mechanic)
        if form.is_valid():
            form.save()
            return redirect('/mechanic')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = MechanicForm(mechanic)
    return render(request, 'api/editmechanic.html' ,{ 
        'form': form,
        'mechanic': mechanic,
        'mechanic_types' : mechanic_types,
    })
@login_required(login_url='/login')    
def deletemechanic(req, id=0):
    mechanic = Mechanic.objects.get(pk=id)
    mechanic.delete()
    messages.success(req, "ลบข้อมูลช่างสำเร็จ")
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

def addmechanicType(request):
    users = Users.objects.get(username=request.user.username)
    mechanic_type = Mechanic_Type.objects.all()
    if request.method == 'POST':
        form = Mechanic_TypeForm(request.POST ,request.FILES)
        if form.is_valid():
            messages.info(request, "เพิ่มประเภทช่างสำเร็จ")
            form.save()
            return redirect('/addmechanicType')
    else:
        form = Mechanic_TypeForm()
    return render(request, 'api/addmechanicType.html',
                  {
                      'form': form,
                      
                      'users':users,
                      'mechanic_type':mechanic_type

                  }) 

def editmechanicType(request, id=0):
    mechanic_type = Mechanic_Type.objects.get(pk=id)
    users = Users.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = Mechanic_TypeForm(request.POST, request.FILES, instance=mechanic_type)
        if form.is_valid():
            form.save()
            return redirect('/addmechanicType')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = Mechanic_TypeForm(mechanic_type)
       
    return render(request, 'api/editmechanicType.html' ,{ 
        'form': form,
        'mechanic_type': mechanic_type,
        'users':users
    })

def deletemechanicType(req, id=0):
    mechanic_types = Mechanic_Type.objects.get(pk=id)
    mechanic_types.delete()
    messages.success(req, "ลบประเภทช่างสำเร็จ")
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

# หน้ารายการสั่งซื้อทั้งหมด
def orderAll(req):
    orders = Order.objects.all().order_by('-id')
    litem = LineItem.objects.all()
    users = Users.objects.get(username=req.user.username)
    return render(req, 'api/orderAll.html',{
        'orders':orders,
        'users':users,
        'litem':litem,
        'money_status': Money_Status.objects.all()
    })

def editOrder(request, id=0):
    order = Order.objects.get(pk=id)
    money_statuss = Money_Status.objects.all()
    if request.method == 'POST':
        form = EditOrderForm(request.POST, request.FILES, instance=order)
        if form.is_valid():
            form.save()
            return redirect('/orderAll')
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = EditOrderForm(order)
    return render(request, 'api/editOrder.html' ,{ 
        'form': form,
        'order': order,
        'money_statuss' : money_statuss,
    })

# หน้ารายการสินค้า
def orderproductAll(req,id):
    litem = LineItem.objects.filter(order=id)
    return render(req, 'api/orderproductAll.html',{
        'litem':litem
    })



class Mechanic_TypeViewSet(viewsets.ModelViewSet):
    queryset = Mechanic_Type.objects.all()
    serializer_class = Mechanic_TypeSerializer

class MechanicViewSet(viewsets.ModelViewSet):
    queryset = Mechanic.objects.all()
    serializer_class = MechanicSerializer

class StoreViewSet(viewsets.ModelViewSet):
    queryset = Store.objects.all()
    serializer_class = StoreSerializer

class Product_TypeViewSet(viewsets.ModelViewSet):
    queryset = Product_Type.objects.all()
    serializer_class = Product_TypeSerializer

class Product_StatusViewSet(viewsets.ModelViewSet):
    queryset = Product_Status.objects.all()
    serializer_class = Product_StatusSerializer

class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

class Money_StatusViewSet(viewsets.ModelViewSet):
    queryset = Money_Status.objects.all()
    serializer_class = Money_StatusSerializer

class Delivery_OptionsViewSet(viewsets.ModelViewSet):
    queryset = Delivery_Options.objects.all()
    serializer_class = Delivery_OptionsSerializer

class Payment_OptionsViewSet(viewsets.ModelViewSet):
    queryset = Payment_Options.objects.all()
    serializer_class = Payment_OptionsSerializer

class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer



router = routers.DefaultRouter()

router.register(r'Mechanic_Type', Mechanic_TypeViewSet)
router.register(r'Mechanic', MechanicViewSet)
router.register(r'Store', StoreViewSet)
router.register(r'Product_Type', Product_TypeViewSet)
router.register(r'Product_Status', Product_StatusViewSet)
router.register(r'Product', ProductViewSet)
router.register(r'Money_Status', Money_StatusViewSet)
router.register(r'Delivery_Options', Delivery_OptionsViewSet)
router.register(r'Payment_Options', Payment_OptionsViewSet)
router.register(r'Order', OrderViewSet)



