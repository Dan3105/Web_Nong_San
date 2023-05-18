package tad.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.ICartDAO;
import tad.DAO.ICategoryDAO;
import tad.DAO.IFeedbackDAO;
import tad.DAO.IProductDAO;
import tad.DAO.IWishlistDAO;
import tad.bean.Company;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.CartId;
import tad.entity.Category;
import tad.entity.Feedback;
import tad.entity.Product;
import tad.entity.Wishlist;
import tad.entity.WishlistId;
import tad.utility.Ultis;

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
	private IWishlistDAO wishlistDAO;

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IFeedbackDAO feedbackDAO;

	@Autowired
	private Company company;

	@RequestMapping(value = "index")

	public String index(ModelMap modelMap) {
		// Slider + Banner
		modelMap.addAttribute("company", company);
		List<Category> category = categoryDAO.getListCategories();
		modelMap.addAttribute("category", category);
		Account user = accountDAO.listAccounts().get(1);
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());
		int totalCart = list.size();
		int totalWishlist = wishlist.size();
		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);
		modelMap.addAttribute("index", 0);
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
		Account user = accountDAO.listAccounts().get(1);
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());
		int totalCart = list.size();
		int totalWishlist = wishlist.size();
		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);
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
		case 4:

		{
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
		modelMap.addAttribute("index", index);
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
				cartDAO.insertCart(cart);

			}

		}

		return "redirect:" + request.getHeader("Referer");

	}

	@RequestMapping(value = "addToWishlist", params = { "productId" })
	public String addToWishlist(ModelMap model, HttpServletRequest request, HttpSession session,
			@RequestParam("productId") int productID) {
		// Lấy tạm thằng account số 1
		Account user = accountDAO.listAccounts().get(1);

		if (user == null) {
			System.out.println("User is null");

		} else {

			Wishlist wishlist = wishlistDAO.getWishlist(user.getAccountId(), productID);
			user = accountDAO.getAccount(user.getAccountId());
			if (wishlist != null) {

			} else {
				wishlist = new Wishlist();
				wishlist.setId(new WishlistId(productID, user.getAccountId()));
				wishlist.setAccount(user);
				wishlist.setProduct(productDAO.getProduct(productID));
				wishlistDAO.insertWishlist(wishlist);

			}

		}

		return "redirect:" + request.getHeader("Referer");

	}

	@RequestMapping(value = "detail", params = { "productId" })
	public String detail(ModelMap modelMap, @RequestParam("productId") int productId,
			@RequestParam(value = "filterStar", required = false, defaultValue = "0") int filterStar) {
		Product product = productDAO.getProduct(productId);
		modelMap.addAttribute("product", product);
		// Slider + Banner
		modelMap.addAttribute("company", company);

		Account user = accountDAO.listAccounts().get(1);
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		List<Wishlist> wishlist = wishlistDAO.getWishlist(user.getAccountId());
		int totalCart = list.size();
		int totalWishlist = wishlist.size();
		modelMap.addAttribute("totalCart", totalCart);
		modelMap.addAttribute("totalWishlist", totalWishlist);

		// 5 sao co bnhiu danh gia, 4 sao co bnhiu danh gia ,...
		List<Feedback> feedbacks = feedbackDAO.listFeedback(productId);
		int[] countStar = new int[6];
		for (int i = 1; i < 6; i++) {
			countStar[i] = 0;
		}

		for (Feedback f : feedbacks) {
			countStar[f.getRatingStar()]++;
		}
		List<Feedback> rateds = feedbackDAO.listByStars(productId, filterStar);
		double avgStar = Ultis.getAvgStar(product);
		List<Product> listProductSameCategory = productDAO
				.listProductsInCategory(product.getCategory().getCategoryId());
		Collections.shuffle(listProductSameCategory);
		listProductSameCategory = listProductSameCategory.subList(0, Math.min(5, listProductSameCategory.size()));
		modelMap.addAttribute("avgStar", avgStar);
		modelMap.addAttribute("countStar", countStar);
		modelMap.addAttribute("feedbacks", feedbacks);
		modelMap.addAttribute("listProductSameCategory", listProductSameCategory);
		modelMap.addAttribute("rateds", rateds);
		System.out.println(rateds.size());
		modelMap.addAttribute("filterStar", filterStar);
		return "product/detail";
	}

	@RequestMapping(value = "rating", params = { "productId", "rating", "content" }, method = RequestMethod.POST)
	public String comment(ModelMap modelMap, HttpServletRequest request, @RequestParam("productId") int productId,
			@RequestParam("rating") int rating, @RequestParam("content") String content) {

		return "redirect:" + request.getHeader("Referer");
	}

}
