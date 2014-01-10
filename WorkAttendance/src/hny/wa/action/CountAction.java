package hny.wa.action;
/**
*
* @author yangsong
* 
*/

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Attendance;
import hny.wa.model.Count;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;
import hny.wa.service.AttendanceService;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;



public class CountAction extends ActionSupport {

	private UserService userService;
	private DepartmentService departmentService;
	private AttendanceService attendanceService;
	private String userid;
	private String username;
	private int power;
	private int delayday;
	private double ratioday;
	private int normalday;
	private List<Count> countlist;
	private int departmentid;
	private int departmentidN;
	private String departmentnameN;
	private List<Department> departmentlist;
	
	public int getDepartmentidN() {
		return departmentidN;
	}

	public void setDepartmentidN(int departmentidN) {
		this.departmentidN = departmentidN;
	}

	public String getDepartmentnameN() {
		return departmentnameN;
	}

	public void setDepartmentnameN(String departmentnameN) {
		this.departmentnameN = departmentnameN;
	}

	public List<Department> getDepartmentlist() {
		return departmentlist;
	}

	public void setDepartmentlist(List<Department> departmentlist) {
		this.departmentlist = departmentlist;
	}

	public int getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}

	public List<Count> getCountlist() {
		return countlist;
	}

	public void setCountlist(List<Count> countlist) {
		this.countlist = countlist;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getDelayday() {
		return delayday;
	}

	public void setDelayday(int delayday) {
		this.delayday = delayday;
	}

	public double getRatioday() {
		return ratioday;
	}

	public void setRatioday(double ratioday) {
		this.ratioday = ratioday;
	}

	public int getNormalday() {
		return normalday;
	}

	public void setNormalday(int normalday) {
		this.normalday = normalday;
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

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	@Override
	public String execute() throws Exception {
		countlist=new ArrayList<Count>();
		departmentidN=departmentid;
		
		if(power==0){
			List<User> userlist=userService.getUserByDepartmentid(departmentid);
			normalday=attendanceService.getTotalDayP(userid);
			delayday=attendanceService.getNoNormalDayP(userid);
			ratioday=0;
			if(normalday!=0){
				ratioday=(normalday-delayday)*100/normalday;
			}
			username=userService.getUserName(userid);
			Count count=new Count();
			int normalday1=attendanceService.getTotalDayP(userid);
			int delayday1=attendanceService.getNoNormalDayP(userid);
			double ratioday1=0;
			if(normalday1!=0){
				ratioday1=(normalday1-delayday1)*100/normalday1;
			}
			count.setUserid(userid);
			count.setUsername(username);
			count.setDelayday(delayday1);
			count.setNormalday(normalday1-delayday1);
			count.setRadioday(ratioday1);
			count.setRadioday1(100-ratioday1);
			System.out.println(count.getRadioday1()+"2");
			countlist.add(count);
			
			departmentnameN=departmentService.getDepartmentName(departmentid);
		}else if(power==1){
			countlist.clear();
			List<User> userlist=userService.getUserByDepartmentid(departmentid);
			System.out.println(userlist.size()+"sdfdsafsadf");
			normalday=attendanceService.getTotalDayD(departmentid);
			delayday=attendanceService.getNoNormalDayD(departmentid);
			ratioday=0;
			if(normalday!=0){
				ratioday=(normalday-delayday)*100/normalday;
			}
			for(int i=0;i<userlist.size();i++){
				Count count=new Count();
				int normalday1=attendanceService.getTotalDayP(userlist.get(i).getUserid());
				int delayday1=attendanceService.getNoNormalDayP(userlist.get(i).getUserid());
				System.out.println(userlist.size()+userlist.get(i).getUsername());
				double ratioday1=0;
				if(normalday1!=0){
					ratioday1=(normalday1-delayday1)*100/normalday1;
				}
				count.setUserid(userlist.get(i).getUserid());
				count.setUsername(userlist.get(i).getUsername());
				count.setDelayday(delayday1);
				count.setNormalday(normalday1-delayday1);
				count.setRadioday(ratioday1);
				count.setRadioday1(100-ratioday1);
				System.out.println(count.getRadioday1()+"2");
				countlist.add(count);
			}
			departmentnameN=departmentService.getDepartmentName(departmentid);
		}else if(power==2){
			departmentlist=departmentService.getDepartmentAll();
			departmentnameN=departmentService.getDepartmentName(departmentid);
			List<User> userlist=userService.getUserByDepartmentid(departmentid);
			System.out.println(userlist.size()+"sdfdsafsadf");
			normalday=attendanceService.getTotalDayD(departmentid);
			delayday=attendanceService.getNoNormalDayD(departmentid);
			ratioday=0;
			if(normalday!=0){
				ratioday=(normalday-delayday)*100/normalday;
			}
			for(int i=0;i<userlist.size();i++){
				Count count=new Count();
				int normalday1=attendanceService.getTotalDayP(userlist.get(i).getUserid());
				
				int delayday1=attendanceService.getNoNormalDayP(userlist.get(i).getUserid());
				System.out.println(userlist.size()+userlist.get(i).getUsername());
				double ratioday1=0;
				if(normalday1!=0){
					ratioday1=(normalday1-delayday1)*100/normalday1;
				}
				
				count.setUserid(userlist.get(i).getUserid());
				count.setUsername(userlist.get(i).getUsername());
				count.setDelayday(delayday1);
				count.setNormalday(normalday1-delayday1);
				count.setRadioday(ratioday1);
				count.setRadioday1(100-ratioday1);
				System.out.println(count.getRadioday1()+"2");
				countlist.add(count);
			}
		}
		return SUCCESS;
	}
}
