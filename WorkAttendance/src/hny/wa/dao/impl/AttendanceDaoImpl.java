package hny.wa.dao.impl;
import hny.wa.dao.AttendanceDao;
import hny.wa.dao.DepartmentDao;
import hny.wa.dao.UserDao;
import hny.wa.model.Attendance;
import hny.wa.model.Attendance_countDetail;
import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AttendanceDaoImpl extends HibernateDaoSupport implements AttendanceDao {

	@Override
	public ArrayList<Attendance_countDetail> getAttendance(String userid, int departmentid,
			String start, String end) {
		// TODO Auto-generated method stub
		
		ArrayList<Attendance_countDetail> ul = new ArrayList<Attendance_countDetail>();
		
		String sql="select a.id,a.userid,u.username,a.departmentid,d.departmentname,a.cometime,a.gotime,a.comestate,a.gostate,a.state from Attendance a,Department d,User u where  a.departmentid=d.departmentid and  u.userid=a.userid and a.cometime>'"+start+"' and a.cometime<'"+end+"' ";
		if(!userid.equals("_0")){
			sql+=" and a.userid='"+userid+"' ";
		}
		if(departmentid!=0){
			sql+=" and a.departmentid="+departmentid+" ";
		}
		List<Object[]> l=this.getSession().createSQLQuery(sql).list();
		for(int i=0;i<l.size();i++){
			Attendance_countDetail att=new Attendance_countDetail();
			att.setId((Integer)l.get(i)[0]);
			att.setUserid((String)l.get(i)[1]);
			att.setUsername((String)l.get(i)[2]);
			att.setDepartmentname((String)l.get(i)[4]);
			att.setCometime((String)l.get(i)[5].toString());
			att.setComestate((Integer)l.get(i)[7]);
			att.setGotime((String)l.get(i)[6].toString());
			att.setGostate((Integer)l.get(i)[8]);
			att.setState((Integer)l.get(i)[9]);
			ul.add(att);
		}
		if (ul.isEmpty()) {
			return null;
		} else {
			return ul;
		}
	}

	@Override
	public void insertEveryWorkDay(Attendance attendance) {
		// TODO Auto-generated method stub
		//this.getSession().c
		getHibernateTemplate().save( attendance);
		
	}
	
	@Override
	public Attendance getTodayAttendanceDao(String userid) {
		System.out.println("comeinghaha");
		List ul = getHibernateTemplate().find("from Attendance u where u.userid = ? order by id desc", userid);
		
		if (ul.isEmpty()) {
			return null;
		} else {
			Attendance attendance=(Attendance) ul.get(0);
			return attendance;
		}
	}
	public Attendance getlastAttendance() {
		System.out.println("comeinghaha");
		List ul = getHibernateTemplate().find("from Attendance order by id desc");
		
		if (ul.isEmpty()) {
			return null;
		} else {
			Attendance attendance=(Attendance) ul.get(0);
			return attendance;
		}
	}

	@Override
	public void updateAttendanceGotimeDao(String userid, Timestamp timeStamp,int id,int state) {
		
		String hql = "update Attendance u set u.gotime=? where u.userid='"+userid+"' and u.id="+id;     
		int row=this.getSession().createQuery(hql).setTimestamp(0, timeStamp).executeUpdate();
		hql = "update Attendance u set u.state=? where u.userid='"+userid+"' and u.id="+id;     
		this.getSession().createQuery(hql).setInteger(0, 0).executeUpdate();
		hql = "update Attendance u set u.gostate=? where u.userid='"+userid+"' and u.id="+id;  
		this.getSession().createQuery(hql).setInteger(0, state).executeUpdate();
		
	}

	@Override
	public void updateAttendanceCometimeDao(String userid, Timestamp timeStamp,int id,int state) {
		String hql = "update Attendance u set u.cometime=? where u.userid='"+userid+"' and u.id="+id;     
		this.getSession().createQuery(hql).setTimestamp(0, timeStamp).executeUpdate();
		hql = "update Attendance u set u.comestate=? where u.userid='"+userid+"' and u.id="+id;  
		this.getSession().createQuery(hql).setInteger(0, state).executeUpdate();
		
		
	}

	@Override
	public List<Attendance> getLastMonthTotaldayP(String userid,
			String starttime, String endtime) {
		System.out.println("comeinghaha");
		List<Attendance> ul = getHibernateTemplate().find("from Attendance u where u.cometime >= ? " +
				" and u.cometime < ?  and u.userid = ?",starttime, endtime,userid);
		if (ul.isEmpty()) {
			return null;
		} else {
			
			return ul;
		}
	}

	@Override
	public List<Attendance> getLastMonthNoNormaldayP(String userid,
			String starttime, String endtime) {
		System.out.println("comeinghaha");
		List<Attendance> ul = getHibernateTemplate().find("from Attendance u where (u.comestate = 1 "+
			"or u.gostate = 1 or u.state = 1 or u.state = 2) and "+
				"u.cometime >= ?  and u.cometime < ?  and u.userid = ?",starttime, endtime,userid);
		if (ul.isEmpty()) {
			return null;
		} else {
			return ul;
		}
	}

	@Override
	public List<Attendance> getLastMonthTotaldayD(int departmentid,
			String starttime, String endtime) {
		System.out.println("comeinghaha");
		List<Attendance> ul = getHibernateTemplate().find("from Attendance u where u.cometime >= ? " +
				" and u.cometime < ?  and u.userid in (select userid from User " +
				"where departmentid=?)",starttime, endtime,departmentid);
		if (ul.isEmpty()) {
			return null;
		} else {
			
			return ul;
		}
	}

	@Override
	public List<Attendance> getLastMonthNoNormaldayD(int departmentid,
			String starttime, String endtime) {
		
		System.out.println("comeinghaha");
		List<Attendance> ul = getHibernateTemplate().find("from Attendance u where (u.comestate = 1 "+
			"or u.gostate = 1 or u.state = 1 or u.state = 2) and "+
				"u.cometime >= ?  and u.cometime < ?  and u.userid in (select userid from User " +
				"where departmentid=?)",starttime, endtime,departmentid);
		if (ul.isEmpty()) {
			return null;
		} else {
			
			return ul;
		}
	}
	
	//3
	@Override
	public void updateAttendance(Attendance attendance) {
		getHibernateTemplate().update(attendance);
		
	}

	@Override
	public Attendance selectByDate(String userid, String date) {
		List ul = getHibernateTemplate().find("from Attendance a where a.userid = '"+userid+"' and a.cometime like '"+date+"%'");
		if (ul.isEmpty()) {
			return null;
		} else {
			System.out.println("待处理记录数："+ul.size());
			Attendance attend=(Attendance) ul.get(0);
			return attend;
		}
	}
	

}
