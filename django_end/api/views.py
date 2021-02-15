from api.forms import *
from django.http import HttpResponse
# from django.utils import translation
from .models import *
from .serializers import *
from django.core.checks import messages
from django.http import request
from django.http.response import HttpResponseRedirect
from django.shortcuts import redirect, render
from django.core.exceptions import ValidationError
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView
# Create your views here.

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth import authenticate
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.hashers import make_password


def profileAdmin(req):
    adminn = Adminn.objects.get(username=req.user.username)
    product_type=Product_Type.objects.all()
    return render(req, 'api/profileAdmin.html', {
        'adminn': adminn,
        'product_type':product_type
       
    })

def cart(req):
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(req, 'api/cart.html', {
        # 'adminn': adminn,
      
    })
def profile(req):
    adminn = Adminn.objects.get(username=req.user.username)
    return render(req, 'api/profile.html', {
        'adminn': adminn,
       
    })

def logout(req):
    # if req.adminn.is_/authenticated:
    auth_logout(req)
    return redirect('/')
# def login(req):
#     return render(req, 'api/login.html')
 
# def register(req):
#     return render(req, 'api/register.html') 


def login(req):
    if req.method == 'POST':
        print(req.POST)
        adminn = authenticate(username=req.POST['username'], password=req.POST['password'])
        print(adminn)
        if adminn is not None:
            print(adminn)
            auth_login(req, adminn)
            return redirect('/')
    else:
        print('เขายังไม่ได้กรอก login/password (ครั้งแรกที่เข้าหน้านี้)')
    return render(req, 'api/login.html')

def register(req):
    print('register()')
    form = AdminnForm()
    print(req)

    if req.method == 'POST':
        form = AdminnForm(req.POST, req.FILES)
        print("req.POST")
        print(req.POST)
        if form.is_valid():
            print('form valid')
            form.instance.password = make_password(req.POST['password'])
            form.save()
        else:
            print("==== form.errors ====")
            print(form.errors)
    # admin = form.instance 
    # dob = f'{member.dob.month:02}/{member.dob.day:02}/{member.dob.year}' #str(member.dob).replace("/","-")
    return render(req, 'api/register.html', { 
        'form': form,
       
        })



  


def productUser(req,id=0):
    # orderproducts = Order_Product.objects.filter(pk=id)
    product=Product.objects.get(pk=id)
    product_type=Product_Type.objects.all()
    # adminn = Adminn.objects.get(username=req.user.username)
    # mechanic= Mechanic.objects.get(pk=id)
    return render(req, 'api/productUser.html',{
        'product' :product,
        'product_type':product_type,
        # 'adminn' : adminn

    })

# def productTypeUser(request,id=0):
# 	product_type=Product_Type.objects.get(pk=id)
#     # adminn = Adminn.objects.get(username=request.user.username)
# 	product=Product.objects.filter(product_type=product_type).order_by('id')
#     # adminn = Adminn.objects.get(username=request.user.username)
# 	return render(request,'api/productTypeUser.html',{
            
# 			'product':product,
#             'product_type' :product,
#             # 'adminn' : adminn

# 			})

def productTypeUser(request,id=0):
    product_type=Product_Type.objects.get(pk=id)
    # product_type=Product_Type.objects.all()
    # adminn = Adminn.objects.get(username=request.user.username)
    product=Product.objects.filter(product_type=product_type).order_by('id')
    # mechanic= Mechanic.objects.all()
    return render(request,'api/productTypeUser.html',{
        'product':product,
        'product_type' :product,
        # 'adminn' :adminn
        })

def product_type(request):
    product_type=Product_Type.objects.all().order_by('id')
    # adminn = Adminn.objects.get(username=request.user.username)
    # mechanic= Mechanic.objects.all()
    return render(request,'api/product_type.html',{
        'product_type':product_type,
        # 'adminn' :adminn
        })
def test(req):
    return render(req, 'api/test.html')
def index(req):
    # adminn = Adminn.objects.get(username=req.user.username)
    product_type=Product_Type.objects.all()
    return render(req, 'api/index.html',{
        #  'adminn': adminn(req),
         'product_type' :product_type
    })
