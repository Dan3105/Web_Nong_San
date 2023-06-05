package tad.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.ICategoryDAO;
import tad.DAO.ICouponDAO;
import tad.DAO.IProductDAO;
import tad.bean.ProductBean;
import tad.bean.UploadFile;
import tad.entity.Account;
import tad.entity.Category;
import tad.entity.Coupon;
import tad.entity.Product;
import tad.utility.Constants;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/employee/products")
public class EmployeeControllerProducts {

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IProductDAO productDAO;

	@RequestMapping()
	public String gProductList(ModelMap model, HttpSession session,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		Account currentAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (currentAcc == null) {
			return "redirect:/guest.htm";
		}

		List<ProductBean> products = new ArrayList<>();
		List<Product> listProducts = productDAO.listProducts(currentAcc.getAccountId());
		for (Product product : listProducts) {
			ProductBean bean = new ProductBean(product);
			products.add(bean);
		}
       

		int startIndex = (crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME;
		int totalPage = 1;
		if (products.size() <= Constants.PRODUCT_PER_PAGE_IN_HOME)
			totalPage = 1;
		else {
			totalPage = products.size() / Constants.PRODUCT_PER_PAGE_IN_HOME;
			if (products.size() % Constants.PRODUCT_PER_PAGE_IN_HOME != 0) {
				totalPage++;
			}
		}

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("crrPage", crrPage);
		model.addAttribute("products", products.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_HOME, products.size())));
		model.addAttribute("categories", categoryDAO.getListCategories());
		return "employee/employee-product";
	}

	@RequestMapping(value = "delete{id}.htm")
	public String DeleteProduct(@PathVariable("id") int id, HttpSession session) {
		Product findProduct = productDAO.getProduct(id);
		if (findProduct != null) {
			productDAO.deleteProduct(findProduct);
		}

		return String.format("redirect:/employee/products.htm");
	}

	@Autowired
	@Qualifier("productImgDir")
	private UploadFile uploadProductImg;

	@Autowired
	private ConverterUploadHandler converter;
	@Autowired
	private ICouponDAO couponDAO;

	@RequestMapping(value = "update-product{id}.htm", method = RequestMethod.POST)
	public String pUpdateProduct(@PathVariable("id") int id, @ModelAttribute("productForm") ProductBean product) {
		Product findProduct = productDAO.getProduct(id);

		if (findProduct != null) {
			// 1
			Category category = categoryDAO.getCategory(product.getCategoryId());
			if (category != null) {
				findProduct.setCategory(category);
			}

			// 2
			if (product.getDiscountId() != -1) {
				Coupon coupon = couponDAO.getCoupon(product.getDiscountId());
				if (coupon != null) {
					findProduct.setCoupon(coupon);
				}
			}

			// 3
			if (product.getImageFile() != null) {
				if (converter.MoveMultipartToDirectory(product.getImageFile(), uploadProductImg.getPath())) {
					findProduct.setImage(converter.SetImageNameViaMultipartFile(product.getImageFile()));
				}
			}

			// 4
			findProduct.setProductName(product.getProductName());
			// 5
			findProduct.setPrice(product.getPrice());
			// 6
			findProduct.setQuantity(product.getQuantity());
			// 7
			findProduct.setDetail(product.getDetail());
			// 8
			findProduct.setPostingDate(product.getPostingDate());
			
			if (!productDAO.updateProduct(findProduct)) {
				System.out.println("checking error");
			}
		}

		return String.format("redirect:/employee/products.htm");
	}
	
	@RequestMapping("searchProduct")
	public String search(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "currentPage", defaultValue = "1") int currentPage,
			ModelMap modelMap) {

		List<Product> products = productDAO.filterProductByName(search);

		int startIndex = (currentPage - 1) * Constants.PRODUCT_PER_PAGE_IN_CATEGORY;
		int totalPage = 1;
		if (products.size() <= Constants.PRODUCT_PER_PAGE_IN_CATEGORY)
			totalPage = 1;
		else {
			totalPage = products.size() / Constants.PRODUCT_PER_PAGE_IN_CATEGORY;
			if (products.size() % Constants.PRODUCT_PER_PAGE_IN_CATEGORY != 0) {
				totalPage++;
			}
		}

		modelMap.addAttribute("products", products.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_CATEGORY, products.size())));
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("total", products.size());
		return "redirect://employee/products.htm";
	}

	@RequestMapping(value = "create-product.htm", method = RequestMethod.POST)
	public String pCreateProduct(@ModelAttribute("productBean") ProductBean product, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:employee/logout.htm";
		}
		Product newProduct = new Product();
		// 0
		newProduct.setAccount(acc);
		// 1
		Category category = categoryDAO.getCategory(product.getCategoryId());
		if (category != null) {
			newProduct.setCategory(category);
		} else {
			System.out.println(product.getCategoryId() + "doesnt exissst");
			return "redirect:/employee/products.htm";
		}

		// 2
		if (product.getDiscountId() != -1) {
			Coupon coupon = couponDAO.getCoupon(product.getDiscountId());
			if (coupon != null) {
				newProduct.setCoupon(coupon);
			}
		}

		// 3
		if (product.getImageFile() != null) {
			if (converter.MoveMultipartToDirectory(product.getImageFile(), uploadProductImg.getPath())) {
				newProduct.setImage(converter.SetImageNameViaMultipartFile(product.getImageFile()));
			}
		}

		// 4
		newProduct.setProductName(product.getProductName());
		// 5
		newProduct.setPrice(product.getPrice());
		// 6
		newProduct.setQuantity(product.getQuantity());
		// 7
		newProduct.setDetail(product.getDetail());
		// 8
		newProduct.setPostingDate(product.getPostingDate());

		if (!productDAO.insertProduct(newProduct)) {
			System.out.println("error in adding");
		}

		return String.format("redirect:/employee/products.htm");
	}
}
