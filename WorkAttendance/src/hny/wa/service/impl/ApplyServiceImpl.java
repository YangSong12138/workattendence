package hny.wa.service.impl;

import hny.wa.dao.ApplyDao;
import hny.wa.dao.AttendanceDao;
import hny.wa.dao.DepartmentDao;
import hny.wa.dao.UserDao;
import hny.wa.model.Apply;
import hny.wa.model.Attendance;
import hny.wa.model.Department;
import hny.wa.model.User;
import hny.wa.service.ApplyService;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class ApplyServiceImpl implements ApplyService{
	private AttendanceDao attendanceDao;
	private UserDao userDao;
	private ApplyDao applyDao;
	private DepartmentDao departmentDao;
	
	public ApplyDao getApplyDao() {
		return applyDao;
	}

	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}

	public AttendanceDao getAttendanceDao() {
		return attendanceDao;
	}

	public void setAttendanceDao(AttendanceDao attendanceDao) {
		this.attendanceDao = attendanceDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
	
	//add by dongxiao qf
	@Override
	public List selectByState(int state) {
		List<Apply> applyList = new ArrayList<Apply>();
		Apply apply = new Apply();
		User user = new User();
		List<String> nameList = new ArrayList<String>();
		Department department = new Department();
		List<String> departList = new ArrayList<String>();
		List resultList = new ArrayList();
		
		applyList = applyDao.selectByState(state);
		if(applyList!=null){
			for(int i=0;i<applyList.size();i++){
				apply = applyList.get(i);
				String userid = apply.getUserid();
				
				user = userDao.getUserDetail(userid);
				nameList.add(user.getUsername());
				department = departmentDao.SelectedByID(user.getDepartid());
				departList.add(department.getDepartmentname());
			}
		}
		resultList.add(nameList);
		resultList.add(applyList);
		resultList.add(departList);
		return resultList;
		//return applyList;
	}
	//add by dongxiao qf finished
	
	//add by qf
	@Override
	public void approvedByAdmin(int id) {
		int state = 3;//管理员审批通过状态3
		Apply apply = new Apply();
		apply = applyDao.selectById(id);
		apply.setState(state);
		applyDao.approve(apply);
		
		String startdate = apply.getStarttime().substring(0,10);
		String enddate = apply.getEndtime().substring(0,10);
		String userid = apply.getUserid();	
        try {
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	//间隔天数
			long days =(sdf.parse(enddate).getTime()-sdf.parse(startdate).getTime())/(24*60*60*1000);
			Calendar start = Calendar.getInstance(); 
			
			System.out.println("来自service的消息 day："+days);
			for (int i = 0; i <= days; i++) {
				Attendance attendance = new Attendance();
				start.setTime(sdf.parse(startdate));
				start.add(Calendar.DATE,i);
				String dateString = sdf.format(start.getTime());
				System.out.println("来自service的消息："+dateString);
				System.out.println("来自service的消息："+userid);
				attendance = attendanceDao.selectByDate(userid, dateString);
				System.out.println("煎熬圣诞节啊华鼎奖啊哈apply.getApplytype()："+apply.getApplytype());
				attendance.setState(apply.getApplytype());
				attendanceDao.updateAttendance(attendance);
			}
        } catch (Exception e) {
			e.printStackTrace();
		}
	}
	//add by qf finished

	//add by dongxiao
	@Override
	public void approve(int id, int state) {
		Apply apply = new Apply();
		apply = applyDao.selectById(id);
		apply.setState(state);
		applyDao.approve(apply);
	}
	//add by dongxiao finished
	

	//add by liumiao
	public boolean submitApplication(Apply apply) {
		boolean b = false;
		int num = applyDao.insertApplyInfo(apply);
		if(num>0){
			b = true;
		}else{
			b = false;
		}
		return b;
	}
	//add by liumiao finished
	
	//qf
	@Override
	public List<Apply> selectByUserid(String userid) {
		List<Apply> applyList = new ArrayList<Apply>();
		Apply apply = new Apply();
		User user = new User();
		List<String> nameList = new ArrayList<String>();
		Department department = new Department();
		List<String> departList = new ArrayList<String>();
		List resultList = new ArrayList();
		
		applyList = applyDao.selectByUserid(userid);
		if(applyList!=null){
			for(int i=0;i<applyList.size();i++){
				apply = applyList.get(i);				
				user = userDao.getUserDetail(userid);
				nameList.add(user.getUsername());
				department = departmentDao.SelectedByID(user.getDepartid());
				departList.add(department.getDepartmentname());
				System.out.println("来自service：state~"+apply.getState());
				System.out.println("来自service：type~"+apply.getApplytype());
			}
		}
		resultList.add(nameList);
		resultList.add(applyList);
		resultList.add(departList);
		return resultList;
	}
	@Override
	public List<Apply> selectByManager(int departm) {
		List<Apply> applyList = new ArrayList<Apply>();
		Apply apply = new Apply();
		User user = new User();
		List<String> nameList = new ArrayList<String>();
		Department department = new Department();
		List<String> departList = new ArrayList<String>();
		List resultList = new ArrayList();
		
		applyList = applyDao.selectByManager(departm);
		if(applyList!=null){
			for(int i=0;i<applyList.size();i++){
				apply = applyList.get(i);
				String userid = apply.getUserid();
				
				user = userDao.getUserDetail(userid);
				nameList.add(user.getUsername());
				department = departmentDao.SelectedByID(user.getDepartid());
				departList.add(department.getDepartmentname());
			}
		}
		resultList.add(nameList);
		resultList.add(applyList);
		resultList.add(departList);
		return resultList;
	}

}
