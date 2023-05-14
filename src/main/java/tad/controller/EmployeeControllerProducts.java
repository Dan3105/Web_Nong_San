package tad.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

import tad.DAO.ICategoryDAO;
import tad.DAO.ICouponDAO;
import tad.DAO.IProductDAO;
import tad.bean.ProductBean;
import tad.bean.UploadFile;
import tad.entity.Account;
import tad.entity.Category;
import tad.entity.Coupon;
import tad.entity.Product;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/employee/products")
public class EmployeeControllerProducts {
	@Autowired
	private SessionFactory factory;

	@Autowired
	private ICategoryDAO categoryDAO;

	@Autowired
	private IProductDAO productDAO;

	@RequestMapping()
	public String gProductList(ModelMap model, HttpSession session) {
		Account currentAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (currentAcc == null) {
			return "redirect:/";
		}

		Account tacc = productDAO.FetchProductsAccount(currentAcc);
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		for (Product product : tacc.getProducts()) {
			ProductBean bean = new ProductBean(product);
			products.add(bean);
		}

		ProductBean beanForm = new ProductBean();

		model.addAttribute("products", products);
		model.addAttribute("categories", categoryDAO.GetListCategories());
		model.addAttribute("productForm", beanForm);
		return "employee/employee-product";
	}

	@RequestMapping(value = "delete{id}.htm", method = RequestMethod.POST)
	public String pDeleteProduct(@PathVariable("id") int id) {
		Product findProduct = productDAO.GetProduct(id);
		if (findProduct != null) {
			productDAO.delete(findProduct);
		}
		// productDAO.delete(null)
		return "redirect:/employee/products.htm";
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
		Product findProduct = productDAO.GetProduct(id);

		if (findProduct != null) {
			// 1
			Category category = categoryDAO.GetCategory(product.getCategoryId());
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
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date = format.parse(product.getPostingDate());
				findProduct.setPostingDate(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(productDAO.update(findProduct) == false) { System.out.println("checking error");}
		}

		return "redirect:/employee/products.htm";
	}

	@RequestMapping(value = "create-product.htm", method = RequestMethod.POST)
	public String pCreateProduct(@ModelAttribute("productBean") ProductBean product, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if(acc == null)
		{
			return "redirect:employee/logout.htm";
		}
		Product newProduct = new Product();
		//0
		newProduct.setAccount(acc);
		//1
		Category category = categoryDAO.GetCategory(product.getCategoryId());
		if (category != null) {
			newProduct.setCategory(category);
		}
		else
		{
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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = format.parse(product.getPostingDate());
			newProduct.setPostingDate(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(productDAO.insert(newProduct) == false)
		{
			System.out.println("error in adding");
		}
		
		return "redirect:/employee/products.htm";
	}
}
