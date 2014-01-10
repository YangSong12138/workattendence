<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<!-- saved from url=(0063)https://tower.im/members/8774d468208c4a66997f7d140e9406e0/?me=1 -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>请假/出差出勤修改</title>
	<meta charset="utf-8">

	<link href="./css/approved.css" rel="stylesheet" type="text/css">
	<link href="./css/nav.css" media="all" rel="stylesheet" type="text/css">
	<script src="js/user.js"></script>
	<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
	<style type="text/css">
	.container{font-family: "Helvetica Neue", Helvetica, Arial,"Microsoft Yahei","SimHei",Sans-serif;font-size: 14px;}
	.container .member-data table {text-align:center; border-collapse: collapse; width: 100%;color:#666666;}
	.container .member-data th, td {text-align:center; word-break: keep-all;padding: 0.25rem; border: 1px solid #ccc;}
	.container .member-data tbody tr:nth-child(odd) {background: #f9f9f9;}
	.container .member-data table a{color:#999999;}
	.container .member-data table a:hover{color:#666666; }
	#button{
    	font-size: 14px;
		color: #fff;
		background: #0080FF;
		display: block;
		padding: 2px 10px;
		margin: 0px 10px 0 40px;
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
	<script type="text/javascript">
	function is_confirm() {
		var msg = "您确定要更新考勤记录？";
		if (confirm(msg)==true){
		return true;
		}else{
		return false;
		}
	}
	</script>
</head>
<body style="">
	<div class="wrapper">
		<div class="header">
			<div id='nav'>
				<div  onclick="clickDAO();">我要签到</div><div onclick="clickHis();">考勤历史</div><div onclick="clickSub();">考勤申请</div><div onclick="clickAdmin();" class='yinying'>考勤审批</div><div onclick="clickDayManage();" id='workDayManage'>作息管理</div>
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
				<h3 style="padding:0 40px 0px;">请假/出差/补签 修改出勤表</h3>	
				<div style='display:inline-block;'><div  style='display:inline-block;' id='button' onclick='clickDe();'>个人申请历史</div></div><script>function clickDe(){location.href='./staffApplyHistoryAction?userid='+localSto['userid'];} </script>
				
				<div class="member-data todos" style="float:left;width:800px">
					<table class="approve_list"> 
						<thead> 
						<tr> 
							<th width=60 >申请人</th>
							<th width=80 >部门</th> 
						    <th width=60 >申请类型</th> 
						    <th width=90 >开始日期</th> 
						    <th width=90 >截止日期</th> 
						    <th>原因</th> 
						    <th width=90 >状态</th>
						    <th width=80 >操作</th> 
						</tr> 
						</thead> 
						<tbody>
							<s:iterator id="apply" value="applyList"  status="status">
                            	<tr>
                                        <td><s:property value="%{nameList[#status.index]}"/></td>
                                        <td><s:property value="%{departList[#status.index]}"/></td>
                                        <td>
                                         <s:if test="%{#apply.applytype==3}">出差</s:if>
										 <s:elseif test="%{#apply.applytype==2}">请假</s:elseif>
										 <s:elseif test="%{#apply.applytype==4}">补签</s:elseif>
                                    	 <%-- <s:property value="applytype"/> --%>
                                        </td>  
　　　　									<td><s:property value="starttime"/></td>  
　　　　									<td><s:property value="endtime"/></td>  
　　　　									<td><s:property value="content"/></td> 
										<td>
										<s:if test="%{#apply.state==1}">审核通过</s:if>
										<%-- <s:property value="state"/> --%>
										</td> 
                                        <td><a href="adminApprovedAction?id=<s:property value="id"/>" onclick="javascript:return is_confirm()"/>更新出勤</a></td>            
                                </tr>
                            </s:iterator >
						</tbody> 
					</table> 					
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