package tad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import tad.DAO.IProductDAO;
import tad.DAO.IWishlistDAO;
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.CartId;
import tad.entity.Category;
import tad.entity.Wishlist;

@Controller
@RequestMapping("/wishlist/")

public class UserWishlistController {

	@Autowired
	private IWishlistDAO wishlistDAO;
	@Autowired
	private IProductDAO productDAO;
	@Autowired
	private ICartDAO cartDAO;
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private Company company;
	@Autowired
	private ICategoryDAO categoryDAO;

	// Trả về ds giỏ hàng
	@RequestMapping(value = "index")
	public String cart(ModelMap model) {

		// Account user = (Account) session.getAttribute("account");
		Account user = accountDAO.getAccount(36);
		List<Wishlist> list = wishlistDAO.getWishlist(user.getAccountId());
		List<Cart> listCart = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());
		List<Category> category = categoryDAO.getListCategories();

		int totalCart = listCart.size();
		int totalWishlist = wishlist.size();

		model.addAttribute("wishlists", list);
		model.addAttribute("company", company);
		model.addAttribute("totalCart", totalCart);
		model.addAttribute("totalWishlist", totalWishlist);
		model.addAttribute("category", category);

		return "wishlist/index";
	}

	@RequestMapping(value = "delete/{productID}.htm")
	public String delete(ModelMap model, HttpSession session, @PathVariable("productID") String productID) {
		// Account user = (Account) session.getAttribute("account");
		Account user = accountDAO.getAccount(36);
		wishlistDAO.deleteWishlist(wishlistDAO.getWishlist(user.getAccountId(), Integer.parseInt(productID)));
		List<Wishlist> list = wishlistDAO.getWishlist(user.getAccountId());
		model.addAttribute("wishlists", list);
		return "redirect:/wishlist/index.htm";
	}

	@RequestMapping(value = "addToCart/{productID}.htm")
	public String addToCart(ModelMap model, HttpServletRequest request, HttpSession session,
			@PathVariable("productID") String productID) {
		// Lấy tạm thằng account số 1
		Account user = accountDAO.getAccount(36);

		if (user == null) {
			System.out.println("User is null");

		} else {

			Cart cart = cartDAO.getCart(user.getAccountId(), Integer.parseInt(productID));
			user = accountDAO.getAccount(user.getAccountId());
			if (cart != null) {
				cart.setQuantity(cart.getQuantity() + 1);
				cartDAO.updateCart(cart);
			} else {
				cart = new Cart();
				cart.setId(new CartId(Integer.parseInt(productID), user.getAccountId()));
				cart.setAccount(user);
				cart.setProduct(productDAO.getProduct(Integer.parseInt(productID)));
				cart.setQuantity(1);
				cartDAO.insertCart(cart);

			}

			wishlistDAO.deleteWishlist(wishlistDAO.getWishlist(user.getAccountId(), Integer.parseInt(productID)));
			List<Wishlist> list = wishlistDAO.getWishlist(user.getAccountId());
			model.addAttribute("wishlists", list);
		}

		return "redirect:" + request.getHeader("Referer");

	}

}
