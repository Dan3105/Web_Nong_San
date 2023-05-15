package tad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.ICartDAO;
import tad.DAO.IProductDAO;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.CartId;

@Controller
@RequestMapping("/product/")
public class UserProductController {

	@Autowired
	private IProductDAO productDAO;

	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping(value = "addToCart", params = { "productId" })
	public String addToCart(ModelMap model, HttpServletRequest request, HttpSession session,
			@RequestParam("productId") int productID) {
		// Lấy tạm thằng account số 1
		Account user = accountDAO.listAccounts().get(1);

		if (user == null) {
			System.out.println("User is null");

		} else {

			Cart cart = cartDAO.getCart(user.getAccountId(), productID);
			user = accountDAO.getAccount(user.getAccountId());
			if (cart != null) {
				cart.setQuantity(cart.getQuantity() + 1);
				cartDAO.updateCart(cart);
			} else {
				cart = new Cart();
				cart.setId(new CartId(productID, user.getAccountId()));
				cart.setAccount(user);
				cart.setProduct(productDAO.getProduct(productID));
				cart.setQuantity(1);
				boolean s = cartDAO.insertCart(cart);
				

			}

		}

		return "redirect:" + request.getHeader("Referer");

	}

}
