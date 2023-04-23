package tad.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CartKey implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "AccountID")
	private int accountID;

	@Column(name = "ProductID")
	private int productID;

	public CartKey() {
		super();
	}

	public CartKey(int accountID, int productID) {
		super();
		this.accountID = accountID;
		this.productID = productID;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
