package hny.wa.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Apply;
import hny.wa.service.ApplyService;

/**
 * 提交出差/放假申请
 * Add by liumiao
*/
public class SubmitApplyAction extends ActionSupport{
	
    private ApplyService applyService;
    private String startTime;
    private String endTime;
    private int applyType; //申请的类型，2：出差；3：请假；4：补签
    private String content;
    private String userid;
    private String result;
    
    public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
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
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getApplyType() {
		return applyType;
	}
	public void setApplyType(int applyType) {
		this.applyType = applyType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@SuppressWarnings("unchecked")
	public String execute() throws Exception{
		
		Date now = new Date();
		DateFormat dFormat = DateFormat.getDateTimeInstance();
		String applytime=dFormat.format(now);
		System.out.print(applytime);
		Apply apply = new Apply();
		apply.setUserid(userid);
		
		apply.setStarttime(startTime);
		apply.setEndtime(endTime);
		apply.setContent(content);
		apply.setApplytype(applyType);
		apply.setApplytime(applytime);
		apply.setState(0);//默认该申请未审核
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        int   res   =   startTime.compareTo(endTime);  
		if((!startTime.equals(""))&&(!endTime.equals(""))&&(res<=0)&&(applyService.submitApplication(apply)==true)){
	        result = "success";
			return SUCCESS;
		}else{
			result = "error";
			return ERROR;
		}
		
	}
    
    
}
