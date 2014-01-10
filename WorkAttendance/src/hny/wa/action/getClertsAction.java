package hny.wa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.model.User;
import hny.wa.service.UserService;

import java.util.ArrayList;
import java.util.Map;

import net.sf.json.JSONArray;



public class getClertsAction extends ActionSupport {

	private UserService userService;
	private String userid;
	private int departmentid;
	private String result;
	
	

	public UserService getUserService() {
		return userService;
	}



	public void setUserService(UserService userService) {
		this.userService = userService;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public int getDepartmentid() {
		return departmentid;
	}



	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}



	public String getResult() {
		return result;
	}



	public void setResult(String result) {
		this.result = result;
	}



	@Override
	public String execute() throws Exception {
		ArrayList<User> d = userService.getClertsByDepartId(departmentid);
		JSONArray jsonArray = JSONArray.fromObject(d);
		result =jsonArray.toString();
		return SUCCESS;
	}
}
