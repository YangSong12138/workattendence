package hny.wa.service.impl;
import hny.wa.dao.AttendanceDao;
import hny.wa.dao.DepartmentDao;
import hny.wa.dao.UserDao;
import hny.wa.model.Attendance;
import hny.wa.model.Attendance_countDetail;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;
import hny.wa.service.AttendanceService;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;


public class AttendanceServiceImpl implements AttendanceService {

	private AttendanceDao attendanceDao;
	
	public AttendanceDao getAttendanceDao() {
		return attendanceDao;
	}

	public void setAttendanceDao(AttendanceDao attendanceDao) {
		this.attendanceDao = attendanceDao;
	}

	@Override
	public ArrayList<Attendance_countDetail> getAttendance(String userid,int departmentid,String start,String end){
		// TODO Auto-generated method stub
		ArrayList<Attendance_countDetail> d= attendanceDao.getAttendance(userid, departmentid, start, end);
		return d;
	}
	
	//sy
	@Override
	public String getTodayCometime(String userid) {
		return attendanceDao.getTodayAttendanceDao(userid).getCometime();
	}
	@Override
	public String getTodayGotime(String userid) {
		
		return attendanceDao.getTodayAttendanceDao(userid).getGotime();
		
	}
	@Override
	public String setTodayCometime(String userid, int id) {
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Timestamp tsM = new Timestamp(System.currentTimeMillis());  
	    String s=timeStamp.toString().substring(0,10);
		String tempMStr = s+" 09:00:00";
		int state=-1;
		try {
			tsM = Timestamp.valueOf(tempMStr);
			System.out.println(tsM.compareTo(timeStamp));
			if(tsM.compareTo(timeStamp)>=0){
				state=0;	
			}else{
				state=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("state="+state);
		attendanceDao.updateAttendanceCometimeDao(userid, timeStamp, id,state);
		return null;
	}
	@Override
	public String setTodayGotime(String userid, int id) {
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Timestamp tsA = new Timestamp(System.currentTimeMillis());   
	    String s=timeStamp.toString().substring(0,10);
		String tempAStr = s+" 18:00:00";
		int state=-1;
		try {
			tsA = Timestamp.valueOf(tempAStr);
			System.out.println(tsA.compareTo(timeStamp));
			if(tsA.compareTo(timeStamp)<=0){
				state=0;	
			}else{
				state=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		attendanceDao.updateAttendanceGotimeDao(userid, timeStamp, id,state);
		return null;
	}
	@Override
	public int getTodayId(String userid) {
		return attendanceDao.getTodayAttendanceDao(userid).getId();
	}
	@Override
	public int getComestate(String userid) {
		return attendanceDao.getTodayAttendanceDao(userid).getComestate();
	}
	@Override
	public int getTotalDayP(String userid) {
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Calendar cal = Calendar.getInstance();
		int month1 = cal.get(Calendar.MONTH);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        int week = cal.get(Calendar.DAY_OF_WEEK);
        String starttime,endtime;
        if(month1==0){
        	int year2=year-1;
        	starttime=year2+"-"+12;
            endtime=year+"-0"+month1;
        	
        }else{
        	if(month1/10==0&&month/10==1){
	        	starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}else if(month1/10==0){
        		starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}
        	else{
        		starttime=year+"-"+month1;
	        	endtime=year+"-"+month;
        	}
        }
        if(attendanceDao.getLastMonthTotaldayP(userid, starttime, endtime)!=null){
        	System.out.println("sdfa+为啥没有认输");
        	return attendanceDao.getLastMonthTotaldayP(userid, starttime, endtime).size();
        }
		return 0;
		
	}
	@Override
	public int getNoNormalDayP(String userid) {
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Calendar cal = Calendar.getInstance();
		int month1 = cal.get(Calendar.MONTH);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        int week = cal.get(Calendar.DAY_OF_WEEK);
        String starttime,endtime;
        if(month1==0){
        	int year2=year-1;
        	starttime=year2+"-"+12;
            endtime=year+"-0"+month1;
        	
        }else{
        	if(month1/10==0&&month/10==1){
	        	starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}else if(month1/10==0){
        		starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}
        	else{
        		starttime=year+"-"+month1;
	        	endtime=year+"-"+month;
        	}
        }
        System.out.println(userid+ starttime+endtime);
        if(attendanceDao.getLastMonthNoNormaldayP(userid, starttime, endtime)!=null){
        	System.out.println("hahahahahahahsdfsadfsafddsafasfdsafadsfas");
        	return attendanceDao.getLastMonthNoNormaldayP(userid, starttime, endtime).size();

        }
		return 0;
	}
	@Override
	public int getTotalDayD(int departmentid) {
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Calendar cal = Calendar.getInstance();
		int month1 = cal.get(Calendar.MONTH);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        int week = cal.get(Calendar.DAY_OF_WEEK);
        String starttime,endtime;
        if(month1==0){
        	int year2=year-1;
        	starttime=year2+"-"+12;
            endtime=year+"-0"+month1;
        	
        }else{
        	if(month1/10==0&&month/10==1){
	        	starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}else if(month1/10==0){
        		starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}
        	else{
        		starttime=year+"-"+month1;
	        	endtime=year+"-"+month;
        	}
        }
        if(attendanceDao.getLastMonthTotaldayD(departmentid, starttime, endtime)!=null){
        	System.out.println("hahahahahahahsdfsadfsafddsafasfdsafadsfas");
        	return attendanceDao.getLastMonthTotaldayD(departmentid, starttime, endtime).size();
        }
		return 0;
		
	}
	@Override
	public int getNoNormalDayD(int departmentid) {
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		Calendar cal = Calendar.getInstance();
		int month1 = cal.get(Calendar.MONTH);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);
        int week = cal.get(Calendar.DAY_OF_WEEK);
        String starttime,endtime;
        if(month1==0){
        	int year2=year-1;
        	starttime=year2+"-"+12;
            endtime=year+"-0"+month1;
        	
        }else{
        	if(month1/10==0&&month/10==1){
	        	starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}else if(month1/10==0){
        		starttime=year+"-0"+month1;
	        	endtime=year+"-"+month;
        	}
        	else{
        		starttime=year+"-"+month1;
	        	endtime=year+"-"+month;
        	}
        }
        if(attendanceDao.getLastMonthNoNormaldayD(departmentid, starttime, endtime)!=null){
        	return attendanceDao.getLastMonthNoNormaldayD(departmentid, starttime, endtime).size();
        }
		return 0;
		
	}

	@Override
	public int getGostate(String userid) {
		return attendanceDao.getTodayAttendanceDao(userid).getGostate();
	}

	@Override
	public void insertEveryWorkDay(Attendance attendance) {
		// TODO Auto-generated method stub
		attendanceDao.insertEveryWorkDay(attendance);
	}
	public int getlastAttendance() {
		return attendanceDao.getlastAttendance().getId();
	}
	
	
	
}
