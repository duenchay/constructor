# Generated by Django 2.2.7 on 2021-03-02 11:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0022_auto_20210302_1106'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='users',
        ),
    ]
