package tad.controller;

import javax.servlet.http.HttpSession;

import tad.dao.AccountDAO;
import tad.dao.CartDAO;
import tad.dao.CategoryDAO;
import tad.dao.ProductDAO;
import tad.entities.Account;
import tad.entities.Cart;
import tad.entities.CartKey;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductDAO foodDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private CartDAO cartDAO;

	@RequestMapping(value = "card", params = { "productID" })
	public String addToCart(ModelMap model, HttpSession session, @RequestParam("productID") int productID) {
		Account user = accountDAO.listAccounts().get(0);

		if (user == null) {
			System.out.println("User is null");

		} else {
			
			Cart cart = cartDAO.getCart(user.getAccountID(), productID);

			if (cart != null) {
				System.out.println("them roi, them lại làm gì nữa: " + cart.getQuantity());
			} else {
				cart = new Cart();
				cart.setCartId(new CartKey(user.getAccountID(), productID));
				cart.setQuantity(1);

				boolean added = cartDAO.insert(cart);
				System.out.println(added ? "OK Add" : "Fail Add");
			}

		}
		return "page/cart";
	}

}
