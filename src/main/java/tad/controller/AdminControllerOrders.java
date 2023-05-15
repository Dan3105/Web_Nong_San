package tad.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IOrderDAO;
import tad.bean.OrderDetailBean;
import tad.entity.Orders;

@Controller
@RequestMapping("/admin/orders")
public class AdminControllerOrders {

	@Autowired
	private IOrderDAO orderDAO;

	@RequestMapping()
	public String index() {
		return "redirect:orders/unresolve-order.htm";
	}

	@RequestMapping("unresolve-order")
	public String gListUnresolvedOrder(ModelMap model) {
		List<Orders> orders = orderDAO.getUnresolveOrders();
		List<OrderDetailBean> detailOrderBean = new ArrayList<OrderDetailBean>();
		for (Orders order : orders) {
			order = orderDAO.fetchOrderDetail(order);
			detailOrderBean.add(new OrderDetailBean(order));
		}

		model.addAttribute("orders", detailOrderBean);
		model.addAttribute("mapStatus", mapStatus());
		model.addAttribute("source", "unresolve-order.htm");
		return "admin/admin-orders";
	}

	@RequestMapping("moving-order")
	public String gListMovingOrder(ModelMap model) {
		List<Orders> orders = orderDAO.getMovingOrders();
		List<OrderDetailBean> detailOrderBean = new ArrayList<OrderDetailBean>();
		for (Orders order : orders) {
			order = orderDAO.fetchOrderDetail(order);
			detailOrderBean.add(new OrderDetailBean(order));
		}

		model.addAttribute("orders", detailOrderBean);
		model.addAttribute("mapStatus", mapStatus());
		model.addAttribute("source", "moving-order.htm");
		return "admin/admin-orders";
	}

	@RequestMapping("resolved-order")
	public String gListResolveOrder(ModelMap model) {
		List<Orders> orders = orderDAO.getResolveOrders();
		List<OrderDetailBean> detailOrderBean = new ArrayList<OrderDetailBean>();
		for (Orders order : orders) {
			order = orderDAO.fetchOrderDetail(order);
			detailOrderBean.add(new OrderDetailBean(order));
		}

		model.addAttribute("orders", detailOrderBean);
		model.addAttribute("mapStatus", mapStatus());
		model.addAttribute("source", "resolved-order.htm");
		return "admin/admin-orders";
	}

	@RequestMapping("cancel-order")
	public String gListCancelOrder(ModelMap model) {
		List<Orders> orders = orderDAO.getCancelOrders();
		List<OrderDetailBean> detailOrderBean = new ArrayList<OrderDetailBean>();
		for (Orders order : orders) {
			order = orderDAO.fetchOrderDetail(order);
			detailOrderBean.add(new OrderDetailBean(order));
		}

		model.addAttribute("orders", detailOrderBean);
		model.addAttribute("mapStatus", mapStatus());
		model.addAttribute("source", "cancel-order.htm");
		return "admin/admin-orders";
	}

	@RequestMapping(value = "update-order{id}", method = RequestMethod.POST)
	public String updateOrder(@PathVariable("id") int id, HttpServletRequest request,
			@RequestParam("source") String source) {
		Orders order = orderDAO.findOrder(id);

		if (order != null && (order.getStatus() != 3 || order.getStatus() != 2)) {
			String statusChanged = request.getParameter("statusSelect" + order.getOrderId());
			System.out.println("Hell: " + statusChanged);
			if (statusChanged != null) {
				short shortValue = Short.parseShort(statusChanged);
				order.setStatus(shortValue);
				orderDAO.update(order);
			}

		}
		return "redirect:" + source;
	}

	private Map<Short, String> mapStatus() {
		Map<Short, String> status = new HashMap<>();
		status.put((short) 0, "Chờ xác nhận");
		status.put((short) 1, "Đang vận chuyển");
		status.put((short) 2, "Đã giao!");
		status.put((short) 3, "Đã hủy");
		return status;
	}
}
