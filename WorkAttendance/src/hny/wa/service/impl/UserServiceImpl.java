package hny.wa.service.impl;
import hny.wa.dao.UserDao;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;
import hny.wa.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;


public class UserServiceImpl implements UserService {

	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}	
	public Login login(String userid, String password) {
		Login u = findUserByUserid(userid);
		if (u == null) {
			return null;
		} else {
			if (u.getPassword().equals(password)) {
				System.out.println("yaya1");
				return u;
			} else {
				System.out.println("yaya2");
				return null;
			}
		}
	}
	public Login findUserByUserid(String userid) {
		if (userid == null || userid.equals("")) {
			return null;
		} else {
			return userDao.findUserByUserid(userid);
		}
	}

	@Override
	public int getUserPower(String userid) {
		if (userid == null || userid.equals("")) {
			return -1;
		} else {
			return userDao.getUserDetail(userid).getPower();
		}
	}

	@Override
	public String getUserName(String userid) {
		if (userid == null || userid.equals("")) {
			return "";
		} else {
			return userDao.getUserDetail(userid).getUsername();
		}
	}

	@Override
	public int getUserDepartmentid(String userid) {
		if (userid == null || userid.equals("")) {
			return -1;
		} else {
			return userDao.getUserDetail(userid).getDepartid();
		}
	}

	@Override
	public ArrayList<User> getClertsByDepartId(int departId) {
		// TODO Auto-generated method stub
		ArrayList<User> d= userDao.getClertsByDepartId(departId);
		return d;
	}
	
	@Override
	public List<User> getUserByDepartmentid(int departmentid) {
		return userDao.getUserByDepartmentid(departmentid);
	}

}
