package hny.wa.dao.impl;
import hny.wa.dao.UserDao;
import hny.wa.dao.WorkdayDao;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;
import hny.wa.model.Workday;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class WorkdayDaoImpl extends HibernateDaoSupport implements WorkdayDao {

	@Override
	public void updateWorkday(String workday) {
		String hql = "update Workday u set u.workday=? where id=1";     
		int row=this.getSession().createQuery(hql).setString(0, workday).executeUpdate();
	}

	@Override
	public List<Workday> getWorkday() {
		List<Workday> ul = getHibernateTemplate().find("from Workday");
		return ul;
	}
	
}
