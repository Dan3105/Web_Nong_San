package tad.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.bean.Company;
import tad.dao.CategoryDAO;
import tad.entity.Category;

@Controller
@RequestMapping(value = "account")
public class AccountController {

	@Autowired
	private Company company;
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = "index")
	public String index(ModelMap modelMap) {
		// Slider + Banner
		modelMap.addAttribute("company", company);

		List<Category> category = categoryDAO.listCategories();
		modelMap.addAttribute("category", category);

		return "account/index";
	}

}
