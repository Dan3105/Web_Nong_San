package tad.controller;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping("overview")
	public String overview(ModelMap model) {
		return "admin/admin-menu";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "redirect:/admin/overview.htm";
	}

	@Autowired
	private ICategoryDAO categoryDAO;

	@RequestMapping("category")
	public String gCategoryList(ModelMap model) {

		ArrayList<CategoryBean> categories = CategoryBean.ConvertListCategory(categoryDAO.GetListCategories());
		model.addAttribute("list", categories);

		return "admin/admin-category";
	}

	@RequestMapping(value = "category/add")
	public String gCategoryAdd(ModelMap modelMap) {
		Category category = new Category();
		CategoryBean categoryBean = new CategoryBean(category.getCategoryId(), category.getName(), category.getImage());
		modelMap.addAttribute("addBean", categoryBean);
		return "admin/admin-category-form";
	}

	@RequestMapping(value = "category/update{id}")
	public String gCategoryUpdate(@PathVariable("id") int id, ModelMap modelMap) {
		Category category = categoryDAO.GetCategory(id);
		CategoryBean categoryBean = new CategoryBean(category);
		modelMap.addAttribute("updateBean", categoryBean);
		return "admin/admin-category-form";
	}

	@RequestMapping(value = "category/add", method = RequestMethod.POST)
	public String pCategoryAdd(@ModelAttribute("addBean") CategoryBean categoryBean) {
		Category category = new Category();
		category.setImage(categoryBean.getImage());
		category.setName(categoryBean.getName());

		categoryDAO.AddCategory(category);

		return "redirect:/admin/category.htm";
	}

	@RequestMapping(value = "category/update", method = RequestMethod.POST)
	public String pCategoryUpdate(@ModelAttribute("updateBean") CategoryBean categoryBean) {
		Category category = categoryDAO.GetCategory(categoryBean.getId());
		if(category != null)
		{
			category.setName(categoryBean.getName());
			categoryDAO.EditCategory(category);
			
		}
		else
		{
			System.out.println(String.format("Error in getting id: %d", categoryBean.getId()));
		}
		return "redirect:/admin/category.htm";
	}

}
