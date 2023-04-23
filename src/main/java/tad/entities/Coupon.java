package tad.entities;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Coupon")
public class Coupon {

	@Id
	@GeneratedValue
	@Column(name = "CouponID")
	private int id;

	@Column(name = "Name")
	private String name;

	@Column(name = "TypeCoupon")
	private boolean typeCoupon;

	@Column(name = "Discount")
	private float discount;

	@Column(name = "Quantity")
	private int quantity;

	@Column(name = "Detail")
	private String detail;

	@Column(name = "Status")
	private boolean status;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "PostingDate")
	private Date postingDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "ExpiryDate")
	private Date expiryDate;

	@OneToMany(mappedBy = "coupons", fetch = FetchType.EAGER)
	private Collection<Product> products;

	public Coupon(int id, String name, boolean typeCoupon, float discount, int quantity, String detail, boolean status,
			Date postingDate, Date expiryDate, Collection<Product> products) {
		this.id = id;
		this.name = name;
		this.typeCoupon = typeCoupon;
		this.discount = discount;
		this.quantity = quantity;
		this.detail = detail;
		this.status = status;
		this.postingDate = postingDate;
		this.expiryDate = expiryDate;
		this.products = products;
	}

	public Coupon() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isTypeCoupon() {
		return typeCoupon;
	}

	public void setTypeCoupon(boolean typeCoupon) {
		this.typeCoupon = typeCoupon;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
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

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}

}
