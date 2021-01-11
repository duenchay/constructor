# Generated by Django 2.2.7 on 2021-01-11 09:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Admin',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('admin_fname', models.CharField(default=' ', max_length=100, verbose_name='ชื่อ')),
                ('admin_lname', models.CharField(default=' ', max_length=100, verbose_name='นามสกุล')),
                ('admin_email', models.CharField(default=' ', max_length=50, verbose_name='อีเมล')),
                ('avatar', models.ImageField(upload_to='media/', verbose_name='รูปโปรไฟล์')),
            ],
            options={
                'verbose_name': 'แอดมิน',
            },
        ),
        migrations.CreateModel(
            name='Delivery_Options',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('delivery_options', models.CharField(max_length=100, verbose_name='ตัวเลือกการจัดส่ง')),
            ],
            options={
                'verbose_name': 'ตัวเลือกการจัดส่ง',
            },
        ),
        migrations.CreateModel(
            name='Mechanic_Type',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mechanic_type', models.CharField(default=' ', max_length=100, verbose_name='ประเภทช่าง')),
            ],
            options={
                'verbose_name': 'ประเภทช่าง',
            },
        ),
        migrations.CreateModel(
            name='Money_Status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('money_status', models.CharField(default=' ', max_length=100, verbose_name='สถานะการรชำระเงิน')),
            ],
            options={
                'verbose_name': 'สถานะการชำระเงิน',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(verbose_name='วันที่สั่งสินค้า')),
                ('all_price', models.FloatField(verbose_name='ราคารวม')),
                ('lat', models.CharField(default=' ', max_length=1000)),
                ('lng', models.CharField(default=' ', max_length=1000)),
                ('admin', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Admin', verbose_name='รหัสผู้ขายสินค้า')),
                ('delivery_options', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Delivery_Options', verbose_name='ตัวเลือกการจัดส่ง')),
                ('money_status', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Money_Status', verbose_name='สถานะการชำระเงิน')),
            ],
            options={
                'verbose_name': 'ข้อมูลการสั่งซื้อ',
            },
        ),
        migrations.CreateModel(
            name='Payment_Options',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_options', models.CharField(max_length=100, verbose_name='ตัวเลือกการชำระเงิน')),
            ],
            options={
                'verbose_name': 'ตัวเลือกการชำระเงิน',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(default=' ', max_length=1000, verbose_name='ชื่อสินค้า')),
                ('product_price', models.FloatField(verbose_name='ราคาสินค้า')),
                ('product_detail', models.CharField(default=' ', max_length=1000, verbose_name='รายละเอียดสินค้า')),
                ('product_img', models.ImageField(upload_to='media/', verbose_name='รูปสินค้า')),
                ('product_amount', models.IntegerField(verbose_name='จำนวนสินค้า')),
            ],
            options={
                'verbose_name': 'สินค้า',
            },
        ),
        migrations.CreateModel(
            name='Product_Status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_status', models.CharField(default=' ', max_length=100, verbose_name='สถานะสินค้า')),
            ],
            options={
                'verbose_name': 'สถานะสินค้า',
            },
        ),
        migrations.CreateModel(
            name='Product_Type',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_type', models.CharField(default=' ', max_length=100, verbose_name='หมวดหมู่สินค้า')),
            ],
            options={
                'verbose_name': 'หมวดหมู่สินค้า',
            },
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role', models.CharField(default=' ', max_length=100, verbose_name='บทบาทผู้ใช้งาน')),
            ],
            options={
                'verbose_name': 'บทบาทผู้ใช้งาน',
            },
        ),
        migrations.CreateModel(
            name='Store',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('store_name', models.CharField(default=' ', max_length=100, verbose_name='ชื่อร้าน')),
                ('store_img', models.ImageField(upload_to='media/', verbose_name='รูปร้าน')),
                ('store_phone', models.CharField(default=' ', max_length=100, verbose_name='เบอร์โทรศัพท์ร้าน')),
                ('store_detail', models.CharField(default=' ', max_length=100, verbose_name='รายละเอียดร้าน')),
                ('lat', models.CharField(default=' ', max_length=1000)),
                ('lng', models.CharField(default=' ', max_length=1000)),
            ],
            options={
                'verbose_name': 'ข้อมูลร้าน',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(default=' ', max_length=100)),
                ('email', models.CharField(default=' ', max_length=50)),
                ('password', models.CharField(default=' ', max_length=100)),
                ('role', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Role')),
            ],
            options={
                'verbose_name': 'ผู้ใช้งานระบบ',
            },
        ),
        migrations.CreateModel(
            name='Storck',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('all_products', models.IntegerField(verbose_name='จำนวนสินค้าทั้งหมด')),
                ('Sold', models.IntegerField(verbose_name='จำนวนสินค้าที่ขายได้')),
                ('inventories', models.IntegerField(verbose_name='จำนวนสินค้าที่คงเหลือ')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Product', verbose_name='รหัสสินค้า')),
            ],
            options={
                'verbose_name': 'คลังสินค้า',
            },
        ),
        migrations.AddField(
            model_name='product',
            name='product_status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Product_Status', verbose_name='สถานะสินค้า'),
        ),
        migrations.AddField(
            model_name='product',
            name='product_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Product_Type', verbose_name='หมวดหมู่สินค้า'),
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(verbose_name='วันที่ชำระเงิน')),
                ('payment_img', models.ImageField(blank=True, null=True, upload_to='media/', verbose_name='รูปสลิปโอนเงิน')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Order', verbose_name='รหัสการสั่งซื้อสินค้า')),
                ('payment_options', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Payment_Options', verbose_name='ตัวเลือกการชำระเงิน')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User', verbose_name='รหัสผู้สั่งซื้อสินค้า')),
            ],
            options={
                'verbose_name': 'การชำระเงิน',
            },
        ),
        migrations.CreateModel(
            name='Order_Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField(verbose_name='จำนวนสินค้า')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Order', verbose_name='รหัสการสั่งซื้อ')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Product', verbose_name='รหัสสินค้า')),
            ],
            options={
                'verbose_name': 'รายการสินค้า',
            },
        ),
        migrations.AddField(
            model_name='order',
            name='payment_options',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Payment_Options', verbose_name='ตัวเลือกการชำระเงิน'),
        ),
        migrations.AddField(
            model_name='order',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User', verbose_name='รหัสผู้สั่งซื้อสินค้า'),
        ),
        migrations.CreateModel(
            name='Mechanic',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mechanic_fname', models.CharField(default=' ', max_length=100, verbose_name='ชื่อ')),
                ('mechanic_lname', models.CharField(default=' ', max_length=100, verbose_name='นามสกุล')),
                ('mechanic_phone', models.CharField(default=' ', max_length=100, verbose_name='เบอร์โทรศัพท์')),
                ('mechanic_email', models.CharField(default=' ', max_length=100, verbose_name='อีเมล')),
                ('avatar', models.ImageField(upload_to='media/', verbose_name='รูปโปรไฟล์')),
                ('mechanic_img', models.CharField(default=' ', max_length=100, verbose_name='รูปงานช่าง')),
                ('mechanic_detail', models.CharField(default=' ', max_length=100, verbose_name='รายละเอียดงานช่าง')),
                ('mechanic_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Mechanic_Type')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User')),
            ],
            options={
                'verbose_name': 'ช่าง',
            },
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('customer_fname', models.CharField(default=' ', max_length=100, verbose_name='ชื่อ')),
                ('customer_lname', models.CharField(default=' ', max_length=100, verbose_name='นามสกุล')),
                ('customer_phone', models.CharField(default=' ', max_length=100, verbose_name='เบอร์โทรศัพท์')),
                ('customer_email', models.CharField(default=' ', max_length=100, verbose_name='อีเมล')),
                ('avatar', models.ImageField(upload_to='media/', verbose_name='รูปโปรไฟล์')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User')),
            ],
            options={
                'verbose_name': 'ลูกค้า',
            },
        ),
        migrations.CreateModel(
            name='Conversations',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.CharField(default=' ', max_length=1000, verbose_name='ข้อความ')),
                ('joined_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User', verbose_name='รหัสผู้ใช้งาน')),
            ],
            options={
                'verbose_name': 'บทสนทนา',
            },
        ),
        migrations.CreateModel(
            name='Carts',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField(verbose_name='จำนวนสินต้าที่เลือก')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Product', verbose_name='รหัสสินค้า')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User', verbose_name='รหัสผู้ใช้งาน')),
            ],
            options={
                'verbose_name': 'ตะกร้าสินค้า',
            },
        ),
        migrations.AddField(
            model_name='admin',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.User'),
        ),
    ]
