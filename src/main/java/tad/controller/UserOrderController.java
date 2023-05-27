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
import org.springframework.web.bind.annotation.RequestMapping;

import tad.DAO.ICartDAO;
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
	private ICartDAO cartDAO;

	@RequestMapping(value = "index")
	public String detail(ModelMap model, HttpSession session) {

		Account account = (Account) session.getAttribute("account");

		model.addAttribute("user", new Account());

		return "account/accountProfile";

	}

	public void ahihi(HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Cart> listCarts = cartDAO.getCart(account.getAccountId());
		Orders orders = new Orders();

		Calendar c1 = Calendar.getInstance();
		Date in = new Date();
		LocalDateTime ldt = LocalDateTime.ofInstant(in.toInstant(), ZoneId.systemDefault());
		Date out = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
		orders.setAccount(account);
		orders.setOrderTime(out);

		c1.setTime(out);
		c1.add(Calendar.MINUTE, 30);

		orders.setDeliveryTime(c1.getTime());
		orders.setStatus(0);

		if (account.getDefaultAddress() != null)
			orders.setDefaultAddress(account.getDefaultAddress().getFullAddress());

		else
			orders.setDefaultAddress("a");
		orderDAO.insertOrder(orders);

		for (Cart c : listCarts) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setId(new OrderDetailId(orders.getOrderId(), c.getProduct().getProductId()));
			orderDetail.setProduct(c.getProduct());
			orderDetail.setOrder(orders);
			orderDetail.setQuantity(c.getQuantity());
			orderDAO.insertOrderDetail(orderDetail);
		}

	}

}
