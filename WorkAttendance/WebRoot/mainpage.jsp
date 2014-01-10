<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0063)https://tower.im/members/8774d468208c4a66997f7d140e9406e0/?me=1 -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>郭彧婧 - Tower</title>
	<meta charset="utf-8">
	
	<link href="./css/count.css" media="all" rel="stylesheet" type="text/css">
	<link href="./css/ZanShicss.css" media="all" rel="stylesheet" type="text/css">
	<link href="./css/nav.css" media="all" rel="stylesheet" type="text/css">
	<script src="js/user.js"></script>
	<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
</head>
<body onload="click();">
	<div class="wrapper">
		<div class="header">
			<div id='nav'>
				<div  onclick="clickDAO();"  class='yinying'>我要签到</div><div onclick="clickHis();">考勤历史</div><div onclick="clickSub();">考勤申请</div><div onclick="clickAdmin();">考勤审批</div><div onclick="clickDayManage();" id='workDayManage'>作息管理</div>
				<script>
					var localSto=window.localStorage
					if(localSto['power']==2){
						$('#workDayManage').show();
					}
					else {
						$('#workDayManage').hide();
					}
					function clickDAO(){
						
						var userid=localSto['userid'];
						location.href='signAction.action?userid='+userid;
					}
					function clickHis(){
						var localSto=window.localStorage;
						var userid=localSto['userid'];
						var departmentid=localSto['departmentid'];
						var power=localSto['power'];
						location.href='countAction.action?userid='+userid+'&&power='+power+'&&departmentid='+departmentid;
					}
					function clickSub(){
						location.href='./leave.jsp';
					}
					function clickAdmin(){
						locateToApprov();
					}
					function clickManage(){
						locateToApprov();
					}
					function clickDayManage(){
						location.href='getWorkdayAction.action';
					}
				</script>
				<a href="javascript:;" id="notification-count" class="label " title="新的通知">0</a>
			</div>
			
			<ul class="account-info">
				<li class="member-settings">
					<a class="link-member-menu" href="javascript:;" title="">
						<img class="avatar" style ='width:70px;height:70px;' src="./img/head.png" alt="">
						
					</a>
				</li>
			</ul>
		</div>



		<div class="container workspace"><div class="page sheet sheet-active sheet-root" id="page-member" data-guid="8774d468208c4a66997f7d140e9406e0" data-since="2014-01-02 08:19:08 UTC" data-page-name="郭彧婧" data-self="true" data-url="/members/8774d468208c4a66997f7d140e9406e0/?me=1"  style="min-height:500px;background:#f6f7f1 url(bg-8bed488ceb8bcd20ff2e633b62c9242c.png) repeat 0 0">

			<div class="member-info">
				<img class="avatar" alt="郭彧婧" src="./img/uh.png">
				<div class="info">
					<h2 id="username"></h2>
					<a id="userid"  class="email"  target="_blank">员工编号：SD19901221</a><br>
					<span id="departmentname" class="comment comment-easyedit" title="点击修改个人信息" >所属部门：搜索部</span>

				</div>
					
			</div>
			<p id="notification" class="notification moveout inbox-moveout"></p>
			<div class="member-data todos" style="margin-top:-20px;padding-top:20px;">

				<h3>签到/签退</h3>
				<div id="container" style="margin-top:50px">
					<ul class="options" id='optionid'>
						<li>
							<a href="" id="a">
								<big id="content">签到</big>
							</a>
						</li>
					</ul>
				</div>
				<intput type="hidden" name="gocome" id="gocome" value='<s:property value="gocome"/>'/>
			</div>
			</div>
		</div>
	</div>
</div>
	<script>
		function click(){
			var localSto=window.localStorage;
			$("#username").html(localSto['username']);
			$("#userid").html("员工编号："+localSto['userid']);
			$("#departmentname").html("所属部门："+localSto['departmentname']);
			var gocome=localSto['gocome'];
			if($("#gocome").attr("value")!=""&&$("#gocome").attr("value")!=null){
				gocome=$("#gocome").attr("value");
				if (gocome == 0) {
					$("#a").attr("href","signinAction.action?userid="+localSto['userid']);
				}else if(gocome == 1){
					$("#a").attr("href","signoutAction.action?userid="+localSto['userid']);
					$("#content").html("签退");
				}else if(gocome == 2){
					$("#a").attr("href","");
					$("#optionid").attr("class","options1");
					$("#a").removeAttr("href");
					$("#content").html("签退");
				}else if(gocome == -1){
					$("#a").attr("href","");
					$("#optionid").attr("class","options1");
					$("#a").removeAttr("href");
					$("#content").html("签到");
				}
			}else{
				
				if (gocome == 0) {
					$("#a").attr("href","signinAction.action?userid="+localSto['userid']);
				}else if(gocome == 1){
					$("#a").attr("href","signoutAction.action?userid="+localSto['userid']);
					$("#content").html("签退");
				}else if(gocome == 2){
					$("#a").attr("href","");
					$("#optionid").attr("class","options1");
					$("#a").removeAttr("href");
					$("#content").html("签退");
				}else if(gocome == -1){
					$("#a").attr("href","");
					$("#optionid").attr("class","options1");
					$("#a").removeAttr("href");
					$("#content").html("签到");
				}
			
			}
		}	
	</script>
	<div class="footer">
		© <a href="http://mycolorway.com/" target="_blank">HappyNewYear</a>
	</div>
</body>

</html>
		
	


