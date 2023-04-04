package tad.entity;
// Generated Apr 3, 2023, 10:50:00 AM by Hibernate Tools 4.3.6.Final

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Cart generated by hbm2java
 */
@Entity
@Table(name = "Cart", schema = "dbo", catalog = "DB_Tad")
public class Cart{

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "productId", column = @Column(name = "ProductID", nullable = false)),
			@AttributeOverride(name = "userId", column = @Column(name = "UserID", nullable = false)) })
	private CartId id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ProductID", nullable = false, insertable = false, updatable = false)
	private Product product;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UserID", nullable = false, insertable = false, updatable = false)
	private User user;

	@Column(name = "Quantity", nullable = false)
	private int quantity;

	public Cart() {
	}

	public Cart(CartId id, Product product, User user, int quantity) {
		this.id = id;
		this.product = product;
		this.user = user;
		this.quantity = quantity;
	}

	public CartId getId() {
		return this.id;
	}

	public void setId(CartId id) {
		this.id = id;
	}


	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}


	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}