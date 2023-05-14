package tad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.bean.Company;
import tad.dao.AccountDAO;
import tad.dao.CartDAO;
import tad.dao.CategoryDAO;
import tad.dao.ProductDAO;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.Category;

@Controller
@RequestMapping("product")
public class AProductController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private CartDAO cartDAO;

	@RequestMapping(value = "addToCart", params = { "productID" })
	public String addToCart(ModelMap model, HttpServletRequest request, HttpSession session,
			@RequestParam("productID") int productID) {
		// Lấy tạm thằng account số 1
		Account user = accountDAO.listAccounts().get(1);

		if (user == null) {
			System.out.println("User is null");

		} else {

			Cart cart = cartDAO.getCart(user.getAccountID(), productID);
			user = accountDAO.getAccount(user.getAccountID());
			if (cart != null) {
				cart.setQuantity(cart.getQuantity() + 1);
				cartDAO.update(cart);
			} else {
				cart = new Cart();
				cart.setAccount(accountDAO.getAccount(user.getAccountID()));
				cart.setProduct(productDAO.getProductById(productID));
				cart.setQuantity(1);
				cartDAO.insert(cart);

			}

		}

		return "redirect:" + request.getHeader("Referer");

	}

}
