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

# from django.contrib.auth.decorators import login_required


# หน้าแรก
def index(request):
    product_type=Product_Type.objects.all()
    item_count = cart.item_count(request)
    return render(request, 'api/index.html',{
         'product_type' :product_type,
         'cart_item_count':item_count
    })

#แสดงสินค้าทั้งหมด
def showProductAll(request):
    product_type=Product_Type.objects.all() # แสดงประเภทช่างบน tap
    product=Product.objects.all()
    item_count = cart.item_count(request)
    return render(request,'api/showProductAll.html',{
        'product_type':product_type,
		'product':product,
        'cart_item_count':item_count
})

#ประวัติการซื้อ
def order(request):
    litem = LineItem.objects.all()
    orders = Order.objects.filter(user =request.user)
    # orders = Order.objects.all()s
    item_count = cart.item_count(request)
    product_type=Product_Type.objects.all()

    return render(request, 'api/order.html',{
        'orders':orders,
        'litem':litem,
        'cart_item_count':item_count,
        'product_type':product_type
    })

# หน้ารายการสินค้า
def orderproduct(request,id):
    litem = LineItem.objects.filter(order=id)
    orders = Order.objects.filter()
    item_count = cart.item_count(request)
    product_type=Product_Type.objects.all()
    # print(litem)
    print(id)
    print(orders)
    # users = Users.objects.get(username=request.user.username)
    return render(request, 'api/orderproduct.html',{
        'orders':orders,
        'litem':litem,
        'cart_item_count':item_count,
        'product_type':product_type
        # 'users':users
    })

# หน้าสินค้าแต่ละหมวดหมู่
def productTypeUser(request,id=0): 
    type=Product_Type.objects.get(pk=id)
    product_type=Product_Type.objects.all()
    # adminn = Adminn.objects.get(username=request.user.username)
    product=Product.objects.filter(product_type=type).order_by('id')
    item_count = cart.item_count(request)
    # mechanic= Mechanic.objects.all()
    return render(request,'api/productTypeUser.html',{
        'product':product,
        # 'product_type' :product,
        'product_type':product_type,
        'cart_item_count':item_count
        # 'adminn' :adminn
        })

    # รายละเอียดสินค้า 
def productDetail(request,product_id):
    if request.user.is_anonymous:
        return redirect('/login')
    else: 
        users= Users.objects.get(username=request.user.username)
   
    # except: pass
   
    product = get_object_or_404(Product, id=product_id)
    item_count = cart.item_count(request) #ตัวเลขบนตะกร้าสินค้า
    product_type=Product_Type.objects.all()

    if request.method == 'POST':
        form = CartForm(request, request.POST)
        if form.is_valid():
            request.form_data = form.cleaned_data
            cart.add_item_to_cart(request)   #เพิ่มสินค้าเข้าตะกร้า
            return redirect('show_cart')

    form = CartForm(request, initial={'product_id': product.id})
    return render(request, 'api/productDetail.html', {
                                            'product': product,
                                            'form': form,
                                            'cart_item_count': item_count,
                                            'product_type':product_type,
                                            'users':users
                                         
                                            })


def home(request):
    all_products = Product.objects.all()
    return render(request, "api/home.html", {
                                    'all_products': all_products,
                                 })
#สินค้าในตะกร้า
def show_cart(request):
    # if request.user.is_anonymous:
    #     return redirect('/login')
    # else: 
    #     users= Users.objects.get(username=request.user.username)

    item_count = cart.item_count(request)  #จำนวนสินค้า
    product_type=Product_Type.objects.all() #หมวดหมู่สินค้า

    if request.method == 'POST':
        if request.POST.get('submit') == 'Update': #เพิ่ม
            cart.update_item(request)
        if request.POST.get('submit') == 'Remove': # ลบ
            cart.remove_item(request)
        # form.instance.store = store
        # form.save()

    cart_items = cart.get_all_cart_items(request)
    cart_subtotal = cart.subtotal(request)
    return render(request, 'api/cart.html', {
                                            'cart_items': cart_items,
                                            'cart_subtotal': cart_subtotal,
                                            'cart_item_count': item_count,
                                            # 'users':users,
                                            'product_type':product_type
                                            })

