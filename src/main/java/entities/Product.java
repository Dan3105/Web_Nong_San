package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Product")
public class Product {
	@Id
	@GeneratedValue
	@Column(name = "ProductID")
	private Integer id;
	@Column(name = "ProductName")
	private String productName;
	@Column(name = "Price")
	private float price;
	@Column(name = "Image")
	private String image;
	@Column(name = "Quantity")
	private int quantity;
	@Column(name = "Detail")
	private String detail;

	public Product(Integer id, String productName, float price, String image, int quantity, String detail) {
		this.id = id;
		this.productName = productName;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
		this.detail = detail;

	}

	public Product() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
