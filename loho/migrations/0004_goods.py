# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-11-06 13:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('loho', '0003_wheel'),
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('bigImg', models.CharField(max_length=100)),
                ('zhongImg1', models.CharField(max_length=100)),
                ('zhongImg2', models.CharField(max_length=100)),
                ('zhongImg3', models.CharField(max_length=100)),
                ('price', models.CharField(max_length=10)),
            ],
            options={
                'db_table': 'lobo_goods',
            },
        ),
    ]