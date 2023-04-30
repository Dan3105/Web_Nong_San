package tad.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Account", schema = "dbo", catalog = "DB_Tad")
public class Account {

	@Id
	@GeneratedValue
	@Column(name = "AccountID", unique = true, nullable = false)
	private int accountId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "RoleID", nullable = false)
	private Role role;

	@Column(name = "LastName", nullable = false)
	private String lastName;

	@Column(name = "FirstName", nullable = false)
	private String firstName;

	@Column(name = "Email", nullable = false)
	private String email;

	@Column(name = "PhoneNumber")
	private String phoneNumber;

	@Column(name = "Avatar")
	private String avatar;
	@Column(name = "Status", nullable = false)
	private int status;

	@Column(name = "Password", nullable = false)
	private String password;

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
	private Set<Address> addresses = new HashSet<Address>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Order> orders = new HashSet<Order>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Coupon> coupons = new HashSet<Coupon>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Product> products = new HashSet<Product>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Feedback> feedbacks = new HashSet<Feedback>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Comment> comments = new HashSet<Comment>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Cart> carts = new HashSet<Cart>(0);

	public Account() {
	}

	public Account(Role role, String lastName, String firstName, String email, String phoneNumber,
			String avatar, String password) {
		this.role = role;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.avatar = avatar;
		this.status = 1; // Tao tk moi set trang thai ve 1 
		this.password = password;
	}

	public Account(int accountId, Role role, String lastName, String firstName, String email, String phoneNumber,
			String avatar, int status, String password, Set<Address> addresses, Set<Order> orders, Set<Coupon> coupons,
			Set<Product> products, Set<Feedback> feedbacks, Set<Comment> comments, Set<Cart> carts) {
		this.accountId = accountId;
		this.role = role;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.avatar = avatar;
		this.status = status;
		this.password = password;
		this.addresses = addresses;
		this.orders = orders;
		this.coupons = coupons;
		this.products = products;
		this.feedbacks = feedbacks;
		this.comments = comments;
		this.carts = carts;
	}

	public String toString() {
		return String.format("Account ID: {0}", accountId);
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	public Set<Coupon> getCoupons() {
		return coupons;
	}

	public void setCoupons(Set<Coupon> coupons) {
		this.coupons = coupons;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public Set<Feedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Set<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}
}