def checkout(request):
    print(request.user)
    product_type=Product_Type.objects.all()
    item_count = cart.item_count(request)
    if request.method == 'POST':
        print(request.POST)
        form = CheckoutForm(request.POST)
        if form.is_valid():
            order = Order() 
            order.user = request.user
            # order.lat =request.POST['lat'] 
            # order.lng =request.POST['lng']
            order.address = request.POST['address']
            # work.rice_type = Rice_type.objects.get(pk=req.POST['rice_type'])
            order.money_status =Money_Status.objects.get(pk=request.POST['money_status'])
            order.delivery_options =Delivery_Options.objects.get(pk=request.POST['delivery_options'])
            order.payment_options =Payment_Options.objects.get(pk=request.POST['payment_options'])
            # order.user = request.user
            # cleaned_data = form.cleaned_data
            # all_items = cart.get_all_cart_items(request)
            # for cart_item in all_items:
            # o = Order(
            #     # name = cleaned_data.get('name'),
            #     # user = cleaned_data.get('user'),
            #     lat = cleaned_data.get('lat'),
            #     lng = cleaned_data.get('lng'),
            #     money_status = cleaned_data.get('money_status'),
            #     delivery_options = cleaned_data.get('delivery_options'),
            #     payment_options = cleaned_data.get('payment_options'),
            #     # user = cart_item.user
            #     user = request.user
                
            # )
            # print("_________order_________",o)
            order.save()
            # print(order.user)
            all_items = cart.get_all_cart_items(request)
            for cart_item in all_items:
                li = LineItem(          #รายการสินค้า
                    product_id = cart_item.product_id,
                    price = cart_item.price,
                    quantity = cart_item.quantity,
                    order_id = order.id,
                    user = cart_item.user
                )
                # print("____________LI____________",type(li))
                li.save()

            cart.clear(request)
            
            request.session['order_id'] = order.id
            # messages.info(request, "This item was not in your cart")
          
           # messages.info(request, messages.INFO, 'Order Placed!')
            return redirect('/order')
    else:
        form = CheckoutForm()
    return render(request, 'api/checkout.html', {
    'form': form,
    # 'users':Users.objects.all(),
    'product_type':product_type,
    'cart_item_count':item_count,
    'money_status': Money_Status.objects.all(),
    'delivery_options': Delivery_Options.objects.all(),
    'payment_options': Payment_Options.objects.all(),
    
    })
    




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
    item_count = cart.item_count(request)
    q=request.GET['q']
    data=Product.objects.filter(name__icontains=q).order_by('id')
    return render(request,'api/search.html',{
    'data':data,
    'cart_item_count':item_count
    })



#หน้าโปรไฟล์
def profile(request):
    
    users = Users.objects.get(username=request.user.username)
    product_type=Product_Type.objects.all()
    item_count = cart.item_count(request)
    return render(request, 'api/profile.html', {
        'users': users,
        'product_type':product_type,
        'cart_item_count': item_count
    })


def editprofile(request, id=0):
    users = Users.objects.get(username=request.user.username)
    product_type=Product_Type.objects.all()
    item_count = cart.item_count(request)
    if request.method == 'POST':
        form = UsersForm(request.POST, request.FILES, instance=users)
        if form.is_valid():
            form.save()
        else:
            print("==== form.errors ====")
            print(form.errors)
    else:
        form = UsersForm(users)  
    return render(request, 'api/editprofile.html' ,{ 
        'form': form,
        'users':users,
        'product_type':product_type,
        'cart_item_count':item_count
    })



def logout(req):
    # if req.adminn.is_/authenticated:
    auth_logout(req)
    return redirect('/')

def login(req):
    if req.method == 'POST':
        print(req.POST)
        users = authenticate(username=req.POST['username'], password=req.POST['password'])
        print(users)
        if users is not None:
            print(users)
            auth_login(req, users)
            return redirect('/')
    else:
        print('ยังไม่ได้กรอก login/password')
    return render(req, 'api/login.html')

