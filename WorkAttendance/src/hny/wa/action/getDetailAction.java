package hny.wa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Attendance;
import hny.wa.model.Attendance_countDetail;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.service.AttendanceService;
import hny.wa.service.UserService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

import net.sf.json.JSONArray;



public class getDetailAction extends ActionSupport {

	private AttendanceService attendanceService;
	private String userid;
	private int departmentid;
	private String result;
	private String start;
	private String end;
	
	public AttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(AttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	@Override
	public String execute() throws Exception {
		ArrayList<Attendance_countDetail> d = attendanceService.getAttendance(userid, departmentid, start, end);
		Comparator comp = (Comparator) new hny.wa.utils.Mycomparator();
        Collections.sort(d,comp);  
		JSONArray jsonArray = JSONArray.fromObject(d);
		result =jsonArray.toString();
		return SUCCESS;
	}
}
