<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!-- saved from url=(0063)https://tower.im/members/8774d468208c4a66997f7d140e9406e0/?me=1 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>请假/出差申请</title>
	<meta charset="utf-8">
	<link href="./css/count.css" media="all" rel="stylesheet" type="text/css">
	<link href="./css/approved.css" rel="stylesheet" type="text/css">
	<link href="./css/nav.css" media="all" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/manhuaDate.1.0.css">
<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./js/manhuaDate.1.0.js"></script>
	<script src="js/user.js"></script>
<script type="text/javascript">
$(function (){
	$("input.time_start").manhuaDate({					       
		Event : "click",//可选				       
		Left : 0,//弹出时间停靠的左边位置
		Top : -16,//弹出时间停靠的顶部边位置
		fuhao : "-",//日期连接符默认为-
		isTime : false,//是否开启时间值默认为false
		beginY : 2010,//年份的开始默认为1949
		endY :2015//年份的结束默认为2049
	});
	$("input.time_end").manhuaDate({					       
		Event : "click",//可选				       
		Left : 0,//弹出时间停靠的左边位置
		Top : -16,//弹出时间停靠的顶部边位置
		fuhao : "-",//日期连接符默认为-
		isTime : false,//是否开启时间值默认为false
		beginY : 2010,//年份的开始默认为1949
		endY :2015//年份的结束默认为2049
	});
	
});
</script>
<script  type="text/javascript">
	function timenull(){
		if(!document.getElementById("startTime").value||!document.getElementById("endTime").value){
			alert("请选择时间！！！");
			return false;
		}else{
			return true;
		}
		if(!document.getElementById("content").value){
			alert("请填写原因！！！");
			return false;
		}else{
			return true;
		}
	}
</script>
<style type="text/css">
.container .member-data .control-label{font-size:16px;color: #84a099;font-family: "Helvetica Neue", Helvetica, Arial,"Microsoft Yahei","SimHei",Sans-serif;display: inline-block;padding-top: 5px; padding-bottom: 3px;}
.container .member-data .submit{font-size: 14px; color: #fff;background: #0080FF; display: block;padding: 6px 10px;margin: 0 10px 0 0;margin-top:8px; border: 1px solid transparent;color: #fff;-moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;font-size: 14px;cursor: pointer;-moz-background-clip: padding;-webkit-background-clip: padding-box;background-clip: padding-box;
}
.container .member-data .time_end, .time_start{background:url(./css/dateIco.png) no-repeat right center;}
.container .member-data .select_style{width: 244px;height:36px; margin-top: 8px;margin-bottom: 5px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px; border-radius:5px; box-shadow: none; overflow: hidden;}
.container .member-data .apply_type{width: 264px;height: 36px;font-size: 14px; border: 0px; font-family: "Helvetica Neue", Helvetica,Arial,"Microsoft Yahei","SimHei",Sans-serif;}

</style>
</head>
<body style="">
	<div class="wrapper">
		<div class="header">
			<div id='nav'>
				<div  onclick="clickDAO();">我要签到</div><div onclick="clickHis();">考勤历史</div><div onclick="clickSub();" class='yinying'>考勤申请</div><div onclick="clickAdmin();">考勤审批</div><div onclick="clickDayManage();" id='workDayManage'>作息管理</div>
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


		<div class="container workspace">
			<div class="page sheet sheet-active sheet-root" id="page-member">	
			<h3 style="padding:0 40px 0px;">请假/出差/补签申请</h3>	
				<div class="member-data todos" style="float:left;width:800px">
				   <s:form method="post" action="SubmitApplyAction" onsubmit="return timenull();">
					<label class="control-label" for="input" style="width:200px" >起始时间</label>
					<input id="startTime" name="startTime" class="time_start" type="text"  readonly="true" />
					<label class="control-label" for="input">结束时间</label>
					<input id="endTime" name="endTime" class="time_end" type="text"  readonly="true" />
					<label class="control-label" for="input">类型</label><br>
					<div class="select_style">
						<select name="applyType" class="apply_type" >
							<option value=2>请假</option>
							<option value=3>出差</option>
							<option value=4>补签</option>
						</select>
					</div>
					<label class="control-label" for="input">原因</label>
					<textarea id="content" name="content" class="input-xlarge" style="width:500px;height:100px"></textarea>
					<button type="submit" class="submit" >提交申请</button>
					<input id="userid" name="userid" type="hidden" value=""/>
					
					<!--通过“#userid”找到上面的id值“userid”，将它的value值赋值为localSto['userid'] -->
					<script>
						var localSto=window.localStorage;
						$("#username").html(localSto['username']);
						$("#userid").html("员工编号："+localSto['userid']);
						$("#departmentname").html("所属部门："+localSto['departmentname']);
						$("#userid").val(localSto['userid']); 
						$("#optionid").attr("class","options1");
					</script>
				<s:token></s:token>
				<s:if test="result=='success'"><script>alert("操作成功！");</script></s:if>
				<s:elseif test="result=='error'"><script>alert("操作失败，时间有问题，请重新尝试！");</script> </s:elseif>

				  </s:form>
				 
				</div>
			</div>
		</div>

		<div class="footer">
			© <a href="http://mycolorway.com/" target="_blank">YangSong.big</a>
		</div>

	</div>

	<input type="hidden" id="d18n-enabled" value="true">

</body>
</html>