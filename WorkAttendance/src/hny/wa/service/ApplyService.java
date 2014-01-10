package hny.wa.service;

import hny.wa.model.Apply;

import java.util.List;

public interface ApplyService {
	public List<Apply> selectByState(int state);
	public void approvedByAdmin(int id);
	public void approve(int id, int state);
	public boolean submitApplication(Apply apply);
	//qf
	public List<Apply> selectByUserid(String userid);
	public List<Apply> selectByManager(int departm);
}
