package hny.wa.service.impl;
import hny.wa.dao.UserDao;
import hny.wa.dao.WorkdayDao;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;
import hny.wa.model.Workday;
import hny.wa.service.UserService;
import hny.wa.service.WorkdayService;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;


public class WorkdayServiceImpl implements WorkdayService {

	WorkdayDao workdayDao;
	
	public WorkdayDao getWorkdayDao() {
		return workdayDao;
	}

	public void setWorkdayDao(WorkdayDao workdayDao) {
		this.workdayDao = workdayDao;
	}

	@Override
	public void updateWorkday(String workday) {
		if(workday==""||workday==null){
			workdayDao.updateWorkday("");
		}else{
			workdayDao.updateWorkday(workday);
		}
		
	}

	@Override
	public List<Workday> getWorkday() {
		 List<Workday> list=workdayDao.getWorkday();
		 Workday workday=new Workday();
		 if(list.size()==0){
			 workday.setWorkday("请选择非工作日");
			 list.add(workday);
		 }
		 return list;
		 
	}

	@Override
	public boolean isWorkday(String day) {
		List<Workday> list=workdayDao.getWorkday();
		
		if(list.size()==0){
			return true;
		}else{
			String workday=list.get(0).getWorkday();
			if(workday==null){
				workday="";
			}
			if(workday.contains(day)){
				return false;
			}else{
				return true;
			}
		}
	}

	

}
