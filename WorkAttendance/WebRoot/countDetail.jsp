<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>团队统计 - Tower</title>
	<meta charset="utf-8">
	
	<link href="./css/count.css" media="all" rel="stylesheet" type="text/css">
    <link href="./css/common.min.css" media="all" rel="stylesheet" type="text/css">
    <link href="./css/nav.css" media="all" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
    
    <script type="text/javascript" src="./js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="./js/manhuaDate.1.0.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/manhuaDate.1.0.css">
	<link rel="stylesheet" type="text/css" href="./css/countDetail.css">
	<script src="js/user.js"></script>
</head>
<body>
	
<div class="header">
	<div id='nav'>
		<div  onclick="clickDAO();">我要签到</div><div onclick="clickHis();"  class='yinying'>考勤历史</div><div onclick="clickSub();">考勤申请</div><div onclick="clickAdmin();">考勤审批</div><div onclick="clickDayManage();" id='workDayManage'>作息管理</div>
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
		<a href="javascript:void(0);" id="notification-count" class="label " title="新的通知">0</a>
	</div>
	
	<ul class="account-info">
		<li class="member-settings">
			<a class="link-member-menu" href="javascript:;" title="">
				<img class="avatar" style ='width:70px;height:70px;' src="./img/head.png" alt="">
				
			</a>
		</li>
	</ul>

	
</div>



