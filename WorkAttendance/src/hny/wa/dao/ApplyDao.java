package hny.wa.dao;

import hny.wa.model.Apply;

import java.util.List;

public interface ApplyDao {
	public List<Apply> selectByState(int state);
	public void approve(Apply apply);
	public Apply selectById(int id);
	public int insertApplyInfo(Apply apply);
	//qf
	public List<Apply> selectByUserid(String userid);
	public List<Apply> selectByManager(int departmentid) ;
}
