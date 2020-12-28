from django.core.management.base import BaseCommand, CommandError
from api.models import User
from api.models import Store
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
        ws = wb['Data1'] 
        count = int(ws['A1'].value)
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
                "avatar": str(ws[f'H{3+i}'].value), #รูปผู้ใช้งาน
                "lat"  : int(ws[f'I{3+i}'].value),
                "lng" : int(ws[f'J{3+i}'].value),

                }) 
            q.save()
        # for r in range(count1): # 0,1,2,3
        #     q1 = Store(**{
        #         "store_name" : str(ws[f'B{3+r}'].value),
        #         "store_img" : str(ws[f'C{3+r}'].value),
        #         "store_phone" : str(ws[f'D{3+r}'].value),
        #         "adddres" : str(ws[f'E{3+r}'].value),
        #         "lat" : str(ws[f'F{3+r}'].value),
        #         "lng" : str(ws[f'G{3+r}'].value),
        #         "time_open": str(ws[f'H{3+r}'].value), #รูปผู้ใช้งาน
        #         "time_close"  : str(ws[f'I{3+r}'].value),
               

        #         })
        #     q1.save()