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

    $(".f1-2-5").keyup(function () {
        console.log(111)
        console.log($.cookie("code").toLowerCase())
        if ($(this).val().toLowerCase() == $.cookie("code").toLowerCase()) {
            $("#code").html("");
            yanzen1 = true;
        }
        else {
            $("#code").html("****").css('color','red');
            yanzen1 = false;
        }

    })

    $(".d-2").click(function () {

        if (yanzen1 == true) {

            $(".f-0").submit()

        }
        else {
            $("#tishi").html("-验证码不正确,注册失败！");
        }

    })

})