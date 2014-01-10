package hny.wa.action;

import java.util.ArrayList;
import java.util.List;

import hny.wa.model.Apply;
import hny.wa.service.ApplyService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 管理员更新考勤列表显示
 * Add by qf
*/
public class ApplyAdminAction extends ActionSupport{
	ApplyService applyService;
	List<Apply> applyList = new ArrayList<Apply>();
	List<String> nameList = new ArrayList<String>();
	List<String> departList = new ArrayList<String>();
	
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
		resList = applyService.selectByState(1);
		applyList = (List<Apply>) resList.get(1);
		nameList = (List<String>) resList.get(0);
		departList = (List<String>) resList.get(2);
		return SUCCESS;
		
	}
}
