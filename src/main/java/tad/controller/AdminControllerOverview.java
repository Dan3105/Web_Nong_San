package tad.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.bean.UserBean;
import tad.entity.Account;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/admin")
public class AdminControllerOverview {
	@RequestMapping("overview")
	public String overview(ModelMap model) {
		return "admin/admin-menu";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "redirect:/admin/overview.htm";
	}
	
	@RequestMapping("logout.htm")
	public String logout(ModelMap model, HttpSession session)
	{
		return "redirect:/guest/logout.htm";
	}
	
	@RequestMapping("info.htm")
	public String gInfo(ModelMap model, HttpSession session)
	{
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if(acc == null)
		{
			return "redirect:/";
		}
		
		UserBean userBean = new UserBean(acc.getEmail(), acc.getFirstName(), acc.getLastName(), acc.getPhoneNumber());
		model.addAttribute(DefineAttribute.UserBeanAttribute, userBean);
		return "admin/admin-profile";
	}
	
	
}