def register(req):
    print('register()')
    form = UsersForm()
    print(req)
    if req.method == 'POST':
        form = UsersForm(req.POST, req.FILES)
        print("req.POST")
        print(req.POST)
        if form.is_valid():
            print('form valid')
            form.instance.password = make_password(req.POST['password'])
            form.save()
            return redirect('/login')
        else: 

            
            print("==== form.errors ====")
            print(form.errors)
    return render(req, 'api/register.html', { 
        'form': form,
       
        })

# def show_product(request, slug,product_id, ):
#     product = get_object_or_404(Product, id=product_id)

#     if request.method == 'POST':
#         form = CartForm(request, request.POST)
#         if form.is_valid():
#             request.form_data = form.cleaned_data
#             cart.add_item_to_cart(request)
#             return redirect('show_cart')

#     form = CartForm(request, initial={'product_id': product.id})
#     return render(request, 'api/product_detail.html', {
#                                             'product': product,
#                                             'form': form,
#                                             })

# # รายละเอียดสินค้า
# def productUser(request,slug,product_id):
#     product = get_object_or_404(Product, id=product_id)

#     if request.method == 'POST':
#         form = CartForm(request, request.POST)
#         if form.is_valid():
#             request.form_data = form.cleaned_data
#             cart.add_item_to_cart(request)
#             return redirect('show_cart')

#     form = CartForm(request, initial={'product_id': product.id})
#     return render(request, 'api/productUser.html', {
#                                             'product': product,
#                                             'form': form,
#                                             })

# หน้าาเทสสสสสสสสสสสสหมวดหมู่
def product_type(request):
    product_type=Product_Type.objects.all().order_by('id')
    # adminn = Adminn.objects.get(username=request.user.username)
    # mechanic= Mechanic.objects.all()
    return render(request,'api/product_type.html',{
        'product_type':product_type,
        # 'adminn' :adminn
        })


# def editprofile(request, id=0):
#     users = Users.objects.get(username=request.user.username)
#     if request.method == 'POST':
#         form = UsersForm(request.POST, request.FILES, instance=users)
#         if form.is_valid():
#             form.save()
#         else:
#             print("==== form.errors ====")
#             print(form.errors)
#     else:
#         form = UsersForm(users)  
#     return render(request, 'api/editprofile.html' ,{ 
#         'form': form,
#         'users':users
#     })





# หน้ารวมช่าง
def mechanicUser(request):
    mechanic= Mechanic.objects.all()
    product_type=Product_Type.objects.all()
    item_count = cart.item_count(request)
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(request, 'api/mechanicUser.html',{
        'mechanic' :mechanic ,
        'product_type':product_type,
        'cart_item_count':item_count,
        # 'adminn': adminn
    })

# หน้ารายละเอียดช่าง
def mechanicDetailUser(request,id=0):
    product_type=Product_Type.objects.all()
    mechanic= Mechanic.objects.get(pk=id)
    item_count = cart.item_count(request)
    # adminn = Adminn.objects.get(username=req.user.username)
    return render(request, 'api/mechanicDetailUser.html',{
        'mechanic' :mechanic,
        'product_type':product_type,
        'cart_item_count':item_count
        # 'adminn' :adminn
    })

def base2(req):
    return render(req, 'api/base2.html')

def register1(req):
    return render(req, 'api/register1.html')

# หน้าข้อมูลร้าน
def storeUser(request):
    product_type=Product_Type.objects.all()
    item_count = cart.item_count(request)
    store = Store.objects.get()
    return render(request, 'api/storeUser.html', {
        'store' :store,
        'product_type' :product_type,
        'cart_item_count': item_count
    })
# หมวดหมู่สินค้าบนแทป
def producttype(req):
    producttype = Product_Type.objects.get()
    return render(req, 'api/base1.html', {
        'producttype' :producttype
    })


 
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

# เพิ่มสินค้า
def addproductType(request):
    users = Users.objects.get(username=request.user.username)
    producttype = Product_Type.objects.all()
    if request.method == 'POST':
        form = Product_TypeForm(request.POST ,request.FILES)
        if form.is_valid():
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
                      'producttype':producttype

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

