package hny.wa.action;

import hny.wa.model.Apply;
import hny.wa.service.ApplyService;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class StaffApplyHistoryAction  extends ActionSupport{
	ApplyService applyService;
	List<Apply> applyList = new ArrayList<Apply>();
	List<String> nameList = new ArrayList<String>();
	List<String> departList = new ArrayList<String>();
	String userid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public ApplyService getApplyService() {
		return applyService;
	}
	public void setApplyService(ApplyService applyService) {
		this.applyService = applyService;
	}
	public List<Apply> getApplyList() {
		return applyList;
	}
	public void setApplyList(List<Apply> applyList) {
		this.applyList = applyList;
	}
	public List<String> getNameList() {
		return nameList;
	}
	public void setNameList(List<String> nameList) {
		this.nameList = nameList;
	}
	public List<String> getDepartList() {
		return departList;
	}
	public void setDepartList(List<String> departList) {
		this.departList = departList;
	}
	
	@Override
	public String execute() throws Exception {
		List resList = new ArrayList();
		
		resList = applyService.selectByUserid(userid);
		applyList = (List<Apply>) resList.get(1);
		nameList = (List<String>) resList.get(0);
		departList = (List<String>) resList.get(2);
		return SUCCESS;
		
	}
}
