package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.ICategoryDAO;
import tad.DAO.ICouponDAO;
import tad.DAO.IProductDAO;
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Category;
import tad.entity.Product;

@Controller
public class UserHomeController {
	@Autowired
	private Company company;
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private IProductDAO productDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	@Autowired
	private ICouponDAO couponDAO;
	@Autowired
	private IAccountDAO accountDAO;

	@RequestMapping("index")
	public String index(ModelMap modelMap, HttpSession session) {
		// Slider + Banner

		modelMap.addAttribute("company", company);

		List<Category> categoryHasProducts = categoryDAO.listCategoriesHasProducts(3);
		modelMap.addAttribute("categoryHasProducts", categoryHasProducts);

		List<Category> category = categoryDAO.getListCategories();
		modelMap.addAttribute("category", category);

		List<Product> products = productDAO.listProductsWithCoupon();
		modelMap.addAttribute("products", products);

		Account user = (Account) session.getAttribute("account");
		int userId = user == null ? -1 : user.getAccountId();

		return "page/home";
	}

	@RequestMapping("searchFood")
	public String search(@RequestParam(required = false, value = "search") String search, ModelMap modelMap) {
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

	@RequestMapping("login")
	public String login(HttpSession session) {
		// Fake login vào tài khoản số 1
		Account account = accountDAO.getAccount(1);
		System.out.println(account.getLastName() + " " + account.getAccountId());
		session.setAttribute("account", account);
		return "page/home";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("account");
		return "page/home";
	}

}
