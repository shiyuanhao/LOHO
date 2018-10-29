<?php
header('Access-Control-Allow-Origin: *');

$user = $_POST["user"];
$password = $_POST["password"];

$conn = new mysqli("127.0.0.1", "root", "", "mydb") or die("连接失败");

$sql = "select * from register where user='$user'and password='$password'";
$result = $conn->query($sql);
if($result && $result->num_rows > 0){
    $arr = array("status"=>1, "msg"=>"登录成功！");
    echo json_encode($arr);
}
else{
    $arr = array("status"=>0, "msg"=>"用户名或密码错误，请检查！");
    echo json_encode($arr);
}

$conn->close();







