# Generated by Django 2.2.7 on 2021-05-02 18:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='payment',
            name='datetime',
        ),
        migrations.RemoveField(
            model_name='payment',
            name='ppp',
        ),
    ]