def deleteproduct(req, id=0):
    product = Product.objects.get(pk=id)
    # product_types = Product_Type.objects.all()
    # product_statuss = Product_Status.objects.all()
    product.delete()
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

# เพิ่มสินค้า
def addproduct(request):
    users = Users.objects.get(username=request.user.username)
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
                      'users':users

                  }) 
# แก้ไขสินค้า
def editproduct(request, id=0):
    product = Product.objects.get(pk=id)
    product_types = Product_Type.objects.all()
    product_statuss = Product_Status.objects.all()
    users = Users.objects.get(username=request.user.username)
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
        'users':users
    })

# ลบสินค้า
def deleteproductType(req, id=0):
    product_types = Product_Type.objects.get(pk=id)
    # product_types = Product_Type.objects.all()
    # product_statuss = Product_Status.objects.all()
    product_types.delete()
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
    users = Users.objects.get(username=request.user.username)
    return render(request, 'api/product.html',
                      {'products': products, 'paginator' : paginator, 'base_url': base_url ,'users':users})
#ค้นหาสินค้า
def product(request):
    name = request.POST.get('name', '').strip()
    if len(name) == 0:
        name = request.GET.get('name', '').strip()
    product = Product.objects.filter(name__contains=name)
    page_number = request.GET.get('page', 1)
    paginate_result = do_paginate(product, page_number)
    product = paginate_result[0]
    paginator = paginate_result[1]
    base_url = '/api/user_search/?name=' + name + "&"
    users = Users.objects.get(username=request.user.username)
    return render(request, 'api/product.html',
                      {'product': product, 'paginator' : paginator, 'base_url': base_url, 'search_name': name,'users':users})

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

# หน้าคลังสินค้า

# หน้าคลังสินค้า
def stock(request):
    products = Product.objects.all()
    users = Users.objects.get(username=request.user.username)
    return render(request, 'api/stock.html', {'products': products,
    'users':users
    })

def issue_item(request, pk):
    product = Product.objects.get(id = pk)
    sales_form = SaleForm(request.POST)  
      
    if request.method == 'POST':     
        if sales_form.is_valid():
            new_sale = sales_form.save(commit=False)
            new_sale.item = product
            # new_sale.unit_price = product.unit_price   
            new_sale.save()
            #To keep track of the stock remaining after sales
            issued_quantity = int(request.POST['quantity'])
            product.quantity -= issued_quantity
            product.save()

            print(product.name) #ชื่อ
            print(request.POST['quantity']) #จำนวน
            # print(product.total_quantity)

            return redirect('/stock') 

    return render (request, 'api/issue_item.html',
     {
    'sales_form': sales_form,
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

def deletemechanic(req, id=0):
    mechanic = Mechanic.objects.get(pk=id)
    # product_types = Product_Type.objects.all()
    # product_statuss = Product_Status.objects.all()
    mechanic.delete()
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

def addmechanicType(request):
    users = Users.objects.get(username=request.user.username)
    mechanic_type = Mechanic_Type.objects.all()
    if request.method == 'POST':
        form = Mechanic_TypeForm(request.POST ,request.FILES)
        if form.is_valid():
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
    # product_types = Product_Type.objects.all()
    # product_statuss = Product_Status.objects.all()
    mechanic_types.delete()
    return HttpResponseRedirect(req.META.get('HTTP_REFERER'))

# หน้ารายการสั่งซื้อทั้งหมด
def orderAll(req):
    orders = Order.objects.all().order_by('-id')
    litem = LineItem.objects.filter()
    users = Users.objects.get(username=req.user.username)
    return render(req, 'api/orderAll.html',{
        'orders':orders,
        'users':users,
        'litem':litem
    })


# หน้ารายการสินค้า
def orderproductAll(req,id):
    litem = LineItem.objects.filter(order=id)
    orders = Order.objects.filter(address = req.user)
    
    # print(litem)
    print(id)
    print(orders)
    # users = Users.objects.get(username=request.user.username)
    return render(req, 'api/orderproductAll.html',{
        'orders':orders,
        'litem':litem
        # 'users':users
    })


def payment(request):
    users = Users.objects.get(username=request.user.username)
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
    return render(request, 'api/payment.html', {'payments': payments,'users':users})



