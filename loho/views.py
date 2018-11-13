import hashlib
import io
import os
import random
import time
import uuid

from django.core.serializers import json
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from loho.alipay import alipay_loho
from loho.models import User, Wheel, Goods, Cart, OrderGoods, Order


def shouye(request):
    goodss = Goods.objects.all()

    imgs = Wheel.objects.all()
    token = request.session.get('token')
    user = ''
    tel = ''
    tishi = ''
    if token:
        user = User.objects.get(token=token)
        tel = user.tel
    else:
        tishi = 'HI~欢迎来到LOHO!'
    data = {
        'imgs': imgs,
        'tel': tel,
        'tishi': tishi,
        'goodss': goodss,
    }
    return render(request, 'shouye.html', context=data)


def denglu(request):
    if request.method == 'GET':
        return render(request, 'denglu.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = request.POST.get('password')
        try:
            user = User.objects.get(tel=tel)
            if user.password == genarate_password(password):
                user.token = str(uuid.uuid5(uuid.uuid4(), 'login'))
                user.save()
                request.session['token'] = user.token
                return redirect('loho:shouye')
            else:
                return render(request, 'denglu.html', context={'passwordErr': '密码错误'})
        except:
            return render(request, 'denglu.html', context={'telErr': '该手机号码尚未注册'})


def zhuce(request):
    if request.method == 'GET':
        return render(request, 'zhuce.html')
    elif request.method == 'POST':

        tel = request.POST.get('tel')
        password = genarate_password(request.POST.get('password'))
        invitation = request.POST.get('invitation')

        user = User()
        user.tel = tel
        user.password = password
        user.invitation = invitation
        user.token = str(uuid.uuid5(uuid.uuid4(), 'zhuce'))
        user.save()
        request.session['token'] = user.token

        return redirect('loho:shouye')


def mycart(request):
    token = request.session.get('token')
    data = {}
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).exclude(number=0)
        tel = user.tel
        total_price = 0
        for cart in carts:
            if cart.isselect:
                total_price += cart.total
        data = {
            'tel': tel,
            'carts': carts,
            'total_price':total_price,
        }
        return render(request, 'mycart.html', context=data)
    return render(request,'denglu.html')



def detail(request, id):
    goods = Goods.objects.get(id=id)

    token = request.session.get('token')
    tel = ''
    carts = []
    if token:
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user)
        tel = user.tel
    data = {
        'goods': goods,
        'tel': tel,
        'carts': carts,
    }
    return render(request, 'detail.html', context=data)


from PIL import Image, ImageDraw, ImageFont


def verifycode(request):
    # 创建图片
    width = 100

    height = 40
    r = random.randrange(0, 256)
    g = random.randrange(0, 256)
    b = random.randrange(0, 256)
    image = Image.new('RGB', (width, height), (r, g, b))

    # 随机数
    str = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
    rand_str = ''
    for i in range(0, 4):
        temp = random.randrange(0, len(str))
        rand_str += str[temp]

    # 保存随机数，后续为验证
    # session

    # 创建画笔
    draw = ImageDraw.Draw(image)

    # 添加噪点
    for i in range(0, 300):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 256), random.randrange(0, 256), random.randrange(0, 256))
        draw.point(xy, fill=fill)

    # 导入字体
    # font = ImageFont.truetype('static/fonts/STXINGKA.ttf', 40)
    font = ImageFont.truetype('static/font/Fangsong.ttf', 40)

    # 字体颜色
    fontcolor1 = (255, random.randrange(0, 256), random.randrange(0, 256))
    fontcolor2 = (255, random.randrange(0, 256), random.randrange(0, 256))
    fontcolor3 = (255, random.randrange(0, 256), random.randrange(0, 256))
    fontcolor4 = (255, random.randrange(0, 256), random.randrange(0, 256))

    # 绘制操作
    draw.text((5, 3), rand_str[0], fill=fontcolor1, font=font)
    draw.text((25, 3), rand_str[1], fill=fontcolor2, font=font)
    draw.text((45, 3), rand_str[2], fill=fontcolor3, font=font)
    draw.text((65, 3), rand_str[3], fill=fontcolor4, font=font)

    # 释放
    del draw
    # 文件操作
    buff = io.BytesIO()
    image.save(buff, 'png')  # 保存在内存中
    response = HttpResponse(buff.getvalue(), 'image/png')
    response.set_cookie("code", rand_str)
    return response


def genarate_password(param):
    sha = hashlib.sha256()
    sha.update(param.encode('utf-8'))
    return sha.hexdigest()


def logout(request):
    request.session.flush()
    return redirect('loho:shouye')


def checktel(request):
    tel = request.GET.get('tel')
    responseData = {
        'msg': '账号可用',
        'status': 1,
    }
    try:
        user = User.objects.get(tel=tel)
        responseData['msg'] = '该手机号码已被占用'
        responseData['status'] = -1
        return JsonResponse(responseData)
    except:
        return JsonResponse(responseData)


