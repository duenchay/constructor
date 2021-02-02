from django import forms
from .models import *

 
class ProductForm(forms.ModelForm):
    # product_type = forms.ModelChoiceField(queryset=Product_Type.objects.all(),
    #                                 to_field_name = 'product_type',
    #                                  empty_label="Select Product_Type")
    # product_detail = forms.CharField(widget=forms.Textarea(attrs={
    #     'cols': 200,
    #     'rows': 3,
    #     'style': 'width: 100%'
    # }))
    class Meta:
        model = Product
        # fields = '__all__'
        fields = [  'product_name','product_price', 'product_detail', 'product_img','product_type','product_status','product_amount' ]

class StoreForm(forms.ModelForm):
    class Meta:
        model = Store
        fields = '__all__'
        # fields = [  'product_name','product_price', 'product_detail', 'product_img','product_type','product_status','product_amount' ]


class MechanicForm(forms.ModelForm):
    class Meta:
        model = Mechanic
        fields = '__all__'