$(function () {
    // refresh();
    // function refresh(){
    //
    // 	$(".f12-1").remove();
    // 	var arr = $.cookie("cart");
    // 	if(arr){
    // 		arr = JSON.parse(arr);
    //
    // 		var totalPrice = 0;
    //
    // 		for(var i=0; i<arr.length; i++){
    // 			var obj = arr[i];
    //
    // 			var ul = $('<ul class="f12-1 clearfix"></ul>').appendTo(".f1-2");
    // 			if(obj.checked){
    // 				$('<li class="f2-1"><input type="checkbox" checked="checked"/></li>').appendTo(ul);
    // 			}
    // 			else{
    // 				$('<li class="f2-1"><input type="checkbox" /></li>').appendTo(ul);
    // 			}
    //
    // 			$('<li class="f2-2"><img style="width: 100px; height: 41px;" src="'+obj.zhongImg1+'"/></li>').appendTo(ul);
    // 			$('<li class="f2-3">'+obj.name+'</li>').appendTo(ul);
    // 			$('<li class="f2-4"><p>颜色：枪色</p><p>条码：201302160824001</p></li>').appendTo(ul);
    // 			$('<li class="f2-5"><p>'+obj.price+'</p><p class="f5-1">促销优惠</p></li>').appendTo(ul);
    // 			$('<li class="f2-6"><div><span class="f6-1">-</span><input class="f6-2" value="'+obj.num+'"/><span class="f6-3">+</span></div></li>').appendTo(ul);
    // 			$('<li class="f2-7">'+(obj.price * obj.num)+'</li>').appendTo(ul);
    // 			$('<li class="f2-8"><a class="f8-1" href="#">删除</a><br /><a href="#">移入收藏夹</a></li>').appendTo(ul);
    //
    // 			if(obj.checked){
    // 				totalPrice += obj.price * obj.num;
    // 			}
    //
    // 		}
    // 		for(var i=0; i<arr.length; i++){
    // 			$(".d2-2").html("¥"+"&nbsp;"+totalPrice);
    // 		}
    // 	}
    // 	else{
    // 		console.log("购物车为空");
    // 	}
    //
    // }

//数量增加
// 	$(".f1-2").on("click",".f6-3", function(){
//
// 		var index = $(this).index(".f2-6 .f6-3");
//
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr[index].num++;
//
// 		$.cookie("cart",JSON.stringify(arr),{expires:30,path:"/"});
//
// 		refresh();
//
// 	})

//数量减少
// 	$(".f1-2").on("click",".f6-1", function(){
//
// 		var index = $(this).index(".f2-6 .f6-1");
//
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr[index].num--;
// 		if(arr[index].num < 1){
// 			arr[index].num = 1;
// 		}
//
// 		$.cookie("cart",JSON.stringify(arr),{expires:30,path:"/"});
//
// 		refresh();
//
// 	})

//删除
// 	$(".f1-2").on("click",".f8-1", function(){
// 		var index = $(this).index(".f12-1 .f8-1");
//
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr.splice(index, 1);
//
// 		$.cookie("cart",JSON.stringify(arr),{expires:30,path:"/"});
// 		refresh();
//
//
// 	})

//勾选	
// 	$(".f1-2").on("click",".f2-1", function(){
// 		var index = $(this).index(".f12-1 .f2-1");
//
// 		var uls=$(this).parent().parent().children()
// 		for(var i = 0; i<uls.length; i++){
// 			if(uls[i].firstChild.firstChild.checked){
// 				$(".f11-6")[0].checked=true;
// 			}else{
// 				$(".f11-6")[0].checked=false;
// 				break;
// 			}
// 		}
// 		var arr = JSON.parse($.cookie("cart"));
// 		arr[index].checked = !arr[index].checked;
//
// 		$.cookie("cart",JSON.stringify(arr),{expires:30,path:"/"});
//
// 		isAllSelect();
//
// 		refresh();
//
// 	})

//判断是否全部勾选
// 	isAllSelect();
    // function isAllSelect(){
    // 	var arr = $.cookie("cart");
    // 	if(!arr){
    // 		return;
    // 	}
    //
    // 	var arr = JSON.parse($.cookie("cart"));
    // 	var sum = 0;
    // 	for(var i=0; i<arr.length; i++){
    // 		sum += arr[i].checked;
    // 	}
    //
    // 	if(sum == arr.length){
    // 		$(".f2-1").prop("checked",true);
    // 	}
    // 	else{
    // 		$(".f2-1").prop("checked",false);
    // 	}
    // }

//全选	
// 	$(".f11-6").click(function(){
//
// 		var arr = $.cookie("cart");
// 		if(!arr){
// 			return;
// 		}
//
// 		var arr = JSON.parse($.cookie("cart"));
// 		for(var i=0; i<arr.length; i++){
// 			if($(this).prop("checked")){
// 				arr[i].checked = true;
// 			}
// 			else{
// 				arr[i].checked = false;
// 			}
// 		}
//
// 		$.cookie("cart",JSON.stringify(arr),{expires:30,path:"/"});
// 		refresh();
// 	})

    //就算总数
    total()
    //单个选中点击是否选中
    $('.listyle .f2-1').click(function () {
        var cartid = $(this).attr('cartid')
        var $that = $(this)

        $.get('/changecartstatus/', {'cartid': cartid}, function (response) {
            console.log(response)
            if (response.status == '1') {
                var isselect = response.isselect
                $that.prop('checked', isselect)
                console.log(response.total_price)
                $('.d2-2').html('￥' + response.total_price)

                $('.nmb').html(response.total_number)
            }
        })
    })

    //全选或者全取消
    // $('.f-1 .all').click(function () {
    //     var isselect = $(this).attr('isselect')
    //     isselect = (isselect == 'false') ? true : false
    //     $(this).attr('isselect', isselect)
    //     if (isselect){
    //         $(this).removeAttr('checked').attr('checked','checked')
    //     } else {
    //         $(this).attr('checked','checked').removeAttr('checked')
    //     }
    //     $.get('/changecartselect/', {'isselect':isselect}, function (response) {
    //         console.log(response)
    //         if (response.status == 1){
    //             // 遍历
    //             $('.f1-2').each(function () {
    //                 $(this).attr('isselect', isselect)
    //                 if (isselect){
    //                      $('#choise').removeAttr('checked').attr('checked',true)
    //                 } else {
    //                      $('#choise').attr('checked',flase).removeAttr('checked')
    //                 }
    //             })
    //         }
    //     })
    // })
    $(".f1-1 .all").find(":checkbox").click(function () {
        var isselect = $(this).is(":checked")
        console.log(isselect)
        $.get('/allselect/',{'isselect':isselect},function (response) {
            if (isselect) {
                $(":checkbox").prop("checked", true)
            } else {
                $(":checkbox").prop("checked", false)
            }
            console.log(response.total_price)
            $('.d2-2').html('￥'+ response.total_price)
        })

    })


    //总计
    function total() {
        var sum = 0
        var goodssum = 0
        // 遍历操作
        $('.listyle').each(function () {
            var $panduan = $(this).find('.f2-1')
            var $jiage = $(this).find('.f2-5')
            var $shuliang = $(this).find('.f2-6')

            if ($panduan.find('.glyphicon-ok').length) {
                var price = $jiage.find('.price').attr('price')
                var num = $shuliang.find('.number').attr('number')
                sum += price * num
                goodssum += parseInt(num)
            }
        })

        // 显示
        $('.d-2 .d2-2').html(parseInt(sum))
        $('#goodsnum').html(goodssum)

    }


    //删除操作
    $('.del').click(function () {
        var cartid = $(this).attr('cartid')
        var $that = $(this)

        $.get('/delgoods/', {'cartid': cartid}, function (response) {
            console.log(response)
            if (response.status == '1') {
                $that.parents('.f1-2').remove()
                $('.d2-2').html('￥' + (response.sumprice).toString())
                console.log(response.totalnum)
                $('#goodsnum').text(response.totalnum)
            }
        })
    })
    //清空购物车
    $('.delcarts').click(function () {
        $.get('/delcarts/', function (response) {
            console.log(response)
            if (response.status == 1) {
                $('.f1-2').remove()
                $('#goodsnum').html(0)
                $('.d2-2').html(0)
            }
        })


    })

    //删除选中
    $('.delselect').click(function () {
        var $that = $('.f1-2 :checked')
        $.get('/delselect/', function (response) {
            console.log(response)
            if (response.status == '1') {
                $that.each(function () {
                    $that.parents('.f1-2').remove()

                })

                // if ($('#choise').is(':checked')){
                //
                $('#goodsnum').text(response.goods_num)
                $('.d2-2').html('￥' + (response.total_price).toString())
                // }
            }

        })
    })

    //下单
    $('#generateorder').click(function () {
        $.get('/generateorder/', function (response) {
            console.log(response)
            if (response.status == 1) {  // 跳转到订单详情
                $('.f2-1 :checked').prop('checked',false)
                window.open('/orderinfo/' + response.identifier + '/', target = '_self')
            }
        })
    })


})
