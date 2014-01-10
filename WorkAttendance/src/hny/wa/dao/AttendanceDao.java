package hny.wa.dao;


import hny.wa.model.Attendance;
import hny.wa.model.Attendance_countDetail;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author yangsong
 */
public interface AttendanceDao {

	public ArrayList<Attendance_countDetail> getAttendance(String userid,int departmentid,String start,String end);
	
	public void insertEveryWorkDay(Attendance attendance);
	
	//song yang
	public Attendance getTodayAttendanceDao(String userid);
	public void updateAttendanceGotimeDao(String userid,Timestamp timeStamp,int id,int state);
	public void updateAttendanceCometimeDao(String userid,Timestamp timeStamp,int id,int state);
	public List<Attendance> getLastMonthTotaldayP(String userid,String starttime,String endtime);
	public List<Attendance> getLastMonthNoNormaldayP(String userid,String starttime,String endtime);
	public List<Attendance> getLastMonthTotaldayD(int departmentid,String starttime,String endtime);
	public List<Attendance> getLastMonthNoNormaldayD(int departmentid,String starttime,String endtime);
	//
	//3
	public void updateAttendance(Attendance attendance);
	public Attendance selectByDate(String userid, String date);
	public Attendance getlastAttendance() ;
}
