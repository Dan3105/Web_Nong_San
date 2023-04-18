package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bean.Company;
import dao.ProductDAO;
import entities.Product;

@Controller
public class HomeController {
	@Autowired
	private Company company;
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ProductDAO productDAO;

	@RequestMapping("index")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("company", company);

		return "page/home";
	}

	@RequestMapping("searchFood")

	public String searchFood(@RequestParam(required = false, value = "search") String search, ModelMap modelMap) {
		modelMap.addAttribute("company", company);
		System.out.println(search);
		List<Product> products = productDAO.filterProductByName(search);

		// Data from SQL
		modelMap.addAttribute("products", products);
		return "page/search";

	}

	@RequestMapping("wishlist")
	public String wishlist(ModelMap modelMap) {
		modelMap.addAttribute("company", company);

		// Data from SQL
		return "page/wishlist";

	}

}
