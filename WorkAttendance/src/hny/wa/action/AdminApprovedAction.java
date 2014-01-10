package hny.wa.action;

import java.util.ArrayList;
import java.util.List;

import hny.wa.model.Apply;
import hny.wa.service.ApplyService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 管理员更改考勤记录
 * Add by qf
*/
public class AdminApprovedAction  extends ActionSupport{
	ApplyService applyService;
	int id;
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public ApplyService getApplyService() {
		return applyService;
	}


	public void setApplyService(ApplyService applyService) {
		this.applyService = applyService;
	}


	@Override
	public String execute() throws Exception {
		System.out.println("id为"+id);
		applyService.approvedByAdmin(id);
		return SUCCESS;
	}
}
