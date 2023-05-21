package tad.controller;

import java.util.List;

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
public class UserSearchController {
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

	@RequestMapping("searchFood")
	public String search(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "currentPage", defaultValue = "1") int currentPage,
			ModelMap modelMap) {
		// Lay tam
		Account user = accountDAO.getAccount(36);
		List<Category> category = categoryDAO.getListCategories();
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());
		List<Product> products = productDAO.filterProductByName(search);
		int totalCart = list.size();
		int totalWishlist = wishlist.size();

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

		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);
		modelMap.addAttribute("company", company);
		modelMap.addAttribute("category", category);
		modelMap.addAttribute("products",
				products.subList(startIndex, Math.min(startIndex + Constants.PRODUCT_PER_PAGE, products.size())));
		modelMap.addAttribute("firstCategory", category.get(0).getCategoryId());
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("total", products.size());

		return "search/index";
	}
}
