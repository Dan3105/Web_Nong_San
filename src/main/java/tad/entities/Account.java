package tad.entities;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Account")
public class Account {
	@Id
	@GeneratedValue
	@Column(name = "AccountID")
	private Integer accountID;

	@Column(name = "LastName")
	private String lastName;

	@Column(name = "FirstName")
	private String firstName;

	@Column(name = "Email")
	private String email;

	@Column(name = "PhoneNumber")
	private String phoneNumber;

	@Column(name = "Avatar")
	private String avatar;

	@Column(name = "Status")
	private boolean status;

	@Column(name = "password")
	private boolean Password;

	@ManyToOne
	@JoinColumn(name = "RoleID")
	private Role roleID;

	@OneToMany(mappedBy = "accounts", fetch = FetchType.EAGER)
	private Collection<Cart> carts;

	public Collection<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Collection<Cart> carts) {
		this.carts = carts;
	}

	public void setAccountID(Integer accountID) {
		this.accountID = accountID;
	}

	public Integer getAccountID() {
		return accountID;
	}

	public void setRoleID(Role roleID) {
		this.roleID = roleID;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isPassword() {
		return Password;
	}

	public void setPassword(boolean password) {
		Password = password;
	}

}
