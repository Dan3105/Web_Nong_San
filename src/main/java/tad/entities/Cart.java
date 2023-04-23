package tad.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "Cart")
public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private CartKey cartId;

	@ManyToOne
	@MapsId("productID")
	@JoinColumn(name = "ProductID")
	private Product products;

	@ManyToOne
	@MapsId("accountID")
	@JoinColumn(name = "AccountID")
	private Account accounts;

	@Column(name = "Quantity")
	private int quantity;

	public CartKey getCartId() {
		return cartId;
	}

	public void setCartId(CartKey cartId) {
		this.cartId = cartId;
	}

	public Cart() {
	}

	public Product getProducts() {
		return products;
	}

	public void setProducts(Product products) {
		this.products = products;
	}

	public Account getAccounts() {
		return accounts;
	}

	public void setAccounts(Account accounts) {
		this.accounts = accounts;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
