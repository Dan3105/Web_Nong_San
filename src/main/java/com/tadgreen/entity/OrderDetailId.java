package com.tadgreen.entity;
// Generated Apr 3, 2023, 10:50:00 AM by Hibernate Tools 4.3.6.Final

import java.io.Serializable;
import java.util.Arrays;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * OrderDetailId generated by hbm2java
 */
@Embeddable
public class OrderDetailId implements java.io.Serializable {

	private Serializable productId;
	private byte[] orderId;
	private byte[] couponId;

	public OrderDetailId() {
	}

	public OrderDetailId(Serializable productId, byte[] orderId, byte[] couponId) {
		this.productId = productId;
		this.orderId = orderId;
		this.couponId = couponId;
	}

	@Column(name = "ProductID", nullable = false)
	public Serializable getProductId() {
		return this.productId;
	}

	public void setProductId(Serializable productId) {
		this.productId = productId;
	}

	@Column(name = "OrderID", nullable = false)
	public byte[] getOrderId() {
		return this.orderId;
	}

	public void setOrderId(byte[] orderId) {
		this.orderId = orderId;
	}

	@Column(name = "CouponID", nullable = false)
	public byte[] getCouponId() {
		return this.couponId;
	}

	public void setCouponId(byte[] couponId) {
		this.couponId = couponId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof OrderDetailId))
			return false;
		OrderDetailId castOther = (OrderDetailId) other;

		return ((this.getProductId() == castOther.getProductId()) || (this.getProductId() != null
				&& castOther.getProductId() != null && this.getProductId().equals(castOther.getProductId())))
				&& ((this.getOrderId() == castOther.getOrderId()) || (this.getOrderId() != null
						&& castOther.getOrderId() != null && Arrays.equals(this.getOrderId(), castOther.getOrderId())))
				&& ((this.getCouponId() == castOther.getCouponId())
						|| (this.getCouponId() != null && castOther.getCouponId() != null
								&& Arrays.equals(this.getCouponId(), castOther.getCouponId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getProductId() == null ? 0 : this.getProductId().hashCode());
		result = 37 * result + (getOrderId() == null ? 0 : Arrays.hashCode(this.getOrderId()));
		result = 37 * result + (getCouponId() == null ? 0 : Arrays.hashCode(this.getCouponId()));
		return result;
	}

}
