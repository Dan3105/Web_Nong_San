package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.ICartDAO;
import tad.DAO.ICategoryDAO;
import tad.DAO.IProductDAO;
import tad.DAO.IWishlistDAO;
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.Category;
import tad.entity.Product;
import tad.entity.Wishlist;
import tad.utility.Constants;

@Controller
public class UserHomeController {
	@Autowired
	private Company company;
	@Autowired
	private IProductDAO productDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private IWishlistDAO wishlistDAO;
	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping("index")
	public String index(ModelMap modelMap, HttpSession session) {

		// Account user = (Account) session.getAttribute("account");
		// int userId = user == null ? -1 : user.getAccountId();

		List<Category> category = categoryDAO.getListCategories();
		List<Product> products = productDAO.listProductsWithCoupon();
		Account user = accountDAO.getAccount(36);

		// Lay tam
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());

		int totalCart = list.size();
		int totalWishlist = wishlist.size();

		modelMap.addAttribute("company", company);
		modelMap.addAttribute("products",
				products.subList(0, Math.min(Constants.PRODUCT_PER_CATEGORY_IN_HOME, products.size())));
		modelMap.addAttribute("category", category);
		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);
		modelMap.addAttribute("productsWithCategory",
				category.subList(0, Math.min(Constants.CATEGORY_IN_HOME, category.size())));
		// Category đầu tiên để vào mục sản phẩm
		modelMap.addAttribute("firstCategory", category.get(0).getCategoryId());

		return "page/home";
	}

	

	@RequestMapping("wishlist")
	public String wishlist(ModelMap modelMap, HttpSession session) {
		// Lay tam
		Account user = accountDAO.listAccounts().get(1);
		List<Category> category = categoryDAO.getListCategories();
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());

		int totalCart = list.size();
		int totalWishlist = wishlist.size();

		modelMap.addAttribute("company", company);
		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);
		modelMap.addAttribute("firstCategory", category.get(0).getCategoryId());

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
