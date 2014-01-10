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



public class signAction extends ActionSupport {

	private UserService userService;
	private DepartmentService departmentService;
	private AttendanceService attendanceService;
	private WorkdayService workdayService;
	private int gocome;
	private String userid;
	
	public WorkdayService getWorkdayService() {
		return workdayService;
	}
	public int getGocome() {
		return gocome;
	}

	public void setGocome(int gocome) {
		this.gocome = gocome;
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
		System.out.print("sdfas");
		int departmentid=userService.getUserDepartmentid(userid);
		System.out.println(departmentid);
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
		return SUCCESS;
	}
		
}
