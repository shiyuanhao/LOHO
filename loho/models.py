from django.db import models

# Create your models here.

class User(models.Model):
    tel = models.CharField(max_length=20,unique=True)
    password = models.CharField(max_length=256)
    invitation = models.CharField(max_length=256,default='loho1314')
    token = models.CharField(max_length=256, default='')

class Wheel(models.Model):
    img = models.CharField(max_length=50)
    class Meta:
        db_table = 'loho_wheel'