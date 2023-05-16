package tad.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.CartId;
import tad.entity.Category;
import tad.entity.Feedback;
import tad.entity.Product;

@Controller
@RequestMapping("/product/")
public class UserProductController {

	@Autowired
	private IProductDAO productDAO;

	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	private ICartDAO cartDAO;

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private Company company;

	@RequestMapping("index")
	public String index(ModelMap modelMap) {
		// Slider + Banner
		modelMap.addAttribute("company", company);
		List<Category> category = categoryDAO.getListCategories();
		modelMap.addAttribute("category", category);
		return "product/index";
	}

	@RequestMapping(value = "index", params = { "categoryId" })
	public String indexWithParams(ModelMap modelMap, @RequestParam("categoryId") int categoryId) {
		// Slider + Banner
		modelMap.addAttribute("company", company);
		List<Category> category = categoryDAO.getListCategories();
		modelMap.addAttribute("category", category);
		List<Product> productsFilterWithCategory = productDAO.listProductsInCategory(categoryId);
		modelMap.addAttribute("productsFilterWithCategory", productsFilterWithCategory);
		Category currentCategory = categoryDAO.getCategory(categoryId);
		modelMap.addAttribute("currentCategory", currentCategory);
		return "product/index";

	}

	@RequestMapping(value = "filter", params = { "index", "categoryId" })
	public String filter(ModelMap modelMap, @RequestParam("index") int index,
			@RequestParam("categoryId") int categoryId) {
		// Slider + Banner
		modelMap.addAttribute("company", company);
		List<Category> category = categoryDAO.getListCategories();
		modelMap.addAttribute("category", category);
		List<Product> productsFilterWithCategory = productDAO.listProductsInCategory(categoryId);

		switch (index) {
		case 0: {
			productsFilterWithCategory = productDAO.listProductsInCategory(categoryId);
			break;
		}
		case 1: {
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					double price1 = o1.getPrice();
					double price2 = o2.getPrice();
					if (o1.getCoupon() != null)
						price1 -= o1.getPrice() * o1.getCoupon().getDiscount();
					if (o2.getCoupon() != null)
						price2 -= o2.getPrice() * o2.getCoupon().getDiscount();

					if (price2 < price1)
						return 1;
					else if (price2 > price1)
						return -1;
					return 0;
				}

			});

			break;
		}
		case 2: {
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					double price1 = o1.getPrice();
					double price2 = o2.getPrice();
					if (o1.getCoupon() != null)
						price1 -= o1.getPrice() * o1.getCoupon().getDiscount();
					if (o2.getCoupon() != null)
						price2 -= o2.getPrice() * o2.getCoupon().getDiscount();

					if (price1 < price2)
						return 1;
					else if (price1 > price2)
						return -1;
					return 0;
				}
			});
			break;
		}
		case 3: {
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					return (o1.getPostingDate().compareTo(o2.getPostingDate()));
				}
			});
			break;
		}
		case 4: {
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					double ra = 0, rb = 0;

					if (o1.getFeedbacks() != null && o1.getFeedbacks().size() > 0) {
						for (Feedback f : o1.getFeedbacks()) {
							ra += f.getRatingStar();
						}
						ra /= o1.getFeedbacks().size();
					}

					if (o2.getFeedbacks() != null && o2.getFeedbacks().size() > 0) {
						for (Feedback f : o2.getFeedbacks()) {
							rb += f.getRatingStar();
						}
						rb /= o2.getFeedbacks().size();
					}
					if (ra < rb)
						return 1;
					else if (ra > rb)
						return -1;
					return 0;
				}
			});
			break;
		}

		}
		Category currentCategory = categoryDAO.getCategory(categoryId);
		modelMap.addAttribute("currentCategory", currentCategory);
		modelMap.addAttribute("productsFilterWithCategory", productsFilterWithCategory);

		return "product/index";
	}

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
