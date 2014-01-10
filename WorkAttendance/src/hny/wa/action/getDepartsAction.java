package hny.wa.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import hny.wa.model.Department;
import hny.wa.model.Login;
import hny.wa.service.DepartmentService;
import hny.wa.service.UserService;

import java.util.ArrayList;
import java.util.Map;

import net.sf.json.JSONArray;



public class getDepartsAction extends ActionSupport {

	private DepartmentService departmentService;
	private String result;
	////
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	

	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	@Override
	public String execute() throws Exception {
		
		ArrayList<Department> d = departmentService.getDepartments();
		JSONArray jsonArray = JSONArray.fromObject(d);
		result =jsonArray.toString();
		return SUCCESS;
	}
}
