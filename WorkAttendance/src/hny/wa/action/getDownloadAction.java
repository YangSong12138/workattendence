package hny.wa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.exel.writeExel;
import hny.wa.model.Attendance_countDetail;
import hny.wa.model.Login;
import hny.wa.service.AttendanceService;
import hny.wa.service.UserService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSONArray;



public class getDownloadAction extends ActionSupport {

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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");//设置日期格式
		String filename=df.format(new Date());
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		
	    if (path.indexOf("WEB-INF") > 0) {
	    	path = path.substring(0, path.indexOf("WEB-INF/classes"));
	    	System.out.println("路径:"+path);
	    } else {
	    	System.out.println("路径获取错误");
	    }
		
		writeExel.writeExelXiang(d, path+"history_"+filename+".xls");
		result ="history_"+filename+".xls";
		return SUCCESS;
	
	}
}
