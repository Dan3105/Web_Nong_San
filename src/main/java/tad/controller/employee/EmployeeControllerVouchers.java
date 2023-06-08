package tad.controller.employee;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.ICouponDAO;
import tad.bean.CouponBean;
import tad.entity.Account;
import tad.entity.Coupon;
import tad.utility.Constants;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/employee/vouchers")
public class EmployeeControllerVouchers {

	@Autowired
	private ICouponDAO couponDAO;

	@RequestMapping()
	public String gVoucherList(ModelMap model, HttpSession session,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		Account currentAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (currentAcc == null) {
			return "redirect:/";
		}
		List<Coupon> coupons = couponDAO.listCoupons(currentAcc.getAccountId());

		int startIndex = (crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME;
		int totalPage = 1;
		if (coupons.size() <= Constants.PRODUCT_PER_PAGE_IN_HOME)
			totalPage = 1;
		else {
			totalPage = coupons.size() / Constants.PRODUCT_PER_PAGE_IN_HOME;
			if (coupons.size() % Constants.PRODUCT_PER_PAGE_IN_HOME != 0) {
				totalPage++;
			}
		}
		System.out.println(coupons.size());

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("coupons",
				coupons.subList(startIndex, Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_HOME, coupons.size())));
		model.addAttribute("crrPage", crrPage);
		return "employee/employee-voucher";

	}

	@RequestMapping(value = "update-voucher{id}.htm", method = RequestMethod.POST)
	public String pUpdateProduct(@PathVariable("id") int id, @ModelAttribute("couponBean") CouponBean coupon) {
		Coupon findCoupon = couponDAO.getCoupon(id);

		if (findCoupon != null) {
			// 4
			findCoupon.setName(coupon.getName());
			// 7
			findCoupon.setDetail(coupon.getDetail());
			findCoupon.setDiscount(coupon.getDiscount()); // 8
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
			if (!couponDAO.update(findCoupon)) {
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
		findCoupon.setAccount(acc);
		// 4
		findCoupon.setName(coupon.getName());
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
		if (!couponDAO.add(findCoupon)) {
			System.out.println("Error in add");
		}
		return "redirect:/employee/vouchers.htm";
	}

	@RequestMapping(value = "delete{id}.htm")
	public String pDeleteProduct(@PathVariable("id") int id) {
		Coupon findCoupon = couponDAO.getCoupon(id);
		if (findCoupon != null) {
			couponDAO.delete(findCoupon);
		}
		// productDAO.delete(null)
		return "redirect:/employee/vouchers.htm";
	}
}
