# Generated by Django 2.2.7 on 2021-05-02 21:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_banktransfer_qrcode'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sale',
            name='products',
        ),
        migrations.DeleteModel(
            name='LineItem',
        ),
        migrations.DeleteModel(
            name='Sale',
        ),
    ]