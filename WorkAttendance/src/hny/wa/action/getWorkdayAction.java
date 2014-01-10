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
public class getWorkdayAction extends ActionSupport{
	
    private WorkdayService workdayService;
    private List<Workday> workdaylist;
    private String workday;

	public String getWorkday() {
		return workday;
	}

	public void setWorkday(String workday) {
		this.workday = workday;
	}

	public WorkdayService getWorkdayService() {
		return workdayService;
	}

	public void setWorkdayService(WorkdayService workdayService) {
		this.workdayService = workdayService;
	}

	public List<Workday> getWorkdaylist() {
		return workdaylist;
	}

	public void setWorkdaylist(List<Workday> workdaylist) {
		this.workdaylist = workdaylist;
	}

	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		workdaylist=workdayService.getWorkday();
		workday=workdaylist.get(0).getWorkday();
		return SUCCESS;
		
	}
    
    
}
