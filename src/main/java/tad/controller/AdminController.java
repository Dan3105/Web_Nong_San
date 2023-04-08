package tad.controller;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.IAddressDAO;
import tad.DAO.IAdminDAO;
import tad.DAO.ICategoryDAO;
import tad.bean.AddressBean;
import tad.bean.AddressDatasBean;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Category;
import tad.entity.Province;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private SessionFactory factory;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		UserBean emptyLogin = new UserBean();
		modelMap.addAttribute("admin", emptyLogin);
		return "admin/adminLogin";
	}

	@Autowired
	private IAdminDAO adminDAO;
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(@ModelAttribute("admin") UserBean admin) {

		Account ValidateAdmin = adminDAO.FindUserAdmin(admin.getUsername(), admin.getPassword());
		if (ValidateAdmin != null) {
			System.out.println("Login Success");
			return "redirect:/admin/category.htm";
		}

		return "redirect:/admin.htm";
	}
	
	@Autowired
	private IAddressDAO addressDAO;
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String userRegisterGET(ModelMap model) {
		
		ArrayList<Province> provinceDatas = addressDAO.GetProvinceList();
		AddressDatasBean addrDataBean = new AddressDatasBean();
		AddressBean address = addrDataBean.ConvertToDataAddressBean(provinceDatas);
		model.addAttribute("address", address);
		return "user/userRegister";
	}

	@Autowired
	private ICategoryDAO categoryDAO;

	@RequestMapping("category")
	public String category(ModelMap model) {

		ArrayList<Category> categories = categoryDAO.GetListCategories();
		model.addAttribute("list", categories);

		return "admin/adminCategoryManager";
	}
}
