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

class Goods(models.Model):
    name = models.CharField(max_length=100)
    bigImg = models.CharField(max_length=100)
    zhongImg1 = models.CharField(max_length=100)
    zhongImg2 = models.CharField(max_length=100)
    zhongImg3 = models.CharField(max_length=100)
    price = models.CharField(max_length=10)
    yh_price = models.CharField(max_length=10,null=True)
    class Meta:
        db_table = 'loho_goods'

class Cart(models.Model):
    # 用户
    user = models.ForeignKey(User)
    # 商品
    goods = models.ForeignKey(Goods)
    # 商品数量(选择)
    number = models.IntegerField()
    # 是否选中
    isselect = models.BooleanField(default=True)
    #商品总价
    total = models.IntegerField(null=True)

    class Meta:
        db_table = 'loho_cart'

# 订单
# 一个用户 对应 多个订单
# 在从表这声明关系
class Order(models.Model):
    # 用户
    user = models.ForeignKey(User)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 状态
    # -1 过期
    # 1 未付款
    # 2 已付款，未发货
    # 3 已发货，快递
    # 4 已签收，未评价
    # 5 已评价
    # 6 退款....
    status = models.IntegerField(default=1)
    # 订单号
    identifier = models.CharField(max_length=256)

    class Meta:
        db_table = 'loho_order'


# 订单商品
# 一个订单 对应 多个商品
# 在从表中声明关系
class OrderGoods(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    goods = models.ForeignKey(Goods)
    # 个数
    number = models.IntegerField(default=1)

    class Meta:
        db_table = 'loho_ordergoods'