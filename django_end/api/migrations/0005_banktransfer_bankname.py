# Generated by Django 2.2.7 on 2021-05-02 19:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_banktransfer_accountname'),
    ]

    operations = [
        migrations.AddField(
            model_name='banktransfer',
            name='bankName',
            field=models.CharField(max_length=100, null=True),
        ),
    ]