<div class=" workspace"><div class="page sheet sheet-active sheet-root" id="page-team-stats" data-page-name="团队统计" data-nocache="" data-url="/teams/31d4bd5c62704d69b0e007c5eec2e680/stats/">
		<div class="page-inner">
			<div class="title">
				<h3>中国好员工 考勤自助搜索</h3>
			<!--  <p class="date">截止 2014年01月01日</p>-->
			</div>
		    <div id='search' style="display:inline-block;">
				<div style="display:inline-block;" id="sear_depart">
					<p style="display:inline-block;margin-right:10px;">选择部门: </p>
					<ul class="nav"  style="display:inline-block;">
						<li class="dropdown"> 
							<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" id='depart' name='0'>全部 <b class="caret"></b></a> 
							<ul class="dropdown-menu" id='departs'> 
								
							</ul> 
						</li>
					</ul>
				</div>
				<div style="display:inline-block;" id="sear_clert">
					<p style="display:inline-block;margin-right:10px;margin-left:10px;">选择员工: </p>
					<ul class="nav"  style="display:inline-block;">
						<li class="dropdown"> 
							<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" id='clert' name='_0'>全部 <b class="caret"></b></a> 
							<ul class="dropdown-menu" role="menu" aria-labelledby="drop1" id='clerts'> 
								<li role="presentation"> 
									<a role="menuitem" tabindex="-1" href="javascript:void(0);" onclick='clickClert(this);'>全部<b class="caret"></b></a> 
								</li> 
								
							</ul> 
						</li>
					</ul>
				</div>
                <p style="display:inline-block;margin-right:20px;margin-left:20px;">选择搜索时间范围: </p>
                <input id="start" class="time_start" type="text" style="width:90px ;"> - <input id="end" class="time_start" type="text"  style="width:90px ;">
               
	            <input type="button" value="搜索" class="btn btn-mini btn-danger " style="margin-top:-11px;margin-left:10px; color:grey;" onclick="clickSear();">
	            <input type="button" value="下载" class="btn btn-mini btn-danger " style="margin-top:-11px;margin-left:1px; color:grey;" onclick="clickDown();" id='down'>
		    
			
			
			</div>
			<div>
				<table class='tt' id='mytable'>
					<tr class='head'>
						<td>员工ID</td>
						<td>员工姓名</td>
						<td>所属部门</td>
						<td>日期</td>
						<td>签到时间</td>
						<td>签退时间</td>
						<td>考勤情况</td>
						
					</tr>
					
				</table>
			</div>
		</div>
		
	</div>
	</div>
    <div class="footer">
        © <a href="http://mycolorway.com/" target="_blank">HappyNewYear</a>
    </div>
    <script>
		clickSearDefault();
		//获取所有部门
		var url = "getDepartsAction";
		$.post(url, "", getAllDeparts, "");
		function getAllDeparts(json) {
			var json_object =$.parseJSON(json);
			var text="";
			text+="<li> <a href='javascript:void(0);' onclick='clickDepart(this);' name='0'>全部<b class='caret'></b></a> </li>";
			for(var i=0;i<json_object.length;i++){
				text+="<li> <a href='javascript:void(0);' onclick='clickDepart(this);' name='"+json_object[i].departmentid+"'>"+json_object[i].departmentname+"<b class='caret'></b></a> </li>";
			}
			$('#departs').html(text);
			
		}
		
		//权限 划分
		var localSto=window.localStorage;
		if(localSto["power"]==0){
			$('#down').hide();
			$('#sear_depart').hide();
			$('#sear_clert').hide();
			$('#depart').attr("name",localSto["departmentid"]);
			$('#clert').attr("name",localSto["userid"]);
		}
		else if(localSto["power"]==1){
			$('#down').hide();
			$('#sear_depart').hide();
			$('#sear_clert').show();
			$('#depart').attr("name",localSto["departmentid"]);
			
			var url = "getClertsAction";
			
			var json = {
				departmentid : localSto["departmentid"]
				
			};
			$.post(url, json, callback, "json");
			
			function callback(json) {
				var json_object =$.parseJSON(json);
				var text="";
				text+="<li > <a  href='javascript:void(0);' onclick='clickClert(this);' name='_0'>全部<b class='caret'></b></a> </li> ";
				for(var i=0;i<json_object.length;i++){
					text+="<li > <a  href='javascript:void(0);' onclick='clickClert(this);' name='"+json_object[i].userid+"'>"+json_object[i].username+"<b class='caret'></b></a> </li> ";
				
				}
				$('#clerts').html(text);
			}
			
		}
		else if(localSto["power"]==2){
			$('#down').show();
			$('#sear_depart').show();
			$('#sear_clert').show();
		}
		
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

        function clickDepart(gg){
            $('#depart').html($(gg).html());
			
			$('#depart').attr("name",$(gg).attr("name"));
			
			$('#clert').html("全部<b class=\"caret\"></b>");
			$('#clert').attr("name","_0");
			var url = "getClertsAction";
			var op=gg.name;
			var json = {
				departmentid : op
				
			};
			$.post(url, json, callback, "json");
			
			function callback(json) {
				var json_object =$.parseJSON(json);
				var text="";
				text+="<li > <a  href='javascript:void(0);' onclick='clickClert(this);' name='_0'>全部<b class='caret'></b></a> </li> ";
				for(var i=0;i<json_object.length;i++){
					text+="<li > <a  href='javascript:void(0);' onclick='clickClert(this);' name='"+json_object[i].userid+"'>"+json_object[i].username+"<b class='caret'></b></a> </li> ";
				
				}
				$('#clerts').html(text);
			}
        }
		function clickClert(gg){
            $('#clert').html($(gg).html());
			$('#clert').attr("name",$(gg).attr("name"));
        }
		function clickSear(){
           
			var url = "getDetailAction";
			
			var json = {
				departmentid : $('#depart').attr("name"),
				userid : $('#clert').attr("name"),
				start:$('#start').val(),
				end:$('#end').val()+" 23:59:59"
			};
			if(($('#start').val()=="")||($('#end').val()=="")){
				alert('请输入查询时间范围');
				return;
			}
			
			$.post(url, json, callback, "json");
			
			function callback(json) {
				var text="";
				if((json==null)||(json=="[null]")){
					text+="<tr class='head'><td>员工ID</td><td>员工姓名</td><td>所属部门</td><td>日期</td><td>签到时间</td><td>签退时间</td><td>考勤情况</td></tr>";
					
				}
				else{
					var json_object =$.parseJSON(json);
					
					text+="<tr class='head'><td>员工ID</td><td>员工姓名</td><td>所属部门</td><td>日期</td><td>签到时间</td><td>签退时间</td><td>考勤情况</td></tr>";
					
					for(var i=0;i<json_object.length;i++){
						
						var mystate="";
						if(json_object[i].state=='0'){
							
							if((json_object[i].comestate=='1')&&(json_object[i].gostate=='1')){
								mystate="<td class='not'>迟到且早退</td>";
							}
							else if(json_object[i].gostate=='1'){
								mystate="<td class='early'>早退</td>";
							}
							else if(json_object[i].comestate=='1'){
								mystate="<td class='late'>迟到</td>";
							}
							else {
								mystate="<td class='normal'>正常</td>";
							}
						}
						else if(json_object[i].state=='1'){
							mystate="<td class='not'>缺勤</td>";
						}
						else if(json_object[i].state=='2'){
							mystate="<td class='normal'>请假</td>";
						}
						else if(json_object[i].state=='3'){
							mystate="<td class='normal'>出差</td>";
						}
						else if(json_object[i].state=='4'){
							mystate="<td class='normal'>后补</td>";
						}
						text+="<tr><td>"+json_object[i].userid+"</td><td>"+json_object[i].username+"</td><td>"+json_object[i].departmentname+"</td><td>"+json_object[i].cometime.substring(0,10)+"</td><td>"+json_object[i].cometime+"</td><td>"+json_object[i].gotime+"</td>"+mystate+"</tr>";
					
					}
				}
				$('#mytable').html(text);
			}
        }
		function clickSearDefault(){
            var userid="";
			var webT = location.href;
			if(webT.indexOf('?')==-1){
				userid=$('#clert').attr("name");
			}
			else{
				userid=webT.substring(webT.indexOf("='")+2,webT.length);
				userid=userid.substring(0,userid.length-1);
			}
			
			var url = "getDetailAction";
			var tt=new Date();
			var s = tt.getFullYear() + "-" + (tt.getMonth() +1) + "-1" ;
			var e = tt.getFullYear() + "-" + (tt.getMonth() + 1) + "-" + tt.getDate()+" 23:59:59";
			$("#start").val(s);
			$("#end").val(e.substring(0,e.indexOf(" ")));
			var json = {
				departmentid : $('#depart').attr("name"),
				userid : userid,
				start:s,
				end:e
			};
			$.post(url, json, callback, "json");
			
			function callback(json) {
				var text="";
				if((json==null)||(json=="[null]")){
					text+="<tr class='head'><td>员工ID</td><td>员工姓名</td><td>所属部门</td><td>日期</td><td>签到时间</td><td>签退时间</td><td>考勤情况</td></tr>";
					
				}
				else{
					var json_object =$.parseJSON(json);
					
					text+="<tr class='head'><td>员工ID</td><td>员工姓名</td><td>所属部门</td><td>日期</td><td>签到时间</td><td>签退时间</td><td>考勤情况</td></tr>";
					
					for(var i=0;i<json_object.length;i++){
						
						var mystate="";
						if(json_object[i].state=='0'){
							
							if((json_object[i].comestate=='1')&&(json_object[i].gostate=='1')){
								mystate="<td class='not'>迟到且早退</td>";
							}
							else if(json_object[i].gostate=='1'){
								mystate="<td class='early'>早退</td>";
							}
							else if(json_object[i].comestate=='1'){
								mystate="<td class='late'>迟到</td>";
							}
							else {
								mystate="<td class='normal'>正常</td>";
							}
						}
						else if(json_object[i].state=='1'){
							mystate="<td class='not'>缺勤</td>";
						}
						else if(json_object[i].state=='2'){
							mystate="<td class='normal'>请假</td>";
						}
						else if(json_object[i].state=='3'){
							mystate="<td class='normal'>出差</td>";
						}
						else if(json_object[i].state=='4'){
							mystate="<td class='normal'>后补</td>";
						}
						text+="<tr><td>"+json_object[i].userid+"</td><td>"+json_object[i].username+"</td><td>"+json_object[i].departmentname+"</td><td>"+json_object[i].cometime.substring(0,10)+"</td><td>"+json_object[i].cometime+"</td><td>"+json_object[i].gotime+"</td>"+mystate+"</tr>";
					
					}
				}
				$('#mytable').html(text);
			}
        }
		function clickDown(){
			var url = "getDownloadAction";
			var json = {
				departmentid : $('#depart').attr("name"),
				userid : $('#clert').attr("name"),
				start:$('#start').val(),
				end:$('#end').val()
			};
			$.post(url, json, callback, "json");
			
			function callback(json) {
				window.location.href="./"+json;
			}
        }
    </script>
</body>
	

