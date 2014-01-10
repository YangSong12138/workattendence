package hny.wa.utils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
/**
*
* @author yangsong
*/
/*继承MethodFilterInterceptor 类，实现action中的方法拦截，因为本身项目内只含有两个action，而方法集成在action中*/

public class LoginInterceptor extends MethodFilterInterceptor {

	 @Override
	 public String doIntercept(ActionInvocation arg0) throws Exception {
		 //  System.out.println("interceptor");
		 /*获取request并拿去session保存的信息，查询信息是否存在，存在则invoke即通过拦截，不存在表明未登录此时拦截器将页面送回登录处，当然在此前是已经是确定session要么存储了登录成功之后的用户名，要么就是妙手空空*/  
	
		 HttpServletRequest request = ServletActionContext.getRequest();
		 HttpSession session = request.getSession();
		 String userid = (String)session.getAttribute("userid");
		 if(userid == null){
			 return "login";
		 }else{
			 return arg0.invoke();
		 }
	 }

}