package tad.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
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
import tad.DAO.IOrderDAO;
import tad.entity.Account;
import tad.entity.Cart;
import tad.entity.OrderDetail;
import tad.entity.OrderDetailId;
import tad.entity.Orders;

@Controller
@RequestMapping(value = "/order/")
public class UserOrderController {

	@Autowired
	private IOrderDAO orderDAO;
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private ICartDAO cartDAO;
	@Autowired
	private ICategoryDAO categoryDAO;

	@RequestMapping(value = "index")
	public String detail(ModelMap model) {

		Account user = accountDAO.getAccount(36);
		List<Cart> list = cartDAO.getCart(user.getAccountId());
		Orders orders = new Orders();

		Calendar c1 = Calendar.getInstance();
		Date in = new Date();
		LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
		Date out = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
		orders.setAccount(user);
		orders.setOrderTime(out);

		c1.setTime(out);
		c1.add(Calendar.MINUTE, 30);

		orders.setDeliveryTime(c1.getTime());
		orders.setStatus(0);

		orderDAO.insertOrder(orders);
		// address default is still empty

		for (Cart c : list) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setId(new OrderDetailId(orders.getOrderId(), c.getProduct().getProductId()));
			orderDetail.setProduct(c.getProduct());
			orderDetail.setOrder(orders);
			orderDetail.setQuantity(c.getQuantity());
			orderDAO.insertOrderDetail(orderDetail);
		}

		return "order/index";

	}

	@RequestMapping("index")
	public String index(ModelMap model, @PathVariable("id") int id) {

		return "order/index";
	}

	@RequestMapping(value = "status", params = { "orderId", "status" })
	public String updateStatus(ModelMap model, @RequestParam("orderId") int orderId, @RequestParam("status") int status,
			HttpSession session) {
		/* orderDAO.updateStatus(orderId, status); */
		return "redirect:/order/index.htm";
	}
}
