package tad.controller;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.IAdminDAO;
import tad.DAO.ICategoryDAO;
import tad.bean.AdminLoginBean;
import tad.entity.Admin;
import tad.entity.Category;
@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping(method= RequestMethod.GET)
	public String index(ModelMap modelMap) {
		AdminLoginBean emptyLogin = new AdminLoginBean();
		modelMap.addAttribute("admin", emptyLogin);
		return "admin/adminLogin";
	}
	
	@Autowired
	private IAdminDAO adminDAO;
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(@ModelAttribute("admin") AdminLoginBean admin)
	{
		Admin ValidateAdmin = adminDAO.FindUserAdmin(admin.getUsername(), admin.getPassword());
		if(ValidateAdmin != null)
		{
			System.out.println("Login Success");
			return "redirect:/admin/category.htm";
		}
		return "redirect:/admin.htm";
	}

	@RequestMapping("user")
	public String user() {
		return "admin/adminUserManager";
	}

	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private ICategoryDAO categoryDAO;
	
	@RequestMapping("category")
	public String category(ModelMap model) {
		ArrayList<Category> categories = categoryDAO.GetListCategories();
		model.addAttribute("list", categories);

		return "admin/adminCategoryManager";
	}
}
