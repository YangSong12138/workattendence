package hny.wa.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Apply;
import hny.wa.model.Workday;
import hny.wa.service.ApplyService;
import hny.wa.service.WorkdayService;

/**
 *
 * Add by yangsong
*/
public class setWorkdayAction extends ActionSupport{
	
    private WorkdayService workdayService;
    private String workday;

	public WorkdayService getWorkdayService() {
		return workdayService;
	}

	public void setWorkdayService(WorkdayService workdayService) {
		this.workdayService = workdayService;
	}

	public String getWorkday() {
		return workday;
	}

	public void setWorkday(String workday) {
		this.workday = workday;
	}

	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		workdayService.updateWorkday(workday);
		return SUCCESS;
		
	}
    
    
}
