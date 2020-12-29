from django.core.management.base import BaseCommand, CommandError
from api.models import *
from openpyxl import load_workbook


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def add_arguments(self, parser):
        #parser.add_argument('poll_ids', nargs='+', type=int)
        pass

    def handle(self, *args, **optiSons):
        # pass
       
        file = "xlsx/data.xlsx"
        wb = load_workbook(file, read_only=True)
        # datas = wb.get_sheet_names()[2]
        # ws = wb.get_sheet_by_name(datas)
        
        # ws = wb['Data1']
        ws = wb['Data']
        count = int(ws['A1'].value)
        count1 = int(ws['A15'].value)
        count2 = int(ws['A20'].value)
        count3 = int(ws['A28'].value)
        count4 = int(ws['A35'].value)
        count5 = int(ws['A49'].value)
        count6 = int(ws['A57'].value)
        count7 = int(ws['A63'].value)
        count8 = int(ws['A74'].value)
        count9 = int(ws['A80'].value)
        count10 = int(ws['A91'].value)
        count11 = int(ws['A102'].value)
        count12 = int(ws['A108'].value)
        count13 = int(ws['A114'].value)
        count14 = int(ws['A125'].value)
        count15 = int(ws['A136'].value)
        count16 = int(ws['A147'].value)
        
        # count1 = int(ws['A1'].value)
        # print(f'User count = {count}')
        # print(count)
        
        # for i in range(count):
        #     print(i)
        # for r in range(count1):
        #     print(r)
            
        # row4 = [ ws[f'{c}4'].value for c in 'ABCDEFG' ]
        # print( row4 )
        for i in range(count): # 0,1,2,3
            q = User(**{
                "user_name" : str(ws[f'B{3+i}'].value),
                "user_lastname" : str(ws[f'C{3+i}'].value),
                "phone" : str(ws[f'D{3+i}'].value),
                "email" : str(ws[f'E{3+i}'].value),
                "username" : str(ws[f'F{3+i}'].value),
                "password" : str(ws[f'G{3+i}'].value),
                "avatar": str(ws[f'H{3+i}'].value), 
                "lat"  : str(ws[f'I{3+i}'].value),
                "lng" : str(ws[f'J{3+i}'].value),

                }) 
            q.save()

        for i in range(count1): # 0,1,2,3
            q = Store(**{
                "store_name" : str(ws[f'B{17+i}'].value),
                "store_img" : str(ws[f'C{17+i}'].value),
                "store_phone" : str(ws[f'D{17+i}'].value),
                "adddres" : str(ws[f'E{17+i}'].value),
                "lat" : str(ws[f'F{17+i}'].value),
                "lng" : str(ws[f'G{17+i}'].value),
                "time_open": str(ws[f'H{17+i}'].value), 
                "time_close"  : str(ws[f'I{17+i}'].value),
                })
            q.save()

        for i in range(count2): # 0,1,2,3
            q = Admin(**{
                "admin_name" : str(ws[f'B{22+i}'].value),
                "admin_lastname" : str(ws[f'C{22+i}'].value),
                "avatar" : str(ws[f'D{22+i}'].value),
                "email" : str(ws[f'E{22+i}'].value),
                "username" : str(ws[f'F{22+i}'].value),
                "password" : str(ws[f'G{22+i}'].value),
                })
            q.save()

        for i in range(count3): # 0,1,2,3
            q = MechanicCategory(**{
                #  "mechanicCategory_id" : int(ws[f'A{30+i}'].value),
                "mechanicCategory_name" : str(ws[f'B{30+i}'].value),
                }) 
            q.save() 

        for i in range(count4): # 0,1,2,3
            q = Mechanic(**{
                "mechanic_name" : str(ws[f'B{37+i}'].value),
                "mechanic_lastname" : str(ws[f'C{37+i}'].value),
                "phone" : str(ws[f'D{37+i}'].value),
                "email" : str(ws[f'E{37+i}'].value),
                "username" : str(ws[f'F{37+i}'].value),
                "password" : str(ws[f'G{37+i}'].value),
                "avatar": str(ws[f'H{37+i}'].value), 
                "mechanic_detail"  : str(ws[f'I{37+i}'].value),
                "mechanic_img" : str(ws[f'J{37+i}'].value),
                "mechanicCategory" : str(ws[f'K{37+i}'].value),
                "lat" : str(ws[f'L{37+i}'].value),
                "lng" : str(ws[f'M{37+i}'].value),

                }) 
            q.save()

        for i in range(count5): # 0,1,2,3
            q = ProductCategory(**{
                "category_name" : str(ws[f'B{51+i}'].value),
                }) 
            q.save()

        for i in range(count6): # 0,1,2,3
            q = ProductStatus(**{
                "status_name" : str(ws[f'B{59+i}'].value),
                }) 
            q.save()

        for i in range(count7): # 0,1,2,3
            q = Products(**{
                "products_name" : str(ws[f'B{65+i}'].value),
                "products_price" : int(ws[f'C{65+i}'].value),
                "products_detail" : str(ws[f'D{65+i}'].value),
                "products_img" : str(ws[f'E{65+i}'].value),
                "category" : str(ws[f'F{65+i}'].value),
                "status_number" : str(ws[f'G{65+i}'].value),
                "stock_number": int(ws[f'H{65+i}'].value), 
                }) 
            q.save()
        
        for i in range(count8): # 0,1,2,3
            q = Status(**{
                "name" : str(ws[f'B{76+i}'].value), 
                }) 
            q.save()
            
        for i in range(count9): # 0,1,2,3
            q = OrderMechanic(**{
                "date" : str(ws[f'B{82+i}'].value),
                "shopping_date" : str(ws[f'C{82+i}'].value),
                "buyer" : str(ws[f'D{82+i}'].value),
                "seller" : str(ws[f'E{82+i}'].value),
                "all_price" : int(ws[f'F{82+i}'].value),
                "lat" : str(ws[f'G{82+i}'].value),
                "lng": str(ws[f'H{82+i}'].value), 
                "status": str(ws[f'I{82+i}'].value), 
                }) 
            q.save()
        
        for i in range(count10): # 0,1,2,3
            q = OrderUser(**{
                "date" : str(ws[f'B{93+i}'].value),
                "shopping_date" : str(ws[f'C{93+i}'].value),
                "buyer" : str(ws[f'D{93+i}'].value),
                "seller" : str(ws[f'E{93+i}'].value),
                "all_price" : int(ws[f'F{93+i}'].value),
                "lat" : str(ws[f'G{93+i}'].value),
                "lng": str(ws[f'H{93+i}'].value), 
                "status": str(ws[f'I{93+i}'].value), 
                }) 
            q.save()

        for i in range(count11): # 0,1,2,3
            q = Delivery_options(**{
                "by_yourself" : str(ws[f'B{104+i}'].value),
                "by_store" : str(ws[f'C{104+i}'].value),
            }) 
            q.save()

        for i in range(count12): # 0,1,2,3
            q = Payment_options(**{
                "by_cash" : str(ws[f'B{110+i}'].value),
                "by_bank" : str(ws[f'C{110+i}'].value),
            }) 
            q.save()
        
        for i in range(count13): # 0,1,2,3
            q = OrderproductsUser(**{
                "order" : str(ws[f'B{116+i}'].value),
                "orderproducts" : str(ws[f'C{116+i}'].value),
                "orderproducts_storck" : int(ws[f'D{116+i}'].value),
                "delivery_options" : str(ws[f'E{116+i}'].value),
                "payment_options" : int(ws[f'F{116+i}'].value), 
                }) 
            q.save()

        for i in range(count14): # 0,1,2,3
            q = OrderproductsMechanic(**{
                "order" : str(ws[f'B{127+i}'].value),
                "orderproducts" : str(ws[f'C{127+i}'].value),
                "orderproducts_storck" : int(ws[f'D{127+i}'].value),
                "delivery_options" : str(ws[f'E{127+i}'].value),
                "payment_options" : int(ws[f'F{127+i}'].value), 
                }) 
            q.save()

        for i in range(count15): # 0,1,2,3
            q = Carts(**{
                "user_id" : str(ws[f'B{138+i}'].value),
                "products_id" : str(ws[f'C{138+i}'].value),
                
                }) 
            q.save()
        
        for i in range(count16): # 0,1,2,3
            q = Storck(**{
                "all_products" : str(ws[f'B{149+i}'].value),
                "Sold" : str(ws[f'C{149+i}'].value),
                "inventories" : int(ws[f'D{149+i}'].value),
                
                }) 
            q.save()