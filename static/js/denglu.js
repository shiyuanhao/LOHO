// $(function(){
// 	$(".nav-1").mousedown(function(){
// 		$(".jiemian2").show().siblings().hide();
// 		$(".nav-2").css("border-bottom","red").siblings().css("border-bottom","#ccc");
//
// 	})
// 	//$(".nav-2").mousedown(function(){
// 	//	$(".jiemian1").show().siblings().hide();
// 	//	$(".nav-1").css("border-bottom","red").siblings().css("border-bottom","#ccc");
// 	//})
//
//
// 	$(".jiemian2 input").eq(0).val($.cookie("user"));
// 	$(".jiemian2 input").eq(1).val($.cookie("password"));
//
// 	$(".d-2").click(function(){
// 		//ajax
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("post", "http://localhost/LOHO_glass/index/login.php", true);
// 		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// 		var str = "user="+$(".jiemian2 input").eq(0).val()  + "&password="+$(".jiemian2 input").eq(1).val() ;
// 		//console.log(str);
// 		xhr.send(str);
// 		xhr.onreadystatechange = function () {
// 			if (xhr.readyState==4 && xhr.status==200) {
// 				console.log(xhr.responseText);
// 				var data = JSON.parse(xhr.responseText);
// 				if(data.status==1){
// 					location.href = "/shouye/";
// 				}
// 				else{
// 					alert(data.msg);
// 				}
// 				//json解析
// 				//如果注册成功则进入登录页面
// 				//如果失败则弹出提示信息
// 			}
// 		}
//
// 	})
//
//
//
//
//
//
//
//
//
//
// })
$(function () {
    var yanzen1 = false;
    var yanzen2 = false;
    var yanzen3 = false;

    $(".f1-2-5").keyup(function () {
        // console.log(111)
        // console.log($.cookie("code").toLowerCase())
        if ($(this).val().toLowerCase() == $.cookie("code").toLowerCase()) {
            $("#code").html("");
            yanzen1 = true;
        }
        else {
            $("#code").html("验证码不正确,点击刷新").css('color','red');
            yanzen1 = false;
        }
    })

    $('.phone').keyup(function () {
        var phone = /^1[3|5|7|8|]\d{9}$/
        if (phone.test($(this).val())) {
            $('#tel').html('')
            yanzen2 = true
        }else {
            $('#tel').html('请填写正确的手机号码')
            yanzen2 = false
        }
    })

    $('.password').keyup(function () {
        var password = /^[a-z0-9_-]{6,18}$/
        if (password.test($(this).val())){
            $('#mima').html('')
            yanzen3 = true
        }else {
            $('#mima').html('请填写6-18位密码')
            yanzen3 = false
        }
    })






    $(".d-2").click(function () {

        if (yanzen1 == true && yanzen2 ==true && yanzen3 ==true) {
            $(".f-0").submit()
        }
        else {
            $("#tishi").html('登录失败');
        }

    })

})