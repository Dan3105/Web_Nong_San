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

	// Trả về ds giỏ hàng
	@RequestMapping(value = "index")
	public String cart(ModelMap model, HttpSession session) {

		Account account = (Account) session.getAttribute("account");

		List<Wishlist> list = wishlistDAO.getWishlist(account.getAccountId());

		model.addAttribute("wishlists", list);

		return "wishlist/index";
	}

	@RequestMapping(value = "delete/{productID}.htm")
	public String delete(ModelMap model, HttpSession session, @PathVariable("productID") String productID) {
		Account account = (Account) session.getAttribute("account");
		wishlistDAO.deleteWishlist(wishlistDAO.getWishlist(account.getAccountId(), Integer.parseInt(productID)));
		List<Wishlist> list = wishlistDAO.getWishlist(account.getAccountId());
		model.addAttribute("wishlists", list);
		return "redirect:/wishlist/index.htm";
	}

	@RequestMapping(value = "addToCart/{productID}.htm")
	public String addToCart(ModelMap model, HttpServletRequest request, HttpSession session,
			@PathVariable("productID") String productID) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			System.out.println("account is null");

		} else {

			Cart cart = cartDAO.getCart(account.getAccountId(), Integer.parseInt(productID));
			account = accountDAO.getAccount(account.getAccountId());
			if (cart != null) {
				cart.setQuantity(cart.getQuantity() + 1);
				cartDAO.updateCart(cart);
			} else {
				cart = new Cart();
				cart.setId(new CartId(Integer.parseInt(productID), account.getAccountId()));
				cart.setAccount(account);
				cart.setProduct(productDAO.getProduct(Integer.parseInt(productID)));
				cart.setQuantity(1);
				cartDAO.insertCart(cart);

			}

			wishlistDAO.deleteWishlist(wishlistDAO.getWishlist(account.getAccountId(), Integer.parseInt(productID)));
			List<Wishlist> list = wishlistDAO.getWishlist(account.getAccountId());
			model.addAttribute("wishlists", list);
		}

		return "redirect:" + request.getHeader("Referer");

	}

}
