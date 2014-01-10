function login() {

	var url = "loginAction";

	var userid = $("#userid").val(); //get user's name
	var password = $("#password").val(); //get user's password

	var json_user = {
		userid : userid,
		password : password
	};
	if (userid == ""||userid == null) {
		alert("请填写员工编号");
	} else if (password == ""||userid == null) {
		alert("请填写员工密码");
	} else {
		
		$.post(url, json_user, callback, "json");
		function callback(json) {
			var json_object =eval("("+json+")");;
			var suc = json_object.suc;
			
			if (suc == 0) {
				alert("登陆失败啦!!!,用户名密码错误!!!");
			} else {
				var power=json_object.power;
				var username=json_object.username;
				var userid=json_object.userid;
				var departmentid=json_object.departmentid;
				var departmentname=json_object.departmentname;
				var gocome=json_object.gocome;
				var localSto=window.localStorage;
				localSto['power']=power;
				localSto['username']=username;
				localSto['userid']=userid;
				localSto['departmentid']=departmentid;
				localSto['departmentname']=departmentname;
				localSto['gocome']=gocome;
				
				window.location.href = "mainpage.jsp";
				
			}
		}
	}
}
function locateToApprov(){
	var localSto=window.localStorage;
	if(localSto['power']==0){
		location.href="./staffApplyHistoryAction?userid="+localSto['userid'];
	}
	else if(localSto['power']==1){
		location.href="./applyAction?departmentid="+localSto['departmentid'];
	}
	else{
		location.href="./applyAdminAction";
	}
}