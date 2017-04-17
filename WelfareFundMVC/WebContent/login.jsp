<%@page import="com.mfu.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>กรุณาลงชื่อเข้าใช้</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
        
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/angular.min.js"></script>
<!-- Font Awesome -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
<style>
	.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}

.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #ddd;
    border-radius:10px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}
</style>
</head>
<body style="background-color:#eee;">
	<div class="container">
	<br><br><br><br>
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				
				<div class="account-wall">
				<center>
					<img src="assets/images/logo.png" style="width:auto;height:200px;">
					</center>
						<input type="text" class="form-control" id="username" name="username" placeholder="ชื่อผู้ใช้งาน" autofocus><br>
						<input type="password" class="form-control" id="password" name="password" placeholder="รหัสผ่าน"><br>
						<div id="errorMessage" class="text-danger"></div>
						<button class="btn btn-lg btn-primary btn-block" style="font-size:12pt;" type="button" onclick="login()">
							ลงชื่อเข้าใช้</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function login(){
			var username = $("#username").val();
			var password = $("#password").val();
			var data = {
				username : username,
				password : password
			};
			$.post("loginStaff.do",data).then(function(response){
				console.log(response);
				window.location.href = "index.jsp";
			},function(error){
				alert(error);
			});
		}
	</script>
</body>
</html>