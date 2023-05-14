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

import tad.DAO.ICouponDAO;
import tad.bean.CouponBean;
import tad.bean.ProductBean;
import tad.bean.UploadFile;
import tad.entity.Account;
import tad.entity.Category;
import tad.entity.Coupon;
import tad.entity.Product;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/employee/vouchers")
public class EmployeeControllerVouchers {
	@Autowired
	private SessionFactory factory;

	@Autowired
	private ICouponDAO couponDAO;

	@RequestMapping()
	public String gVoucherList(ModelMap model, HttpSession session) {
		Account currentAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (currentAcc == null) {
			return "redirect:/";
		}

		Account tacc = couponDAO.FetchAccountCoupon(currentAcc);
		if (tacc != null) {
			ArrayList<CouponBean> coupons = new ArrayList<CouponBean>();
			for (Coupon coupon : tacc.getCoupons()) {
				CouponBean cp = new CouponBean(coupon);
				coupons.add(cp);
			}
			model.addAttribute("coupons", coupons);
		}
		CouponBean cbean = new CouponBean();
		model.addAttribute("couponBean", cbean);
		return "employee/employee-voucher";
	}

	@RequestMapping(value = "update-voucher{id}.htm", method = RequestMethod.POST)
	public String pUpdateProduct(@PathVariable("id") int id, @ModelAttribute("couponBean") CouponBean coupon) {
		Coupon findCoupon = couponDAO.getCoupon(id);

		if (findCoupon != null) {
			// 4
			findCoupon.setName(coupon.getName());
			// 5
			findCoupon.setStatus(coupon.getStatus());
			// 6
			findCoupon.setQuantity(coupon.getQuantity());
			// 7
			findCoupon.setDetail(coupon.getDetail());
			findCoupon.setDiscount(coupon.getDiscount());			// 8
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date date = format.parse(coupon.getPostingDate());
				findCoupon.setPostingDate(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "redirect:/employee/vouchers.htm";
			}

			try {
				Date date = format.parse(coupon.getExpiryDate());
				findCoupon.setExpiryDate(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (couponDAO.update(findCoupon) == false) {
				System.out.println("checking error");
			}
		}

		return "redirect:/employee/vouchers.htm";
	}

	@RequestMapping(value = "create-coupon.htm", method = RequestMethod.POST)
	public String pCreateProduct(@ModelAttribute("couponBean") CouponBean coupon, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:employee/logout.htm";
		}
		Coupon findCoupon = new Coupon();
		findCoupon.setAccount(acc);;
		// 4
		findCoupon.setName(coupon.getName());
		// 5
		findCoupon.setStatus(coupon.getStatus());
		// 6
		findCoupon.setQuantity(coupon.getQuantity());
		// 7
		findCoupon.setDetail(coupon.getDetail());
		findCoupon.setDiscount(coupon.getDiscount());
		// 8
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = format.parse(coupon.getPostingDate());
			findCoupon.setPostingDate(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/employee/vouchers.htm";
		}

		try {
			Date date = format.parse(coupon.getExpiryDate());
			findCoupon.setExpiryDate(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			/* return "redirect:/employee/vouchers.htm"; */
		}
		if(couponDAO.add(findCoupon) == false)
		{
			System.out.println("Error in add");
		}
		return "redirect:/employee/vouchers.htm";
	}
	
	@RequestMapping(value = "delete{id}.htm", method = RequestMethod.POST)
	public String pDeleteProduct(@PathVariable("id") int id) {
		Coupon findCoupon = couponDAO.getCoupon(id);
		if (findCoupon != null) {
			couponDAO.delete(findCoupon);
		}
		// productDAO.delete(null)
		return "redirect:/employee/vouchers.htm";
	}
}
