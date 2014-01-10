package hny.wa.action;
/**
*
* @author yangsong
* 
*/
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Attendance;
import hny.wa.model.Login;
import hny.wa.service.AttendanceService;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;
import hny.wa.service.WorkdayService;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;



public class LoginAction extends ActionSupport {

	private UserService userService;
	private DepartmentService departmentService;
	private AttendanceService attendanceService;
	private WorkdayService workdayService;
	private String userid;
	private String password;
	private String result;
	private String name;
	
	public WorkdayService getWorkdayService() {
		return workdayService;
	}

	public void setWorkdayService(WorkdayService workdayService) {
		this.workdayService = workdayService;
	}
	public AttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(AttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String execute() throws Exception {
		if (userid == null || password == null || userid.equals("") || password.equals("")) {
			result = "{suc:0, msg:'请输入您的用户名、密码...'}";
			return ERROR;
		} else {
			Map session = ActionContext.getContext().getSession();
			System.out.print("sdfas");
			Login u = userService.login(userid, password);
			if (u== null) {
				result = "{\"suc\":0}";
				return SUCCESS;
			}else{
				name=u.getUserid();
				String username=userService.getUserName(userid);
				int power=userService.getUserPower(userid);
				int departmentid=userService.getUserDepartmentid(userid);
				System.out.println(departmentid);
				String departmentname=departmentService.getDepartmentName(departmentid);
				int gocome;
				Calendar cal = Calendar.getInstance();
		        int week = cal.get(Calendar.DAY_OF_WEEK);
		        int month = cal.get(Calendar.MONTH) + 1;
		        int year = cal.get(Calendar.YEAR);
		        int day =  cal.get(Calendar.DATE);
		        String time="";
		        if(month<10||day<10){
		        	if(month<10&&day<10){
		        		time="0"+month+"/"+"0"+day+"/"+year;
		        	}else if(month<10){
		        		time="0"+month+"/"+day+"/"+year;
		        	}else if(day<10){
		        		time=month+"/"+"0"+day+"/"+year;
		        	}
		        }else{
		        	time=month+"/"+day+"/"+year;
		        }
		        if(week!=1 && week!=7 && workdayService.isWorkday(time)){
					if(attendanceService.getComestate(userid)==-1){
						gocome=0;
					}else if(attendanceService.getGostate(userid)==-1){
						gocome=1;
					}else{
						gocome=2;
					}
		        }else{
		        	gocome=-1;
		        }
				System.out.println(departmentname);
				result = "{\"suc\":1, \"username\":\""+username+"\",\"power\":"+power+",\"userid\":"+"\""
				+userid+"\""+",\"departmentname\":"+"\""+departmentname+"\""+",\"departmentid\":"
						+departmentid+",\"gocome\":"+gocome+"}";
				session.put("userid", u.getUserid());
				}
				return SUCCESS;
			}
	}
}
