<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<title>登录 - Tower</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="css/count.css" media="all" rel="stylesheet" type="text/css" />
	<script src="js/user.js"></script>
	<script src="js/jquery-1.7.1.min.js"></script>
	
</head>
<body>
	<div class="wrapper">	
		<div class="page" id="page-signin">
			<div class="sign-page">
				<div class="hd">
					<h1 class="logo">tower.im</h1>
				</div>

				<div class="bd">
					<form class="form" action="loginAction" method="post" data-remote="true" novalidate>
						<div class="form-item">
							<div class="form-field">
								<input type="userid" tabindex="1" name="userid" id="userid" placeholder="登录员工编号"data-validate-msg="请填写你的员工编号" autofocus />
							</div>
						</div>

						<div class="form-item">
							<div class="form-field">
								<input type="password" tabindex="2" name="password" id="password" placeholder="密码" data-validate="required;length:6" data-validate-msg="请填写您的登录密码" />
							</div>
						</div>

						<div class="form-item sign-in-btn">
							<button type="button" tabindex="3" id="btn-signin" class="btn btn-primary btn-submit" data-disable-with="正在登录..." data-goto="/launchpad/" onClick="login();">登录</button>
							
						</div>
					</form>	
				</div>

				<div class="ft">
					&copy; HappyNewYear
				</div>
			</div>
		</div>
	</div>
</body>
</html>
    