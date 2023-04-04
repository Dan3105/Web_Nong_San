package tad.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.bean.CategoryBean;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping()
	public String index() {
		return "admin/adminLogin";
	}

	@RequestMapping("user")
	public String user() {
		return "admin/adminUserManager";
	}

	@RequestMapping("category")
	public String category(ModelMap model) {

		ArrayList<CategoryBean> categories = new ArrayList<>();
		categories.add(new CategoryBean("Hat dua"));
		categories.add(new CategoryBean("Banana"));
		categories.add(new CategoryBean("Apple"));
		categories.add(new CategoryBean("Lowkey"));
		categories.add(new CategoryBean("Fruit"));
		categories.add(new CategoryBean("Onion"));
		categories.add(new CategoryBean("Vegtable"));
		model.addAttribute("list", categories);

		return "admin/adminCategoryManager";
	}
}
