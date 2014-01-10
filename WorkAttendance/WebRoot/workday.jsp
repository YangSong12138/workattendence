<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!-- saved from url=(0063)https://tower.im/members/8774d468208c4a66997f7d140e9406e0/?me=1 -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>非工作日申请</title>
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
<link rel="stylesheet" href="css/kalendae.css" type="text/css" charset="utf-8">
<script src="js/kalendae.standalone.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css" media="screen">
    .kalendae span.closed {
        background:red;
    }
    #tabtitle{
    	font-size: 20px;
		font-family: "Helvetica Neue",Helvetica,Arial,"Microsoft Yahei","SimHei",Sans-serif;
		line-height: 28px;
		margin: 30px 0 0 40px !important;
		color: #84a099;
    }
    .tabtitle{
    	font-size: 15px;
		font-family: "Helvetica Neue",Helvetica,Arial,"Microsoft Yahei","SimHei",Sans-serif;
		line-height: 28px;
		margin: 30px 0 0 40px !important;
		color: #84a099;
    }
    #button{
    	font-size: 14px;
		color: #fff;
		background: #0080FF;
		display: block;
		padding: 6px 10px;
		margin: 0 10px 0 0;
		margin-top: 8px;
		border: 1px solid transparent;
		color: #fff;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
		font-size: 14px;
		cursor: pointer;
		-moz-background-clip: padding;
		-webkit-background-clip: padding-box;
		background-clip: padding-box;
    }
</style>

</head>
<body style="">
    <div class="wrapper">
    	<div class="header">
			<div id='nav'>
				<div  onclick="clickDAO();">我要签到</div><div onclick="clickHis();">考勤历史</div><div onclick="clickSub();">考勤申请</div><div onclick="clickAdmin();">考勤审批</div><div onclick="clickDayManage();" id='workDayManage' class='yinying'>作息管理</div>
				<script>
					var localSto=window.localStorage;
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
        <h3 id="tabtitle">工作日管理</h3>
		<form method="post" action="updateWorkdayAction" onsubmit="return timenull();">
		    <p class="tabtitle">点击选择非工作日:</p>
	        <input type="text" id="input1" name="workday" value="选择非工作日"  style="width:600px;margin-left:40px;">
	        <script type="text/javascript" charset="utf-8">
	            var k4 = new Kalendae.Input('input1', {
	                months:12,
	                mode:'multiple',
	                blackout: function (date) {
	                    return [1,0,0,0,0,0,1][Kalendae.moment(date).day()]; //blackout weekends
	                }
	            });
	        </script>
	        <div style="margin-left:40px;">
	        	<button type="submit" class="submit" id='button'>提交申请</button>
	        
	        	<input type="hidden" name="" id="workdayxixi" value='<s:property value="workday"/>'/>
	        </div>
        </form>
        </div>
        </div>
        
<script>

$("#input1").val($("#workdayxixi").attr("value"));
</script>

        <div class="footer">
            © <a href="http://mycolorway.com/" target="_blank">YangSong.big</a>
        </div>

    </div>

    <input type="hidden" id="d18n-enabled" value="true">

</body>
</html>