<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人考勤历史 - Tower</title>
	<meta charset="utf-8">
	
	<link href="./css/count.css" media="all" rel="stylesheet" type="text/css">
	<link href="./css/nav.css" media="all" rel="stylesheet" type="text/css">
	<script src="js/user.js"></script>
		<link href="./css/count.css" media="all" rel="stylesheet" type="text/css">
	<link href="./css/nav.css" media="all" rel="stylesheet" type="text/css">
	<script src="js/user.js"></script>
	<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
	<style type="text/css">
	.container .member-data .control-label{font-size:16px;color: #84a099;font-family: "Helvetica Neue", Helvetica, Arial,"Microsoft Yahei","SimHei",Sans-serif;display: inline-block;padding-top: 5px; padding-bottom: 3px;}
	.container .member-data .submit{font-size: 14px; color: #fff;background: #0080FF; display: block;padding: 6px 10px;margin: 0 10px 0 0;margin-top:8px; border: 1px solid transparent;color: #fff;-moz-border-radius: 5px;-webkit-border-radius: 5px;border-radius: 5px;font-size: 14px;cursor: pointer;-moz-background-clip: padding;-webkit-background-clip: padding-box;background-clip: padding-box;
	}
	.container .member-data .time_end, .time_start{background:url(./css/dateIco.png) no-repeat right center;}
	.container .member-data .select_style{width: 244px;height:36px; margin-top: 8px;margin-bottom: 5px;border: 1px solid #ccc;-moz-border-radius: 5px;-webkit-border-radius: 5px; border-radius:5px; box-shadow: none; overflow: hidden;}
	.container .member-data .apply_type{width: 264px;height: 36px;font-size: 14px; border: 0px; font-family: "Helvetica Neue", Helvetica,Arial,"Microsoft Yahei","SimHei",Sans-serif;}
	#button{
    	font-size: 14px;
		color: #fff;
		background: #0080FF;
		display: block;
		padding: 2px 10px;
		margin: 30px 10px 0 450px;
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
		<script type="text/javascript">
			function getdepartment(departmentid){
				var localSto=window.localStorage;
				var userid=localSto['userid'];
				var power=localSto['power'];
		        document.location.href='countAction.action?userid='+userid+'&&power='+power+'&&departmentid='+departmentid;
		    }	
		   	function selectInput(choose){
		   		departmentid=choose.options[choose.selectedIndex].id; 
		   		var localSto=window.localStorage;
				var userid=localSto['userid'];
				var power=localSto['power'];
		        document.location.href='countAction.action?userid='+userid+'&&power='+power+'&&departmentid='+departmentid;
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



<div class="container workspace"><div class="page sheet sheet-active sheet-root" id="page-team-stats" data-page-name="团队统计" data-nocache="" data-url="/teams/31d4bd5c62704d69b0e007c5eec2e680/stats/">
		<div class="page-inner">
			<div class="title" id='mytitle'>
				<h3 id="workname">中国好部门 <s:property value="departmentnameN"/> 的统计</h3>
				<h3>
					<div id='mydiv' Style="margin-top:-2px;margin-left:10px">
						<select onchange="selectInput(this)">
							<s:iterator id="department" value="departmentlist"  status="status">
							
								<s:if test="%{#department.departmentid != departmentidN}">
									<option id='<s:property value="departmentid"/>' onclick="alert();"><s:property value="departmentname"/></option>
								</s:if>
								<s:else>
									<option id='<s:property value="departmentid"/>' onclick="alert();"  selected="selected"><s:property value="departmentname"/></option>
								</s:else>
							</s:iterator >
						</select>
					</div>
				</h3>
				<div style='display:inline-block;'><div  style='display:inline-block;' id='button' onclick='clickDe();'>详细统计</div></div><script>function clickDe(){location.href='./countDetail.jsp';} </script>
				<!--<p class="date">截止 2014年01月01日</p>-->
			</div>
			<script>
					var localSto=window.localStorage;
					var pp=localSto['power'];
					var username=localSto['username'];
					if(pp==0){
						$('#mydiv').hide();
						$("#workname").html("中国好员工 "+username+" 的统计");
						
					}else if(pp==1){
						$('#mydiv').hide();
					}
					else{
						$('#mydiv').show();
					}
			</script>
			<div class="todo-stats">
				<ul class="summary">
					<li class="total">
						<span class="name" >上月上班天数</span>
						<span class="count" id="normalday"><s:property value="normalday"/></span>
					</li>
					<li class="delay">
						<span class="name">迟到/早退/旷工天数</span>
						<span class="count" id="delayday"><s:property value="delayday"/></span>
					</li>
					<li class="ratio last">
						<span class="name">正常出勤率%</span>
						<span class="count" id="ratioday"><s:property value="ratioday"/></span>
					</li>
				</ul>

				<div class="member-stats">
					<table class="stats-table">
						<thead>
							<tr>
								<th class="member">成员</th>
								<th class="todo desc">出勤情况</th>
								<th class="ratio">正常出勤率%</th>
							</tr>
						</thead>
						<s:iterator id="count" value="countlist"  status="status">
                            <tr>
	                            <td class="member">
	                            
	                                <img src="./img/head.png" class="avatar">
	                               
	                                <a href="./countDetail.jsp?detailuser='<s:property value="userid"/>'" class="name">
	                                    <span class="name"><s:property value="username"/></span>
	                                </a>
	                            </td>
	                            <td class="todo">
	                                <div class="stat">
	                                    <span class="count"><s:property value="normalday"/></span>
	                                    <div class="bar" style="width: 100%">
											<span class="count2"><s:property value="delayday"/></span>
	                                        <div class="inner-bar" style="width: 40%">
	                                        </div>
	                                        <input type="hidden" class="vv" value='<s:property value="radioday1"/>'/>
	                                    </div>
	                                </div>
	                            </td>
	                            <td class="ratio">
	                                <span><s:property value="radioday"/>%</span>
	                            </td>
	                            
	                        </tr>
                        </s:iterator >
			
					</table>
				</div>
			</div>

		</div>
		
	</div>

	</div>
    <div class="footer">
        © <a href="http://mycolorway.com/" target="_blank">HappyNewYear</a>
    </div>

    <script>
    	$('.inner-bar').each(function(){
    		$(this).attr('style',"width: "+$(this).parent().children('.vv').attr('value')+"%");
    	});
    </script>
</body>
	