def home2(req):
    return render(req, 'api/home2.html')
def mechanicUser(req):
    mechanic= Mechanic.objects.all()
    product_type=Product_Type.objects.all()
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(req, 'api/mechanicUser.html',{
        'mechanic' :mechanic ,
        'product_type':product_type,
        # 'adminn': adminn

    })

def mechanicDetailUser(req,id=0):
    # orderproducts = Order_Product.objects.filter(pk=id)
    product_type=Product_Type.objects.all()
    mechanic= Mechanic.objects.get(pk=id)
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(req, 'api/mechanicDetailUser.html',{
        'mechanic' :mechanic,
        'product_type':product_type,
        # 'adminn' :adminn

    })
def base2(req):
    return render(req, 'api/base2.html')
def register1(req):
    return render(req, 'api/register1.html')
def home(req):
    product = Product.objects.all()
    return render(req, 'api/home.html', {
        'product' :product
    })

def storeUser(req):
    store = Store.objects.get()
    return render(req, 'api/storeUser.html', {
        'store' :store
    })
def producttype(req):
    producttype = Product_Type.objects.get()
    return render(req, 'api/base1.html', {
        'producttype' :producttype
    })
# def store(req):
#     store = Store.objects.get() 
#     return render(req, 'api/store.html', {
#         'store': store,
#     })
# def index0(req):
#     mechanics = Mechanic.objects.get()
#     return render(req, 'api/index0.html',{
#         'mechanics' :mechanics
#     })
# def mechanic(request):
#     mechanics = Mechanic.objects.all()
#     # paginator = Paginator(mechanics_list, 100)
#     # page = request.GET.get('page')
#     # try:
#     #     mechanics = paginator.page(page)
#     # except PageNotAnInteger:
#     #     mechanics = paginator.page(1)
#     # except EmptyPage:
#     #     mechanics = paginator.page(paginator.num_pages)
#     return render(request, 'api/mechanic.html', {'mechanics': mechanics})

# def index0(req, id=-1):
#     type = Product_Type.objects.get(pk=id)
#     products= Product.objects.all()
#     result = [] 
#     for product in products:
#         if product.typee == type:
#             result
#             result.append(product)
#     return render(req, 'api/user/index0.html',{
#         'products' :result,

#     }
#     )
# def clothe_cat(req, cid=-1):
#     # print(f'cid = {cid}')
#     cat = Category.objects.get(pk=cid)
#     cloths = Cloth.objects.all()
#     result = [] 
#     for cloth in cloths:
#         if cloth.category == cat:
#             result.append(cloth)
#     return render(req, 'lookinggreat/clothe.html', { 
#         'cloths': result,
#         'has_store': has_store(req),
#     })

def tables(req):
    return render(req, 'api/tables.html')

# def login(req):
#     return render(req, 'api/login.html')


# def register(req):
#     return render(req, 'api/register.html')
# เพิ่มสินค้า
def addproduct(request):
    adminn = Adminn.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = ProductForm(request.POST ,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/product')
    else:
        form = ProductForm()
    return render(request, 'api/addproduct.html',
                  {
                      'form': form,
                      'product_types': Product_Type.objects.all(),
                      'product_statuss': Product_Status.objects.all(),
                      'adminn':adminn

                  }) 
# แก้ไขสินค้า
def editproduct(request, id=0):
    product = Product.objects.get(pk=id)
    product_types = Product_Type.objects.all()
    product_statuss = Product_Status.objects.all()
    adminn = Adminn.objects.get(username=request.user.username)
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            
            form.save()
            # messages.success(request, 'Member was created successfully!')
            # return redirect('/editproduct/{<int:id>/')
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
        'adminn':adminn
    })

# ลบสินค้า
def deleteproduct(req, id=0):
    product = Product.objects.get(pk=id)
    # product_types = Product_Type.objects.all()
    # product_statuss = Product_Status.objects.all()
    product.delete()
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))



# แสดงสินค้า //
 
