package hny.wa.action;

import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Apply;
import hny.wa.service.ApplyService;

/**
 * 部门经理审批
 * Add by dongxiao
*/
public class ApproveAction extends ActionSupport{
	int state;
	int id;
	Apply apply = new Apply();
	ApplyService applyService;
	
	public ApplyService getApplyService() {
		return applyService;
	}
	public void setApplyService(ApplyService applyService) {
		this.applyService = applyService;
	}
	public Apply getApply() {
		return apply;
	}
	public void setApply(Apply apply) {
		this.apply = apply;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String execute() throws Exception {
		System.out.println("id为"+id+"的申请审批结果为"+state);
		applyService.approve(id, state);
		return SUCCESS;
	}
	
}
