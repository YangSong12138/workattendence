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
public interface UserDao {
	//sy
	public Login findUserByUserid(String userid);
	public User getUserDetail(String userid);
	
	
	public List<User> getUserByDepartmentid(int departmentid);
	//fh
	public ArrayList<User> getClertsByDepartId(int departId);
	
}
