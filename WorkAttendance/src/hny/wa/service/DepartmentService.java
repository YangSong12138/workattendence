package hny.wa.service;


import hny.wa.model.Department;
import hny.wa.model.Login;

import java.util.ArrayList;
import java.util.List;



public interface DepartmentService {
	
	public ArrayList<Department> getDepartments();
	//sy
	public String getDepartmentName(int departmentid);
	public List<Department> getDepartmentAll();
}
