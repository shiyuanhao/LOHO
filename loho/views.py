from django.shortcuts import render

# Create your views here.
def shouye(request):
    return render(request,'shouye.html')


def denglu(request):
    return render(request,'denglu.html')


def zhuce(request):
    return render(request,'zhuce.html')