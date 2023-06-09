package tad.controller.employee;

import java.io.File;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/employee/products")
public class EmployeeControllerProducts {

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IProductDAO productDAO;

	@Autowired
	@Qualifier("productImgDir")
	private UploadFile productImgDir;

	@Autowired
	@Qualifier("rootFile")
	private UploadFile rootFile;

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

		return "employee/employee-product";
	}

	@RequestMapping(value = "delete")
	public String DeleteProduct(@RequestParam("id") int id, HttpSession session, RedirectAttributes reAttributes) {
		Product findProduct = productDAO.getProduct(id);
		if (findProduct != null) {
			if (productDAO.deleteProduct(findProduct)) {
				reAttributes.addFlashAttribute("alert", 2);

			}
		}
		reAttributes.addFlashAttribute("alert", 1);

		return String.format("redirect:/employee/products.htm");
	}

	@Autowired
	@Qualifier("productImgDir")
	private UploadFile uploadProductImg;

	@Autowired
	private ICouponDAO couponDAO;

	@RequestMapping(value = "update-product")
	public String updateProduct(ModelMap model, @RequestParam("id") int id, HttpSession session) {
		Account currentAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		Product findProduct = productDAO.getProduct(id);
		ProductBean beanForm = new ProductBean(findProduct);
		model.addAttribute("productForm", beanForm);
		Account tacc = couponDAO.FetchAccountCoupon(currentAcc);
		model.addAttribute("categories", categoryDAO.getListCategories());
		model.addAttribute("coupons", tacc.getCoupons());
		model.addAttribute("mess", "update");
		return "employee/employee-createProduct";

	}

	@RequestMapping(value = "update-product", method = RequestMethod.POST)
	public String pUpdateProduct(ModelMap model, @ModelAttribute("productForm") ProductBean product) {
		Product findProduct = productDAO.getProduct(product.getProductId());

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
			if (!product.getImageFile().isEmpty()) {
				File file = new File(rootFile.getPath() + product.getImageFile());
				if (file.exists())
					file.delete();

				String avatarPath = productImgDir.getPath() + product.getImageFile();
				findProduct.setImage(product.getImageFile().getOriginalFilename());

				try {
					product.getImageFile().transferTo(new File(avatarPath));
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", 1);
					model.addAttribute("productBean", product);
					return "employee/employee-createProduct";
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

		if (productDAO.updateProduct(findProduct))
			model.addAttribute("alert", 4);

		return "redirect:/employee/products.htm";
	}

	@RequestMapping("searchProduct")
	public String search(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "currPage", defaultValue = "1") int crrPage, ModelMap modelMap) {

		List<ProductBean> products = new ArrayList<>();
		List<Product> listProducts = productDAO.filterProductByName(search);
		for (Product p : listProducts) {
			ProductBean bean = new ProductBean(p);
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

		modelMap.addAttribute("products", products.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_CATEGORY, products.size())));
		modelMap.addAttribute("crrPage", crrPage);
		modelMap.addAttribute("totalPage", totalPage);
		return "employee/employee-product";
	}

	@RequestMapping(value = "create-product.htm", method = RequestMethod.GET)
	public String createProduct(ModelMap model, HttpSession session) {

		Account currentAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (currentAcc == null) {
			return "redirect:/guest.htm";
		}

		ProductBean beanForm = new ProductBean();
		model.addAttribute("productForm", beanForm);
		Account tacc = couponDAO.FetchAccountCoupon(currentAcc);
		model.addAttribute("categories", categoryDAO.getListCategories());
		model.addAttribute("coupons", tacc.getCoupons());

		return "employee/employee-createProduct";
	}

	@RequestMapping(value = "create-product.htm")
	public String pCreateProduct(ModelMap model, @ModelAttribute("productForm") ProductBean product,
			HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);

		if (acc == null) {
			return "redirect:/guest.htm";
		}
		Product newProduct = new Product();
		newProduct.setAccount(acc);
		Category category = categoryDAO.getCategory(product.getCategoryId());
		if (category != null) {
			newProduct.setCategory(category);
		} else {
			model.addAttribute("mess", "Category ko ton tai");
			return "employee/employee-createProduct";
		}

		if (product.getDiscountId() != -1) {
			Coupon coupon = couponDAO.getCoupon(product.getDiscountId());
			if (coupon != null) {
				newProduct.setCoupon(coupon);
			}
		}

		if (product.getImageFile() != null) {

			File file = new File(rootFile.getPath() + product.getImageFile());
			if (file.exists())
				file.delete();

			String avatarPath = productImgDir.getPath() + product.getImageFile();
			newProduct.setImage(product.getImageFile().getOriginalFilename());

			try {
				product.getImageFile().transferTo(new File(avatarPath));
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", 1);
				model.addAttribute("productBean", product);
				return "employee/employee-createProduct";
			}
		}

		newProduct.setProductName(product.getProductName());
		newProduct.setPrice(product.getPrice());
		newProduct.setQuantity(product.getQuantity());
		newProduct.setDetail(product.getDetail());
		Date in = new Date();
		LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
		Date out = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
		newProduct.setPostingDate(out);

		if (!productDAO.insertProduct(newProduct)) {
			model.addAttribute("mess", "Loi khi them");
		}

		return "employee/employee-createProduct";
	}
}