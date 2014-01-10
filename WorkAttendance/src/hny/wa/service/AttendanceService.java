package hny.wa.service;


import hny.wa.model.Attendance;
import hny.wa.model.Attendance_countDetail;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.util.ArrayList;
import java.util.List;



public interface AttendanceService {
	
	public ArrayList<Attendance_countDetail> getAttendance(String userid,int departmentid,String start,String end);
	public void insertEveryWorkDay(Attendance attendance);
	//sy
	public String getTodayCometime(String userid);
	public String getTodayGotime(String userid);
	public int getTodayId(String userid);
	public String setTodayCometime(String userid,int id);
	public String setTodayGotime(String userid,int id);
	public int getComestate(String userid);
	public int getGostate(String userid);
	public int getTotalDayP(String userid);
	public int getNoNormalDayP(String userid);
	public int getTotalDayD(int departmentid);
	public int getNoNormalDayD(int departmentid);
	public int getlastAttendance() ;
}
