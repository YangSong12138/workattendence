package hny.wa.utils;
/**
*
* @author yangsong
*/
import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.aop.MethodBeforeAdvice;

public class filter extends HttpServlet implements Filter {

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession(true);

		String url = request.getRequestURI();
		String userid = (String) session.getAttribute("userid");
		if (userid == null && url.indexOf("login.jsp") == -1 &&
				!url.equals("/WorkAttendance/") && !url.equals("/WorkAttendance/loginAction")
				&& !url.equals("/WorkAttendance/js/user.js") && !url.equals("/WorkAttendance/css/count.css")
				&& !url.equals("/WorkAttendance/js/jquery-1.7.1.min.js") && !url.equals("/WorkAttendance/img/logo.png")) {
			String location = "/login.jsp";
			request.getRequestDispatcher(location).forward(request, response);

			System.out.println("成功拦截到外星人企图入侵网站后台   :  " + url);
			response.setHeader("Cache-Control", "no-store");
			response.setDateHeader("Expires", 0);
			response.setHeader("Pragma", "no-cache");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

}