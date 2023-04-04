package tad.entity;
// Generated Apr 3, 2023, 10:50:00 AM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "User", schema = "dbo", catalog = "DB_Tad")
public class User {

	@Id
	@Column(name = "UserID", unique = true, nullable = false)
	private String userId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ShopID")
	private ShopSystem shopSystem;

	@Column(name = "LastName", nullable = false)
	private String lastName;

	@Column(name = "FirstName", nullable = false)
	private String firstName;

	@Column(name = "Email", nullable = false)
	private String email;

	@Column(name = "PhoneNumber")
	private String phoneNumber;

	@Column(name = "Avatar")
	private byte[] avatar;

	@Column(name = "State", nullable = false)
	private int state;

	@Column(name = "Password", nullable = false)
	private String password;


	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Order> orders = new HashSet<>(0);


	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<ShopSystem> shopSystems = new HashSet<>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Comment> comments = new HashSet<>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Cart> carts = new HashSet<>(0);

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "users")
	private Set<Address> addresses = new HashSet<>(0);

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Feedback> feedbacks = new HashSet<>(0);

	public User() {
	}

	public User(String userId, String lastName, String firstName, String email, int state,
			String password) {
		this.userId = userId;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.state = state;
		this.password = password;
	}

	public User(String userId, ShopSystem shopSystem, String lastName, String firstName,
			String email, String phoneNumber, byte[] avatar, int state, String password,
			Set<Order> orders, Set<ShopSystem> shopSystems, Set<Comment> comments, Set<Cart> carts,
			Set<Address> addresses, Set<Feedback> feedbacks) {
		this.userId = userId;
		this.shopSystem = shopSystem;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.avatar = avatar;
		this.state = state;
		this.password = password;
		this.orders = orders;
		this.shopSystems = shopSystems;
		this.comments = comments;
		this.carts = carts;
		this.addresses = addresses;
		this.feedbacks = feedbacks;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public ShopSystem getShopSystem() {
		return this.shopSystem;
	}

	public void setShopSystem(ShopSystem shopSystem) {
		this.shopSystem = shopSystem;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public byte[] getAvatar() {
		return this.avatar;
	}

	public void setAvatar(byte[] avatar) {
		this.avatar = avatar;
	}

	public int getState() {
		return this.state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	public Set<ShopSystem> getShopSystems() {
		return this.shopSystems;
	}

	public void setShopSystems(Set<ShopSystem> shopSystems) {
		this.shopSystems = shopSystems;
	}

	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	public Set<Address> getAddresses() {
		return this.addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

}
