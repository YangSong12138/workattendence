package hny.wa.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import hny.wa.model.Apply;
import hny.wa.service.ApplyService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 部门经理审批列表显示
 * Add by dongxiao
*/
public class ApplyAction extends ActionSupport{
	
	ApplyService applyService;
	int departmentid;
	
	List<Apply> applyList = new ArrayList<Apply>();
	List<String> nameList = new ArrayList<String>();
	
	public int getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
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
	public ApplyService getApplyService() {
		return applyService;
	}
	public void setApplyService(ApplyService applyService) {
		this.applyService = applyService;
	}
	
	@Override
	public String execute() throws Exception {
		List resultList = new ArrayList();
		resultList = applyService.selectByManager(departmentid);
		System.out.println("---"+departmentid);
		applyList = (List<Apply>) resultList.get(1);
		nameList = (List<String>) resultList.get(0);
		//applyList = applyService.selectByState(0);
		//Map session = ActionContext.getContext().getSession();
		
		/*if(resultList.size()>0){
			session.put("applyResultList",  resultList);
		}*/
		return SUCCESS;
	}

	
	
}