def productpage(request):
    # list all users.
    products = Product.objects.all()
    page_number = request.GET.get('page', 1)
    paginate_result = do_paginate(products, page_number)
    product = paginate_result[0]
    paginator = paginate_result[1]
    base_url = '/api/product/?'
    adminn = Adminn.objects.get(username=request.user.username)
    return render(request, 'api/product.html',
                      {'products': products, 'paginator' : paginator, 'base_url': base_url ,'adminn':adminn})
#ค้นหาสินค้า
def product(request):
    product_name = request.POST.get('product_name', '').strip()
    if len(product_name) == 0:
        product_name = request.GET.get('product_name', '').strip()
    product = Product.objects.filter(product_name__contains=product_name)
    page_number = request.GET.get('page', 1)
    paginate_result = do_paginate(product, page_number)
    product = paginate_result[0]
    paginator = paginate_result[1]
    base_url = '/api/user_search/?product_name=' + product_name + "&"
    adminn = Adminn.objects.get(username=request.user.username)
    return render(request, 'api/product.html',
                      {'product': product, 'paginator' : paginator, 'base_url': base_url, 'search_product_name': product_name,'adminn':adminn})

def do_paginate(data_list, page_number):
    ret_data_list = data_list
    #  หน้า มี 5รายการ
    result_per_page = 5
    # build the paginator object.
    paginator = Paginator(data_list, result_per_page)
    try:
        # get data list for the specified page_number.
        ret_data_list = paginator.page(page_number)
    except EmptyPage:
        # get the lat page data if the page_number is bigger than last page number.
        ret_data_list = paginator.page(paginator.num_pages)
    except PageNotAnInteger:
        # if the page_number is not an integer then return the first page data.
        ret_data_list = paginator.page(1)
    return [ret_data_list, paginator]
 
# def product(request):
#     products_list = Product.objects.all()
#     paginator = Paginator(products_list,5) #1 หน้าแสดง 5รายการ
#     page = request.GET.get('page')
#     try:
#         products = paginator.page(page)
#     except PageNotAnInteger:
#         products = paginator.page(1)
#     except EmptyPage:
#         products = paginator.page(paginator.num_pages)
#     return render(request, 'api/product.html', {'products': products})

# ข้อมูลร้าน
def store(req):
    store = Store.objects.all() 
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(req, 'api/store.html', {
        'store': store,
        # 'adminn' : adminn
    })
# แก้ไขข้อมูลร้าน
def editstore(request, id=0):
    store = Store.objects.get(pk=id)
    if request.method == 'POST':
        form = StoreForm(request.POST, request.FILES, instance=store)
        if form.is_valid():
            form.save()
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = StoreForm(store)
    return render(request, 'api/editstore.html' ,{ 
        'form': form,
        'store': store,
    })
#ข้อมูลช่าง
def mechanic(request):
    mechanics = Mechanic.objects.all()
    adminn = Adminn.objects.get(username=request.user.username)
    # paginator = Paginator(mechanics_list, 100)
    # page = request.GET.get('page')
    # try:
    #     mechanics = paginator.page(page)
    # except PageNotAnInteger:
    #     mechanics = paginator.page(1)
    # except EmptyPage:
    #     mechanics = paginator.page(paginator.num_pages)
    return render(request, 'api/mechanic.html', {'mechanics': mechanics,'adminn':adminn})

def editmechanic(request, id=0):
    mechanic = Mechanic.objects.get(pk=id)
    mechanic_types = Mechanic_Type.objects.all()
    if request.method == 'POST':
        form = MechanicForm(request.POST, request.FILES, instance=mechanic)
        if form.is_valid():
            form.save()
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


def order(request):
    orders = Order.objects.all()
    adminn = Adminn.objects.get(username=request.user.username)
    # sortid= Order.objects.order_by('id') 
    
    # context= {'sortedprice': sortid}
   
    # paginator = Paginator(orders_list, 100)
    # page = request.GET.get('page')
    # try:
    #     orders = paginator.page(page)
    # except PageNotAnInteger:
    #     orders = paginator.page(1)
    # except EmptyPage:
    #     orders = paginator.page(paginator.num_pages)
    return render(request, 'api/order.html', {'orders': orders,'adminn':adminn})

