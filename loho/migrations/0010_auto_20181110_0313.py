# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-11-10 03:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('loho', '0009_cart_total'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cart',
            name='total',
            field=models.IntegerField(null=True),
        ),
    ]
