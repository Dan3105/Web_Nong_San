package tad.entity;
// Generated Apr 8, 2023, 3:38:47 PM by Hibernate Tools 3.6.2.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Order generated by hbm2java
 */
@Entity
@Table(name = "Order", schema = "dbo", catalog = "DB_Tad")
public class Order  {
	@Id
	@GeneratedValue
	@Column(name = "OrderID", unique = true, nullable = false)
	private int orderId;
	

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AccountID", nullable = false)
	private Account account;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "OrderTime", nullable = false, length = 23)
	private Date orderTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DeliveryTime", length = 23)
	private Date deliveryTime;
	
	@Column(name = "Status", nullable = false)
	private short status;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="AddressID", nullable = false)
	private Address address;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order")
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);

	public Order() {
	}

	public Order(int orderId, Account account, Date orderTime, short status, Address address) {
		this.orderId = orderId;
		this.account = account;
		this.orderTime = orderTime;
		this.status = status;
	}

	public Order(int orderId, Account account, Date orderTime, Date deliveryTime, short status,
			Set<OrderDetail> orderDetails) {
		this.orderId = orderId;
		this.account = account;
		this.orderTime = orderTime;
		this.deliveryTime = deliveryTime;
		this.status = status;
		this.orderDetails = orderDetails;
	}

	
	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Date getOrderTime() {
		return this.orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Date getDeliveryTime() {
		return this.deliveryTime;
	}

	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public short getStatus() {
		return this.status;
	}

	public void setStatus(short status) {
		this.status = status;
	}

	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
