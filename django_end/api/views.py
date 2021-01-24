from django.shortcuts import render
from django.http import HttpResponse
# from django.utils import translation
from .models import *
from .serializers import *
# ViewSets define the view behavior.
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
def index(request):
    # translation.activate('th')
    return HttpResponse("<h1>Constructor<h1>")