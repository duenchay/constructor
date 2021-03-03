from django import forms
from .models import *
  

class CartForm(forms.Form):
    quantity = forms.IntegerField(initial='1')
    product_id = forms.IntegerField(widget=forms.HiddenInput)

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(CartForm, self).__init__(*args, **kwargs)


class CheckoutForm(forms.ModelForm):
    class Meta:
        model = Order
        exclude = ('paid',)
        fields = [  'address', 'money_status', 'delivery_options','payment_options']

        # widgets = {
        #     'address': forms.Textarea(attrs={'row': 6, 'col': 8}),
        # }

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        # fields = '__all__'
        fields = [  'name','price', 'product_detail', 'product_img','product_type','product_status','quantity' ]

class Product_TypeForm(forms.ModelForm):
    class Meta:
        model = Product_Type
        # fields = '__all__'
        fields = [  'product_type']

class StoreForm(forms.ModelForm):
    class Meta:
        model = Store
        fields = '__all__'
        # fields = [  'product_name','product_price', 'product_detail', 'product_img','product_type','product_status','product_amount' ]


class MechanicForm(forms.ModelForm):
    class Meta:
        model = Mechanic
        fields = ['mechanic_fname','mechanic_lname','mechanic_phone','mechanic_email','avatar','mechanic_img','mechanic_detail','mechanic_type']

class Mechanic_TypeForm(forms.ModelForm):
    class Meta:
        model = Mechanic_Type
        # fields = '__all__'
        fields = [  'mechanic_type']

class Order_ProductForm(forms.ModelForm):
    class Meta:
        model = Order_Product
        fields = '__all__'

# class StorckForm(forms.ModelForm):
#     class Meta:
#         model = Storck
#         fields = '__all__'



class UsersForm(forms.ModelForm):

    class Meta: 
        model = Users 
        fields = [ 'first_name' ,'last_name', 'email', 'avatar','username','password', ]
    

class StoreForm(forms.ModelForm):
    class Meta:
        model = Store
        fields = '__all__'



class AddStockForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['received_quantity']    #เพิ่มจำนวนสินค้าในสต๊อก



class SaleForm(forms.ModelForm):
    class Meta: 
        model = Sale
        fields = ["quantity"]


class LineItemForm(forms.ModelForm):
    class Meta: 
        model = LineItem
        fields = '__all__'