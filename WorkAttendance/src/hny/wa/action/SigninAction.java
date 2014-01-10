package hny.wa.action;
/**
*
* @author yangsong
* 
*/
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Login;
import hny.wa.service.AttendanceService;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;

import java.util.Map;



public class SigninAction extends ActionSupport {

	private UserService userService;
	private DepartmentService departmentService;
	private AttendanceService attendanceService;
	private String userid;
	private String result;
	private int gocome;
	
	public int getGocome() {
		return gocome;
	}

	public void setGocome(int gocome) {
		this.gocome = gocome;
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
		attendanceService.setTodayCometime(userid, attendanceService.getTodayId(userid));
		gocome=1;
		return SUCCESS;
	}
}
