package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.cglib.core.Local;
import tad.bean.Company;
import tad.dao.CategoryDAO;
import tad.dao.CouponDAO;
import tad.dao.ProductDAO;
import tad.entities.Category;
import tad.entities.Coupon;
import tad.entities.Product;

@Controller
public class HomeController {
	@Autowired
	private Company company;
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private CouponDAO couponDAO;

	@RequestMapping("index")
	public String index(ModelMap modelMap) {
		// Slider + Banner
		modelMap.addAttribute("company", company);

		List<Category> categoryHasProducts = categoryDAO.listCategoriesHasProducts(3);
		modelMap.addAttribute("categoryHasProducts", categoryHasProducts);

		List<Category> category = categoryDAO.listCategories();
		modelMap.addAttribute("category", category);

		List<Product> products = productDAO.listProductsWithCoupon();
		modelMap.addAttribute("products", products);

		return "page/home";
	}

	@RequestMapping("searchFood")

	public String searchFood(@RequestParam(required = false, value = "search") String search, ModelMap modelMap) {
		modelMap.addAttribute("company", company);
		List<Product> products = productDAO.filterProductByName(search);

		// Data from SQL
		modelMap.addAttribute("products", products);
		return "page/search";

	}

	@RequestMapping("wishlist")
	public String wishlist(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("company", company);

		// Data from SQL
		return "page/wishlist";

	}

}
