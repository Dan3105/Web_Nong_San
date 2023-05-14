package tad.bean;

import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

import tad.entity.Orders;

public class OrderDetailBean {
	public class DetailProduct
	{
		
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public ProductBean getProductBean() {
			return productBean;
		}
		public void setProductBean(ProductBean productBean) {
			this.productBean = productBean;
		}
		private ProductBean productBean;
		private int quantity;
		
		
		public DetailProduct(int quantity, ProductBean productBean) {
		
			this.quantity = quantity;
			this.productBean = productBean;
		}
	}
	
	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public Set<DetailProduct> getProducts() {
		return products;
	}

	public void setProducts(Set<DetailProduct> products) {
		this.products = products;
	}

	private int idOrder;
	public int getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}

	private String deliveryDate;
	private String receivedDate;
	private String address;
	private short status;
	private String accName;

	private Set<DetailProduct> products = new HashSet<DetailProduct>();
	
	public short getStatus() {
		return status;
	}

	public void setStatus(short status) {
		this.status = status;
	}

	OrderDetailBean()
	{
		
	}
	
	public OrderDetailBean(Orders order)
	{
		this.idOrder = order.getOrderId();
		this.accName = order.getAccount().getLastName() + " " + order.getAccount().getFirstName();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		this.deliveryDate = formatter.format(order.getOrderTime()); 
		if(order.getDeliveryTime() != null)
		 this.receivedDate = formatter.format(order.getDeliveryTime());
		this.address = order.getAddress();
		this.status = order.getStatus();
		for(var detail : order.getOrderDetails())
		{
			ProductBean product = new ProductBean(detail.getProduct());
			DetailProduct detailBean = new DetailProduct(detail.getQuantity(), product);
			products.add(detailBean);
		}
	}
	
	public double getTotalPrice()
	{
		double value = 0;
		for(DetailProduct product : products)
		{
			value += product.getQuantity() * product.getProductBean().getTotalPrice();
		}
		return value;
	}
}
