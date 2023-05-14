package tad.DAO;

import java.util.ArrayList;

import tad.entity.OrderDetail;
import tad.entity.Orders;

public interface IOrderDAO {
	public ArrayList<Orders> GetOrderFromAccount(int idAccount);
	public ArrayList<Orders> GetOrderFromProduct(int idProduct);
	
	public ArrayList<OrderDetail> GetOrderDetail(int orderId);
	
	public Orders findOrder(int id);
	public boolean update(Orders order);
	
	
	boolean insertOrder(Orders order);
	boolean insertOrderDetail(OrderDetail orderDetail);
	boolean updateOrder(Orders order);
	
	public Orders FetchOrderDetail(Orders order);
	
	public ArrayList<Orders> GetUnresolveOrders();
	public ArrayList<Orders> GetMovingOrders();
	public ArrayList<Orders> GetResolveOrders();
	public ArrayList<Orders> GetCancelOrders();
} 
