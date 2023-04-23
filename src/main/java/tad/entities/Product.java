package tad.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Product")
public class Product {
	@Id
	@GeneratedValue
	@Column(name = "ProductID")
	private int id;

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
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "PostingDate")
	private Date postingDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "ExpiryDate")
	private Date expiryDate;

	@Column(name = "Unit")
	private String unit;

	@ManyToOne
	@JoinColumn(name = "CategoryID")
	private Category categoryID;

	@ManyToOne
	@JoinColumn(name = "CouponID")
	private Coupon coupons;

	public Product() {
	}

	public Product(int id, String productName, float price, String image, int quantity, String detail, Date postingDate,
			Date expiryDate, Category categoryID, Coupon coupons, String unit) {
		this.id = id;
		this.productName = productName;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
		this.detail = detail;
		this.postingDate = postingDate;
		this.expiryDate = expiryDate;
		this.categoryID = categoryID;
		this.coupons = coupons;
		this.unit = unit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public Date getPostingDate() {
		return postingDate;
	}

	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Category getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(Category categoryID) {
		this.categoryID = categoryID;
	}

	public Coupon getCoupons() {
		return coupons;
	}

	public void setCoupons(Coupon coupons) {
		this.coupons = coupons;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

}
