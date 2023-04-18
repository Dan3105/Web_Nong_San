package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.Cart;

@Controller
public class CartController {
	@RequestMapping(value = "add/{productId}.htm")
	public String addView(ModelMap modelMap, HttpSession session, @PathVariable("productID") int productID) {
		@SuppressWarnings("unchecked")
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("mycartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();

		}
		modelMap.addAttribute("mycartItems", cartItems);
		return "page/home";

	}

	@RequestMapping(value = "remove{productID}.htm")
	public String remove(ModelMap modelMap, HttpSession session, @PathVariable("productID") int productID) {
		@SuppressWarnings("unchecked")
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("mycartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();

		}
		if (cartItems.containsKey(productID)) {
			cartItems.remove(productID);

		}
		modelMap.addAttribute("mycartItems", cartItems);
		modelMap.addAttribute("mycartTotal", totalPrice(cartItems));
		modelMap.addAttribute("mycartItems", cartItems);
		return "page/home";

	}

	public double totalPrice(HashMap<Integer, Cart> cartItems) {
		double total = 0;
		for (Entry<Integer, Cart> list : cartItems.entrySet()) {
			total += list.getValue().getTotalPrice();

		}
		return total;
	}

}
