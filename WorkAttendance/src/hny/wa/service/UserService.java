package hny.wa.service;


import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.util.ArrayList;
import java.util.List;



public interface UserService {
	//sy
	public Login login(String userid, String password);
	public int getUserPower(String userid);
	public String getUserName(String userid);
	public int getUserDepartmentid(String userid);
	public List<User> getUserByDepartmentid(int departmentid);
	//fh
	public ArrayList<User> getClertsByDepartId(int departId);
}
