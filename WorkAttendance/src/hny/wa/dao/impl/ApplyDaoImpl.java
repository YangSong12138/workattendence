package hny.wa.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.ejb.criteria.expression.function.SubstringFunction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import hny.wa.dao.ApplyDao;
import hny.wa.model.Apply;

public class ApplyDaoImpl extends HibernateDaoSupport implements ApplyDao{

	//add by dongxiao
	@Override
	public List<Apply> selectByState(int state) {
		List result = new ArrayList();
		List<Apply> applyList = new ArrayList<Apply>();
		
		result = getHibernateTemplate().find("from Apply a where a.state = ?", state);
		if(!result.isEmpty()){
			System.out.println("待处理记录数："+result.size());
			for(int i=0;i<result.size();i++){
				Apply apply = (Apply) result.get(i);
				apply.setStarttime(apply.getStarttime().substring(0,10));
				apply.setEndtime(apply.getEndtime().substring(0,10));
				//System.out.println(apply.getStarttime());
				applyList.add(apply);
			}
			return applyList;
		}else{
			return null;
		}
	}

	@Override
	public void approve(Apply apply) {
		getHibernateTemplate().update(apply);
	}

	@Override
	public Apply selectById(int id) {
		List result = new ArrayList();
		result = getHibernateTemplate().find("from Apply a where a.id = ?", id);
		if(!result.isEmpty()){
			return (Apply) result.get(0);
		}
		return null;
	}
	//add by dongxiao finished
	
	//add by liumiao
	public int insertApplyInfo(Apply apply){
		getHibernateTemplate().save(apply);
		return apply.getId();
	}
	//the method is finished 
	
	//add by qf
		@Override
		public List<Apply> selectByUserid(String userid) {
			List result = new ArrayList();
			List<Apply> applyList = new ArrayList<Apply>();
			
			result = getHibernateTemplate().find("from Apply a where a.userid = ?", userid);
			if(!result.isEmpty()){
				System.out.println("待处理记录数："+result.size());
				for(int i=0;i<result.size();i++){
					Apply apply = (Apply) result.get(i);
					apply.setStarttime(apply.getStarttime().substring(0,10));
					apply.setEndtime(apply.getEndtime().substring(0,10));
					//System.out.println(apply.getStarttime());
					applyList.add(apply);
				}
				return applyList;
			}else{
				return null;
			}
		}
		//add by qf finished
		@Override
		public List<Apply> selectByManager(int departmentid) {
			List result = new ArrayList();
			List<Apply> applyList = new ArrayList<Apply>();
			
			result = getHibernateTemplate().find("from Apply b where b.id in (select a.id from Apply a, User u where a.userid = u.userid and u.departid = ? and a.state = ?)", departmentid, 0);
			System.out.println("+++++++++"+departmentid);
			if(!result.isEmpty()){
				System.out.println("待处理记录数："+result.size());
				for(int i=0;i<result.size();i++){
					Apply apply = (Apply) result.get(i);
					apply.setStarttime(apply.getStarttime().substring(0,10));
					apply.setEndtime(apply.getEndtime().substring(0,10));
					applyList.add(apply);
				}
				return applyList;
			}else{
				return null;
			}
		}

}
