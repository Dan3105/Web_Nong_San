package tad.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Cart", schema = "dbo", catalog = "DB_Tad")
public class Cart {
	@EmbeddedId
	private CartId id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AccountID", nullable = false, insertable = false, updatable = false)
	private Account account;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ProductID", nullable = false, insertable = false, updatable = false)
	private Product product;
	private int quantity;

	public Cart() {
	}

	public Cart(CartId id, Account account, Product product, int quantity) {
		this.id = id;
		this.account = account;
		this.product = product;
		this.quantity = quantity;
	}

	public CartId getId() {
		return this.id;
	}

	public void setId(CartId id) {
		this.id = id;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "Quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
