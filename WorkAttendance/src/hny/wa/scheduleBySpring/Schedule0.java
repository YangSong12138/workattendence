package hny.wa.scheduleBySpring;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import hny.wa.dao.UserDao;
import hny.wa.dao.impl.AttendanceDaoImpl;
import hny.wa.dao.impl.UserDaoImpl;
import hny.wa.model.Attendance;
import hny.wa.model.User;
import hny.wa.service.AttendanceService;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;
import hny.wa.service.WorkdayService;
import hny.wa.service.impl.UserServiceImpl;

public class Schedule0  implements Job{
	private UserService userService;
	private AttendanceService attendanceService;
	private WorkdayService workdayService;
	
	 public WorkdayService getWorkdayService() {
		return workdayService;
	}

	public void setWorkdayService(WorkdayService workdayService) {
		this.workdayService = workdayService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public AttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(AttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public void service() {  
		 try{
			 System.out.println("大大asdaadsds");
	         System.out.println("大大1");
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
	         if(workdayService.isWorkday(time)){
	        	 ArrayList<User> ul=new  ArrayList<User>();
	             ul=userService.getClertsByDepartId(0);
	             System.out.println("大大2"+ul.toString());
	             System.out.println("大大");
	             
	             for(int i=0;i<ul.size();i++){
	            	 Attendance ae=new Attendance();
	            	 ae.setState(1);
	            	 ae.setComestate(-1);
	            	 ae.setGostate(-1);
	            	 ae.setDepartmentid(ul.get(i).getDepartid());
	            	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");//设置日期格式
	         		 String filename=df.format(new Date());
	            	 ae.setCometime(filename);
	            	 ae.setGotime(filename);
	            	 ae.setId(attendanceService.getlastAttendance()+1);
	            	 ae.setUserid(ul.get(i).getUserid());
	            	 attendanceService .insertEveryWorkDay(ae);
	             }
	         }
         }catch(Exception e){
    			 System.out.println(e.toString());
    	}
         
     }

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		service();
	}

}
