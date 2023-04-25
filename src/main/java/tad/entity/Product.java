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
 * Product generated by hbm2java
 */
@Entity
@Table(name = "Product", schema = "dbo", catalog = "DB_Tad")
public class Product {

	@Id
	@GeneratedValue
	@Column(name = "ProductID", unique = true, nullable = false)
	private int productId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CategoryID", nullable = false)
	private Category category;

	@Column(name = "ProductName", nullable = false)
	private String productName;
	
	@Column(name = "Price", nullable = false, scale = 4)
	private Double price;
	
	@Column(name = "Image")
	private String image;

	@Column(name = "Quantity", nullable = false)
	private int quantity;

	@Column(name = "Detail")
	private String detail;

	@Temporal(TemporalType.DATE)
	@Column(name = "PostingDate", nullable = false, length = 10)
	private Date postingDate;

	@Temporal(TemporalType.DATE)
	@Column(name = "ExpiryDate", length = 10)
	private Date expiryDate;
	
	@Column(name="Unit")
	private String unit;

	@ManyToOne
	private Category categoryID;
	@ManyToOne
	private Coupon couponID;
	@ManyToOne
	private Account accountID;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	private Set<Cart> carts = new HashSet<Cart>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	private Set<Feedback> feedbacks = new HashSet<Feedback>(0);

	public Product() {
	}

	public Product(int productId, Category category, String productName, Double price, int quantity, Date postingDate) {
		this.productId = productId;
		this.category = category;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.postingDate = postingDate;
	}

	public Product(int productId, Category category, String productName, Double price, String image, int quantity,
			String detail, Date postingDate, Date expiryDate, Set<Cart> carts, Set<OrderDetail> orderDetails,
			Set<Coupon> coupons, Set<Feedback> feedbacks) {
		this.productId = productId;
		this.category = category;
		this.productName = productName;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
		this.detail = detail;
		this.postingDate = postingDate;
		this.expiryDate = expiryDate;
		this.carts = carts;
		this.orderDetails = orderDetails;
		this.feedbacks = feedbacks;
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}


	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getPostingDate() {
		return this.postingDate;
	}

	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}

	public Date getExpiryDate() {
		return this.expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

}
