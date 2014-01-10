package hny.wa.model;

public class Attendance {
	int id;
	String userid;
	int departmentid;
	String cometime;
	String gotime;
	int  gostate;
	int  comestate;
	int  state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getCometime() {
		return cometime;
	}
	public void setCometime(String cometime) {
		this.cometime = cometime;
	}
	public String getGotime() {
		return gotime;
	}
	public void setGotime(String gotime) {
		this.gotime = gotime;
	}
	public int getGostate() {
		return gostate;
	}
	public void setGostate(int gostate) {
		this.gostate = gostate;
	}
	public int getComestate() {
		return comestate;
	}
	public void setComestate(int comestate) {
		this.comestate = comestate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