# def editmechanic(request, id=0):
#     mechanic = Mechanic.objects.get(pk=id)
#     mechanic_types = Mechanic_Type.objects.all()
#     if request.method == 'POST':
#         form = MechanicForm(request.POST, request.FILES, instance=mechanic)
#         if form.is_valid():
#             form.save()
#         else:
#             print("==== form.errors ====")
#             print(form.errors)
#     else:
#         form = MechanicForm(mechanic)
#     return render(request, 'api/editmechanic.html' ,{ 
#         'form': form,
#         'mechanic': mechanic,
#         'mechanic_types' : mechanic_types,
#     })


def orderproduct(request,id=0):
    # orders = Order.objects.all(pk=id)
    orderproducts = Order_Product.objects.filter(pk=id)
    adminn = Adminn.objects.get(username=request.user.username)

    return render(request, 'api/orderproduct.html', {'orderproducts': orderproducts,'adminn':adminn})
 

# def orderproduct(request, id=0):
#     orders = Order.objects.all(pk=id)
#     orderproducts = Order_Product.objects.all()
#     products = Product.objects.all()
#     if request.method == 'POST':
#         form = Order_ProductForm(request.POST, request.FILES, instance=orderproducts)
#         if form.is_valid():
#             form.save()
#         else:
#             print("==== form.errors ====")
#             print(form.errors)
#     else:
#         form = Order_ProductForm(orderproducts)
#     return render(request, 'api/orderproduct.html' ,{ 
#         'form': form,
#         'orderproducts': orderproducts,
#         'orders' : orders,
#         'products' :products,
#     })


def payment(request):
    adminn = Adminn.objects.get(username=request.user.username)
    payments = Payment.objects.all()
    # sortid= Order.objects.payment_by('id') 
    
    # context= {'sortedprice': sortid}
   
    # paginator = Paginator(payments_list, 100)
    # page = request.GET.get('page')
    # try:
    #     payments = paginator.page(page)
    # except PageNotAnInteger:
    #     payments = paginator.page(1)
    # except EmptyPage:
    #     payments = paginator.page(paginator.num_pages)
    return render(request, 'api/payment.html', {'payments': payments,'adminn':Adminn})

def storck(request):
    storcks = Storck.objects.all()
    adminn = Adminn.objects.get(username=request.user.username)
    # paginator = Paginator(mechanics_list, 100)
    # page = request.GET.get('page')
    # try:
    #     mechanics = paginator.page(page)
    # except PageNotAnInteger:
    #     mechanics = paginator.page(1)
    # except EmptyPage:
    #     mechanics = paginator.page(paginator.num_pages)
    return render(request, 'api/storck.html', {'storcks': storcks,'adminn':adminn})


def orderUser(req):
   

    return render(req, 'api/orderUser.html')

class RoleViewSet(viewsets.ModelViewSet):
    queryset = Role.objects.all()
    serializer_class = RoleSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class CustomerViewSet(viewsets.ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer

class AdminViewSet(viewsets.ModelViewSet):
    queryset = Admin.objects.all()
    serializer_class = AdminSerializer

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

class PaymentViewSet(viewsets.ModelViewSet):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer

class Order_ProductViewSet(viewsets.ModelViewSet):
    queryset = Order_Product.objects.all()
    serializer_class = Order_ProductSerializer

class CartsViewSet(viewsets.ModelViewSet):
    queryset = Carts.objects.all()
    serializer_class = CartsSerializer

class ConversationsViewSet(viewsets.ModelViewSet):
    queryset = Conversations.objects.all()
    serializer_class = ConversationsSerializer

class StorckViewSet(viewsets.ModelViewSet):
    queryset = Storck.objects.all()
    serializer_class = StorckSerializer


# # Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r'role', RoleViewSet)
router.register(r'user', UserViewSet)
router.register(r'Customer', CustomerViewSet)
router.register(r'Admin', AdminViewSet)
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
router.register(r'Payment', PaymentViewSet)
router.register(r'Order_Product', Order_ProductViewSet)
router.register(r'Carts', CartsViewSet)
router.register(r'Conversations', ConversationsViewSet)
router.register(r'Storck', StorckViewSet)


# Create your views here.
