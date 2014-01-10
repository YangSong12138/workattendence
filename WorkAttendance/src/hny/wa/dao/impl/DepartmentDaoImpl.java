package hny.wa.dao.impl;
import hny.wa.dao.DepartmentDao;
import hny.wa.dao.UserDao;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class DepartmentDaoImpl extends HibernateDaoSupport implements DepartmentDao {

	@Override
	public ArrayList<Department> getDepartmentAll() {
		// TODO Auto-generated method stub
		ArrayList<Department> ul = null;
		ul=(ArrayList<Department>)getHibernateTemplate().find("from Department");
		if (ul.isEmpty()) {
			return null;
		} else {
			return ul;
		}
	}
	
	@Override
	public Department getDepartmentDetail(int departmentid) {
		System.out.println("comeing");
		List ul = getHibernateTemplate().find("from Department u where u.departmentid = ?", departmentid);
		if (ul.isEmpty()) {
			return null;
		} else {
			System.out.println("comeing");
			Department department=(Department) ul.get(0);
			return department;
		}
		
	}
	//3
	@Override
	public Department SelectedByID(int departid) {
		List ul = getHibernateTemplate().find("from Department d where d.departmentid = ?", departid);
		if (ul.isEmpty()) {
			return null;
		} else {
			Department depart=(Department) ul.get(0);
			return depart;
		}
	}

}
