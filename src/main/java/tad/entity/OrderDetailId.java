package tad.entity;
// Generated Apr 8, 2023, 3:38:47 PM by Hibernate Tools 3.6.2.Final

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * OrderDetailId generated by hbm2java
 */
@Embeddable
public class OrderDetailId implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	@Column(name = "ProductID", nullable = false)
	private int productId;
	@Column(name = "OrderID", nullable = false)
	private int orderId;

	public OrderDetailId() {
	}

	public OrderDetailId(int productId, int orderId) {
		this.productId = productId;
		this.orderId = orderId;
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

}