def changecartstatus(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(id=cartid)
    cart.isselect = not cart.isselect
    cart.save()
    carts = Cart.objects.filter(user=User.objects.get(token=request.session.get('token')))
    total_price = 0
    total_number = 0
    for cart1 in carts:
        if cart1.isselect:
            total_price += int(cart1.total)
            total_number += cart1.number
    responseData = {
        'msg': '选中状态改变',
        'status': 1,
        'isselect': cart.isselect,
        'total_price':total_price,
        'total_number':total_number,
    }

    return JsonResponse(responseData)


# def changecartselect(request):
#     isselect = request.GET.get('isselect')
#     if isselect == 'true':
#         isselect = True
#     else:
#         isselect = False
#
#     token = request.session.get('token')
#     user = User.objects.get(token=token)
#     carts = Cart.objects.filter(user=user)
#     for cart in carts:
#         cart.isselect = isselect
#         cart.save()
#
#     return JsonResponse({'msg': '反选操作成功', 'status': 1})


def delgoods(request):
    cartid = request.GET.get('cartid')
    token = request.session.get('token')
    user = User.objects.get(token=token)
    sumprice = 0
    totalnum = 0
    # for cart in carts:
    #     if cart == Cart.objects.filter(id=cartid):
    Cart.objects.get(pk=cartid).delete()
    carts = Cart.objects.filter(user=user)
    for cart in carts:
        totalnum += cart.number
        if cart.isselect:
            sumprice += int(cart.total)


    return JsonResponse({'msg':'删除商品成功','status':1,'sumprice':sumprice,'totalnum':totalnum})


def generateorder(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    # 生成订单
    order = Order()
    order.user = user
    order.identifier = str(int(time.time())) + str(random.randrange(10000, 100000))
    order.save()

    # 订单商品
    carts = Cart.objects.filter(user=user).filter(isselect=True)
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()

        # 从购物车移除
        cart.delete()

    responseData = {
        'msg': '订单生成成功',
        'status': 1,
        'identifier': order.identifier
    }

    return JsonResponse(responseData)


def orderinfo(request,identifier):
    # 一个订单 对应 多个商品
    order = Order.objects.get(identifier=identifier)

    return render(request, 'orderinfo.html', context={'order': order,'identifier':identifier})


def add_to_cart(request):
    token = request.session.get('token')
    if token:
        goodsid = request.GET.get('goodsid')
        num = request.GET.get('num')
        user = User.objects.get(token=token)

        carts = Cart.objects.filter(user=user,goods_id=goodsid)
        if carts:
            cart = carts.first()
            cart.number += int(num)
            cart.total = int(cart.number) * int(cart.goods.yh_price)
            cart.save()
        else:
            newcart = Cart()
            newcart.user = user
            newcart.goods = Goods.objects.get(pk=goodsid)
            newcart.number = num
            newcart.total = int(newcart.number) * int(newcart.goods.yh_price)
            newcart.save()
        return JsonResponse({'status':1})

    return render(request,'denglu.html')


def delcarts(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    Cart.objects.filter(user=user).delete()
    return JsonResponse({'msg':'清空购物车成功','status':1})


def delselect(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    goods_num = 0
    total_price = 0
    for cart in carts:
        if cart.isselect == 1 :
            cart.delete()
        else:
            goods_num += cart.number
    return JsonResponse({'msg':'删除选中成功','status':1,'goods_num':goods_num,'total_price':total_price})


def allselect(request):
    token = request.session.get('token')
    user = User.objects.get(token=token)
    carts = Cart.objects.filter(user=user)
    isselect = request.GET.get('isselect')
    if isselect == 'true':
        isselect = True
    else:
        isselect = False
    total_price = 0

    for cart in carts:
        if isselect:
            cart.isselect = 1
            cart.save()
            total_price += cart.total
        else:
            cart.isselect = 0
            cart.save()
            total_price = 0
    return JsonResponse({'msg':'全选成功','total_price':total_price})

def pay(request):
    identifier = request.GET.get('identifier')
    #支付url
    url = alipay_loho.direct_pay(
        subject = '测试订单 --- iphone X',#订单名称
        out_trade_no = identifier,#订单号
        total_amount = 50,#付款金额
        return_url='http://39.105.186.82/returnurl/',
    )
    #拼接支付网关
    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=url)
    return JsonResponse({'alipay_url':alipay_url})


def notifyurl(request):
    print('xxx 订单支付成功，请发货')
    print(request.GET.get('subject'))
    return JsonResponse({'msg':'success'})


def returnurl(request):
    print('xxx 订单支付成功，进行页面跳转')
    return redirect('loho:shouye')