package hny.wa.dao.impl;
import hny.wa.dao.UserDao;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	@Override
	public Login findUserByUserid(String userid) {
		List ul = getHibernateTemplate().find("from Login u where u.userid = ?", userid);
		if (ul.isEmpty()) {
			return null;
		} else {
			return (Login) ul.get(0);
		}
	}

	@Override
	public User getUserDetail(String userid) {
		List ul = getHibernateTemplate().find("from User u where u.userid = ?", userid);
		if (ul.isEmpty()) {
			return null;
		} else {
			User user=(User) ul.get(0);
			return user;
		}
	}

	@Override
	public ArrayList<User> getClertsByDepartId(int departId) {
		// TODO Auto-generated method stub
		ArrayList<User> ul =null;
		System.out.println(departId);
		if(departId==0){
			try{
			ul=(ArrayList<User>)getHibernateTemplate().find("from User");
			System.out.println("ul:"+ul.toString());
			}catch(Exception e){
				 System.out.println("xuxuxuu"+e.toString());
			 }
		}
		else{
			System.out.println("momo");
			ul=(ArrayList<User>)getHibernateTemplate().find("from User u where u.departid = ?", departId);
		}
		if (ul.isEmpty()) {
			return null;
		} else {
			return ul;
		}
	}
	
	@Override
	public List<User> getUserByDepartmentid(int departmentid) {
		List<User> ul = getHibernateTemplate().find("from User u where u.departid = ?", departmentid);
		return ul;
	}
}
