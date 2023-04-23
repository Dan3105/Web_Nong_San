package tad.controller;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAddressDAO;
import tad.DAO.ICategoryDAO;
import tad.bean.CategoryBean;
import tad.entity.Category;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private SessionFactory factory;

	@Autowired
	private IAddressDAO addressDAO;

	/*
	 * @RequestMapping(value = "register", method = RequestMethod.GET) public String
	 * userRegisterGET(ModelMap model) {
	 * 
	 * ArrayList<Province> provinceDatas = addressDAO.GetProvinceList();
	 * AddressDatasBean addrDataBean = new AddressDatasBean(); AddressBean address =
	 * addrDataBean.ConvertToDataAddressBean(provinceDatas);
	 * model.addAttribute("address", address); return "user/userRegister"; }
	 */
	@Autowired
	private ICategoryDAO categoryDAO;

	@RequestMapping("category")
	public String category(ModelMap model) {

		ArrayList<CategoryBean> categories = CategoryBean.ConvertListCategory(categoryDAO.GetListCategories());
		model.addAttribute("list", categories);

		return "admin/admin-category";
	}
	
	@RequestMapping(value = "/category/edit{id}.htm")
	public String categoryEdit(@PathVariable("id") int id, @RequestParam("inputCategory{id}") String valueInput)
	{
		Category category = categoryDAO.GetCategory(id);
		categoryDAO.EditCategory(category);
		System.out.println(valueInput);
		return "redirect:/admin/category.htm";
	}

	@RequestMapping("overview")
	public String overview(ModelMap model) {
		return "admin/admin-menu";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "redirect:/admin/overview.htm";
	}
}
