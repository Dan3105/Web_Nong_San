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
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.Category;

@Controller
@RequestMapping("/cart/")

public class UserCartController {

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
	public String cart(ModelMap model, HttpSession session) {
		float total = 0;
		// Account user = (Account) session.getAttribute("account");
		Account user = (Account) accountDAO.getAccount(39);

		List<Cart> list = (List<Cart>) cartDAO.getCart(user.getAccountId());

		if (list != null) {
			for (Cart c : list) {
				total += c.getQuantity() * c.getProduct().getPrice();
			}

		}

		model.addAttribute("carts", list);
		model.addAttribute("total", total);

		model.addAttribute("company", company);

		List<Category> category = categoryDAO.getListCategories();
		model.addAttribute("category", category);

		return "cart/index";
	}

	@RequestMapping(value = "delete/{productID}.htm")
	public String delete(ModelMap model, HttpSession session, @PathVariable("productID") String productID) {
		// Account user = (Account) session.getAttribute("account");
		// Account user = accountDAO.listAccounts().get(1);
		// cartDAO.delete(cartDAO.getCart(user.getAccountID(),
		// Integer.parseInt(productID)));
		// List<Cart> list = cartDAO.getCart(user.getAccountID());
		// model.addAttribute("cart", list);
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
