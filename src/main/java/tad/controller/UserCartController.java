package tad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.ICartDAO;
import tad.DAO.ICategoryDAO;
import tad.DAO.IWishlistDAO;
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.Category;
import tad.entity.Wishlist;

@Controller
@RequestMapping("/cart/")

public class UserCartController {

	@Autowired
	private ICartDAO cartDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	private Company company;
	@Autowired
	private IWishlistDAO wishlistDAO;

	// Trả về ds giỏ hàng
	@RequestMapping(value = "index")
	public String cart(ModelMap modelMap, HttpSession session) {

		float subtotal = 0;
		// Account user = (Account) session.getAttribute("account");
		Account user = accountDAO.getAccount(36);

		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Category> category = categoryDAO.getListCategories();
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());
		List<Category> category1 = categoryDAO.getListCategories();
		int canCheckOut = 1;

		if (list != null) {
			for (Cart c : list) {
				// Chi tinh nhung sp con hang
				if (c.getProduct().getQuantity() > 0) {
					subtotal += c.getQuantity() * c.getProduct().getPrice();

				}

			}

			for (Cart c : list) {
				if (c.getProduct().getQuantity() == 0) {
					canCheckOut = 0;
					break;
				}
			}

		}

		int totalCart = list.size();
		int totalWishlist = wishlist.size();

		modelMap.addAttribute("company", company);
		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);
		modelMap.addAttribute("firstCategory", category.get(0).getCategoryId());
		modelMap.addAttribute("carts", list);
		modelMap.addAttribute("subtotal", subtotal);
		modelMap.addAttribute("category", category1);
		modelMap.addAttribute("canCheckOut", canCheckOut);

		return "cart/index";
	}

	@RequestMapping(value = "delete/{productID}.htm")
	public String delete(ModelMap model, HttpSession session, @PathVariable("productID") String productID) {
		// Account user = (Account) session.getAttribute("account");
		Account user = accountDAO.getAccount(36);
		cartDAO.deleteCart(cartDAO.getCart(user.getAccountId(), Integer.parseInt(productID)));
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		model.addAttribute("carts", list);
		return "redirect:/cart/index.htm";
	}

	@RequestMapping(value = "quantity/plus", params = { "productID", "quantity" })
	public String qtyPlus(ModelMap model, @RequestParam("productID") int id, @RequestParam("quantity") int qty) {
		cartDAO.updateQuantity(id, qty + 1);

		return "redirect:/cart/index.htm";
	}

	@RequestMapping(value = "quantity/minus", params = { "productID", "quantity" })
	public String qtyMinus(ModelMap model, @RequestParam("productID") int id, @RequestParam("quantity") int qty) {
		cartDAO.updateQuantity(id, qty - 1);
		return "redirect:/cart/index.htm";
	}

}
