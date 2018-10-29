from django.conf.urls import url

from loho import views

urlpatterns = [
    url(r'^$',views.shouye,name='shouye'),
    url(r'^shouye/$',views.shouye,name='shouye'),
    url(r'^denglu/$',views.denglu,name='denglu'),
    url(r'^zhuce/$',views.zhuce,name='zhuce'),
]