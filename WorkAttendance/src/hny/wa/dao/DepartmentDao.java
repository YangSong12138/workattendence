package hny.wa.dao;


import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author yangsong
 */
public interface DepartmentDao {
	//by fuhua 
	public ArrayList<Department> getDepartmentAll();
	//end 
	
	//sy
	public Department getDepartmentDetail(int departmentid);
	//
	//3
	public Department SelectedByID(int departid);
}
