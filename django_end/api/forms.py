from django import forms
from .models import *
  
PAYMENT_CHOICES = (
    ('S', 'Stripe'), 
    ('P', 'PayPal')
)
class CartForm(forms.Form):
    quantity = forms.IntegerField(initial='1')
    product_id = forms.IntegerField(widget=forms.HiddenInput)

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(CartForm, self).__init__(*args, **kwargs)

class CheckoutForm(forms.Form):
    address = forms.CharField(required=False)
    # money_status = forms. (Money_Status,on_delete=models.CASCADE,default=1,null=True,verbose_name = 'สถานะการชำระเงิน') #สถานะการชำระเงิน
    # delivery_options = forms.ForeignKey(Delivery_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการจัดส่ง',null=True)
    # payment_options = forms.ForeignKey(Payment_Options,on_delete=models.CASCADE,verbose_name = 'ตัวเลือกการชำระเงิน',null=True)
    # shipping_address2 = forms.CharField(required=False)
    # shipping_country = CountryField(blank_label='(select country)').formfield(
    #     required=False,
    #     widget=CountrySelectWidget(attrs={
    #         'class': 'custom-select d-block w-100',
    #     }))
    # shipping_zip = forms.CharField(required=False)

    # billing_address = forms.CharField(required=False)
    # billing_address2 = forms.CharField(required=False)
    # billing_country = CountryField(blank_label='(select country)').formfield(
    #     required=False,
    #     widget=CountrySelectWidget(attrs={
    #         'class': 'custom-select d-block w-100',
    #     }))
    # billing_zip = forms.CharField(required=False)

    # same_billing_address = forms.BooleanField(required=False)
    # set_default_shipping = forms.BooleanField(required=False)
    # use_default_shipping = forms.BooleanField(required=False)
    # set_default_billing = forms.BooleanField(required=False)
    # use_default_billing = forms.BooleanField(required=False)

    payment_option = forms.ChoiceField(
        widget=forms.RadioSelect, choices=PAYMENT_CHOICES)


class PaymentForm(forms.Form):
    stripeToken = forms.CharField(required=False)
    save = forms.BooleanField(required=False)
    use_default = forms.BooleanField(required=False)
# class CheckoutForm(forms.ModelForm):
#     class Meta:
#         model = Order
#         # exclude = ('paid',)
#         fields = [   'address', 'delivery_options','payment_options']

        # widgets = {
        #     'address': forms.Textarea(attrs={'row': 6, 'col': 8}),
        # }
class EditOrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = [ 'money_status']


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        # fields = '__all__'
        fields = [  'name','price', 'product_detail', 'product_img','product_type','quantity' ]

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

# class Order_ProductForm(forms.ModelForm):
#     class Meta:
#         model = Order_Product
#         fields = '__all__'

# class StorckForm(forms.ModelForm):
#     class Meta:
#         model = Storck
#         fields = '__all__'
 


class UsersForm(forms.ModelForm):

    class Meta: 
        model = Users 
        fields = [ 'first_name' ,'last_name', 'email', 'avatar','username','password', ]
    
class EditProfileForm(forms.ModelForm):

    class Meta: 
        model = Users 
        fields = [ 'first_name' ,'last_name', 'email', 'avatar',]

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