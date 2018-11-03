import io
import os
import random
import uuid

from django.core.serializers import json
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from loho.models import User, Wheel


def shouye(request):
    imgs = Wheel.objects.all()
    username = request.COOKIES.get('username')
    data = {
        'imgs':imgs,
        'username':username,
    }
    return render(request,'shouye.html',context=data)


def denglu(request):
    if request.method == 'GET':
        return render(request,'denglu.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = request.POST.get('password')
        users = User.objects.filter(tel=tel).filter(password=password)
        if users.exists():
            user = users.first()
            user.token = uuid.uuid5(uuid.uuid4(), 'login')
            response = redirect('loho:shouye')
            response.set_cookie('username',tel)
            return response
        else:
            return HttpResponse('该手机号码未注册或者密码错误')

def zhuce(request):
    if request.method == 'GET':
        return render(request,'zhuce.html')
    elif request.method == 'POST':

        tel = request.POST.get('tel')
        password = request.POST.get('password')
        invitation = request.POST.get('invitation')

        try:
            user = User()
            user.tel = tel
            user.password = password
            user.invitation = invitation
            user.token = uuid.uuid5(uuid.uuid4(), 'register')
            user.save()
            response = redirect('loho:shouye')
            response.set_cookie('username',tel)
            return response
        except Exception as e :
            return HttpResponse('注册失败'+e)


def mycart(request):
    return render(request,'mycart.html')


def detail(request):
    return render(request,'detail.html')

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
    response.set_cookie("code",rand_str)
    return response



def logout(request):
    response = redirect('loho:shouye')
    response.delete_cookie('username')
    return response