$(function(){
	// $.get("../static/json/shouye.json", function(data){
	//
	// 	var arr = data;
	// 	for(var i=0; i<arr.length; i++){
	// 		var obj = arr[i];
	// 		var li = $("<li></li>").appendTo("#list1");
	// 		$("<img src="+obj.img+">").appendTo(li);
	// 		var li2 = $("<li></li>").appendTo("#list2").html("0"+(i+1));
	//
	// 	}
	// 	lunbo();
	//
	// })

	
// 	function lunbo(){
// 		var _ul1 = $("#list1");
// 		var _ul2 = $("#list2");
// 		var _li1 = $("#list1 li");
// 		var _li2 = $("#list2 li");
//
// 		//初始化显示第一张图
// 		_li1.eq(0).show().siblings().hide();
//
// 		//图片总数量
// 		var size = $("#list1 li").size(); //4
//
// 		//自动轮播
// 		var i = 0; //记录图片下标
// 		var timer = setInterval(function(){
// 			i++;
// 			move();
// 		}, 2000);
//
// 		//移动的函数
// 		function move(){
//
// 			//如果i超出了图片总数量
// 			if (i == size) {
// 				i = 0; //即将移动到2张图
// 			}
//
// 			if (i < 0) {
// 				i = size-2;
// 			}
//
// 			if (i >= size){
// 				i = 1;
// 			}
//
// 			//透明度切换到第i张图
// 			_li1.eq(i).stop().fadeIn().siblings().stop().fadeOut();
//
// 			//改变ul2的按钮状态
// 			_li2.eq(i).removeClass().addClass("active").siblings().removeClass("active");
//
// 		}
//
//
// 		//上一页
// 				$("#prev").click(function(){
// 					i--;
// 					move();
// //					move2();
// 				})
//
// 				//下一页
// 				$("#next").click(function(){
// 					i++;
// 					move();
// //					move2();
// 				})
//
//
// 		//li2上面的按钮
// 		_li2.hover(function(){
// 			var index = $(this).index();
// 			//console.log(index);
// 			i = index;
// 			move();
// //			move2();
// 		})
//
// 		//移入box, 移出box
// 		$(".lunbo").hover(function(){
// 			//移入, 关闭定时器
// 			clearInterval(timer);
// 		},
// 		function(){
// 			//移出, 重新开启定时器
// 			timer = setInterval(function(){
// 				i++;
// 				move();
// //				move2();
// 			}, 2000);
// 		})
// 	}
//	轮播图
	new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 5,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false,
        loop: true
    });

	//详情页
	// var arr = [];
	// $.get("../static/json/mycart.json", function(data){
	// 	var arr = data;
	//
	// 	for(var i=0; i<arr.length; i++){
	// 		var obj = arr[i];
	//
	// 		$('<li><a href="#"><img src="'+obj.bigImg+'"/></a></li>').appendTo(".bt");
	//
	// 		$(".bt").on("click","li", function(){
	// 			var index = $(this).index();
	// 			var obj = arr[index]
	// 			location.href = "detail.html?id="+obj.id;
	// 		})
	// 	}
	//
	// })
	
	
	$(window).scroll(function(){
		var gao = $(window).scrollTop()+$(window).height()*0.3
		
		$(".dingwei").animate({top:gao},30);
	})
	
	
	
	
	
	
})







