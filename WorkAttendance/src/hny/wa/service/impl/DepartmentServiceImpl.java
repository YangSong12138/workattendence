package hny.wa.service.impl;
import hny.wa.dao.DepartmentDao;
import hny.wa.dao.UserDao;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;


public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public ArrayList<Department> getDepartments() {
		// TODO Auto-generated method stub
		ArrayList<Department> d= departmentDao.getDepartmentAll();
		return d;
	}
	@Override
	public String getDepartmentName(int departmentid) {
		return departmentDao.getDepartmentDetail(departmentid).getDepartmentname();
	}
	
	@Override
	public List<Department> getDepartmentAll() {
		return departmentDao.getDepartmentAll();
	}	
	
}
