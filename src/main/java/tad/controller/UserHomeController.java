package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.IAddressDAO;
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
	private IAddressDAO addressDAO;
	@Autowired
	private IWishlistDAO wishlistDAO;
	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping("index")
	public String index(ModelMap modelMap, HttpSession session) {

		// Account user = (Account) session.getAttribute("account");
		Account account = accountDAO.getAccount(36);

		String hashed = BCrypt.hashpw(account.getPassword(), BCrypt.gensalt(12));

		List<Category> category = categoryDAO.getListCategories();
		List<Product> products = productDAO.listProductsWithCoupon();
		List<Cart> list = cartDAO.getCart(account.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(account.getAccountId());

		int totalCart = list.size();
		int totalWishlist = wishlist.size();

		session.setAttribute("company", company);
		session.setAttribute("category", category);
		session.setAttribute("totalCart", totalCart);
		session.setAttribute("totalWishlist", totalWishlist);
		session.setAttribute("firstCategory", category.get(0).getCategoryId());
		session.setAttribute("account", account);

		modelMap.addAttribute("productsWithCategory",
				category.subList(0, Math.min(Constants.CATEGORY_IN_HOME, category.size())));
		modelMap.addAttribute("products",
				products.subList(0, Math.min(Constants.PRODUCT_PER_CATEGORY_IN_HOME, products.size())));
		return "page/home";
	}

	@RequestMapping("searchFood")
	public String search(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "currentPage", defaultValue = "1") int currentPage,
			ModelMap modelMap) {

		List<Product> products = productDAO.filterProductByName(search);

		int startIndex = (currentPage - 1) * Constants.PRODUCT_PER_PAGE;
		int totalPage = 1;
		if (products.size() <= Constants.PRODUCT_PER_PAGE)
			totalPage = 1;
		else {
			totalPage = products.size() / Constants.PRODUCT_PER_PAGE;
			if (products.size() % Constants.PRODUCT_PER_PAGE != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("products",
				products.subList(startIndex, Math.min(startIndex + Constants.PRODUCT_PER_PAGE, products.size())));
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("total", products.size());

		return "search/index";
	}

	@RequestMapping("login")
	public String login(HttpSession session) {
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
