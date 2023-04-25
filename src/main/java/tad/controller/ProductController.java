package tad.controller;

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
import tad.entity.Account;
import tad.entity.Cart;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private IProductDAO foodDAO;

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping(value = "card", params = { "productID" })
	public String addToCart(ModelMap model, HttpSession session, @RequestParam("productID") int productID) {
		/*
		 * Account user = accountDAO.listAccounts().get(0);
		 * 
		 * if (user == null) { System.out.println("User is null");
		 * 
		 * } else {
		 * 
		 * Cart cart = cartDAO.getCart(user.getAccountId(), productID);
		 * 
		 * if (cart != null) { System.out.println("them roi, them lại làm gì nữa: " +
		 * cart.getQuantity()); } else { cart = new Cart(); cart(new
		 * CartId(user.getAccountID(), productID)); cart.setQuantity(1);
		 * 
		 * boolean added = cartDAO.insert(cart); System.out.println(added ? "OK Add" :
		 * "Fail Add"); }
		 * 
		 * }
		 */
		return "page/cart";
	}

}
