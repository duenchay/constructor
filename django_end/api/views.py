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
def index(req):
    return render(req, 'api/index.html')

def tables(req):
    return render(req, 'api/tables.html')

def login(req):
    return render(req, 'api/login.html')


def register(req):
    return render(req, 'api/register.html')
# เพิ่มสินค้า
def addproduct(request):
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
    })

# ลบสินค้า
def deleteproduct(req, id=0):
    product = Product.objects.get(pk=id)
    # product_types = Product_Type.objects.all()
    # product_statuss = Product_Status.objects.all()
    product.delete()
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))



# แสดงสินค้า

def productpage(request):
    # list all users.
    product = Product.objects.all()
    page_number = request.GET.get('page', 1)
    paginate_result = do_paginate(product, page_number)
    product = paginate_result[0]
    paginator = paginate_result[1]
    base_url = '/api/product/?'
    return render(request, 'api/product.html',
                      {'product': product, 'paginator' : paginator, 'base_url': base_url})
# @login_required()
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
    return render(request, 'api/product.html',
                      {'product': product, 'paginator' : paginator, 'base_url': base_url, 'search_product_name': product_name})
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
    store = Store.objects.get() 
    return render(req, 'api/store.html', {
        'store': store,
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

def mechanic(request):
    mechanics = Mechanic.objects.all()
    # paginator = Paginator(mechanics_list, 100)
    # page = request.GET.get('page')
    # try:
    #     mechanics = paginator.page(page)
    # except PageNotAnInteger:
    #     mechanics = paginator.page(1)
    # except EmptyPage:
    #     mechanics = paginator.page(paginator.num_pages)
    return render(request, 'api/mechanic.html', {'mechanics': mechanics})



def searchproduct(req):
    products = Product.objects.all()
    if req.method == 'POST': 
        search = req.POST['search']
        print(f'เขาต้องการค้นหาคำว่า "{search}"')
        result = [] 
        for product in products:
            if search in product.product_name:
                result.append(product)
        return render(req, 'api/product.html', { 'products': result })

    return render(req, 'api/product.html', {
        'products': products,
        # 'has_store': has_store(req),
    })


def storck(request):
    storcks = Storck.objects.all()
    # paginator = Paginator(mechanics_list, 100)
    # page = request.GET.get('page')
    # try:
    #     mechanics = paginator.page(page)
    # except PageNotAnInteger:
    #     mechanics = paginator.page(1)
    # except EmptyPage:
    #     mechanics = paginator.page(paginator.num_pages)
    return render(request, 'api/storck.html', {'storcks': storcks})


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
