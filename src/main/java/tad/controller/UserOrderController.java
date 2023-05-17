package tad.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.IOrderDAO;
import tad.entity.Account;
import tad.entity.Orders;


@Controller
@RequestMapping(value = "/order/")
public class UserOrderController {

	@Autowired
	private IOrderDAO orderDAO;
	@Autowired
	private IAccountDAO accountDAO;

	@RequestMapping(value = "index")
	public String index(ModelMap model, HttpSession session, HttpServletRequest request) {

		//Account user = (Account) session.getAttribute("account");
		Account user = accountDAO.getAccount(39);
		List<Orders> list = orderDAO.getOrderFromAccount(user.getAccountId());



		return "order/index";


	}

	@RequestMapping(value = "detail/{id}.htm")
	public String detail(ModelMap model, @PathVariable("id") int id) {
		float total = 0;
		float discountValue = 0;
		float discountType = 0;
		/*
		 * List<OrderDetail> list = orderDAO.getOrdersDetail(id); if
		 * (list.get(0).getOrder().getCoupons() != null) { discountValue =
		 * list.get(0).getOrder().getCoupons().getValue(); discountType =
		 * list.get(0).getOrder().getCoupons().getType(); }
		 *
		 * for (OrderDetail o : list) { total += o.getAmount() * o.getPrice(); }
		 */

		float finalPrice = total;
		if (discountType == 0)
			finalPrice = Math.max(finalPrice - discountValue, 0);
		else
			finalPrice *= (discountValue / 100);

		/*
		 * model.addAttribute("total", finalPrice); model.addAttribute("orderDetail",
		 * list); return "order/detail";
		 */
		return null;
	}

	@RequestMapping(value = "status", params = { "orderId", "status" })
	public String updateStatus(ModelMap model, @RequestParam("orderId") int orderId, @RequestParam("status") int status,
			HttpSession session) {
		/* orderDAO.updateStatus(orderId, status); */
		return "redirect:/order/index.htm";
	}
}
