package tad.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tad.DAO.IAccountDAO;
import tad.entity.Account;

public class GuestInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	IAccountDAO accountDAO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Account user = (Account) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/guest.htm"); // guest.htm
			return false;
		}
		else if(user.getRole().getRoleId() == "GUEST")
		{
			return true;
		}
		return false;
	}
}
