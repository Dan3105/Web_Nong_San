package tad.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.entity.Account;

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
}
