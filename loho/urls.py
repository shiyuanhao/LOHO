from django.conf.urls import url

from loho import views

urlpatterns = [
    url(r'^$',views.shouye,name='shouye'),
    url(r'^shouye/$',views.shouye,name='shouye'),#首页
    url(r'^denglu/$',views.denglu,name='denglu'),#登录
    url(r'^zhuce/$',views.zhuce,name='zhuce'),#注册
    url(r'^mycart/$',views.mycart,name='mycart'),#购物车
    url(r'^detail/(\d+)$',views.detail,name='detail'),#商品详情页
    url(r'^verifycode/$',views.verifycode,name='verifycode'),#验证码生成
    url(r'^logout/$',views.logout,name='logout'),#注销
    url(r'^checktel/$',views.checktel,name='checktel'),#验证手机号
    # url(r'^addcart/$',views.addcart,name='addcart'),
    # url(r'^subcart/$',views.subcart,name='subcart'),
    url(r'^changecartstatus/$',views.changecartstatus,name='changecartstatus'),#点击单个改变状态
    # url(r'^changecartselect/$',views.changecartselect,name='changecartselect'),
    url(r'^delgoods/$',views.delgoods,name='delgoods'),#删除商品
    url(r'^generateorder/$',views.generateorder,name='generateorder'),#下单
    url(r'^orderinfo/(\d+)/$', views.orderinfo, name='orderinfo'),#订单详情

    url(r'^add_to_cart/$',views.add_to_cart,name='add_to_cart'),#添加至购物车
    url(r'^delcarts/$',views.delcarts,name='delcarts'),#清空购物车
    url(r'^delselect/$',views.delselect,name='delselect'),#删除选中
    url(r'^allselect/$',views.allselect,name='allselect'),#全选
]