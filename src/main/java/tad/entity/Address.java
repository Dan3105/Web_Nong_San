package tad.entity;
// Generated Apr 3, 2023, 10:50:00 AM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Address generated by hbm2java
 */
@Entity
@Table(name = "Address", schema = "dbo", catalog = "DB_Tad")
public class Address {

	@Id
	@Column(name = "AddressID", unique = true, nullable = false)
	private String addressId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "WardID", nullable = false)
	private Ward ward;

	@Column(name = "Name")
	private String name;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "ShopAddress", schema = "dbo", catalog = "DB_Tad", uniqueConstraints = @UniqueConstraint(columnNames = "ShopID"), joinColumns = {
			@JoinColumn(name = "AddressID", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "ShopID", unique = true, nullable = false, updatable = false) })
	private Set<ShopSystem> shopSystems = new HashSet<>(0);

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "AddressUser", schema = "dbo", catalog = "DB_Tad", joinColumns = {
			@JoinColumn(name = "AddressID", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "UserID", nullable = false, updatable = false) })
	private Set<User> users = new HashSet<>(0);

	public Address() {
	}

	public Address(String addressId, Ward ward) {
		this.addressId = addressId;
		this.ward = ward;
	}

	public Address(String addressId, Ward ward, String name, Set<ShopSystem> shopSystems, Set<User> users) {
		this.addressId = addressId;
		this.ward = ward;
		this.name = name;
		this.shopSystems = shopSystems;
		this.users = users;
	}


	public String getAddressId() {
		return this.addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}


	public Ward getWard() {
		return this.ward;
	}

	public void setWard(Ward ward) {
		this.ward = ward;
	}


	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Set<ShopSystem> getShopSystems() {
		return this.shopSystems;
	}

	public void setShopSystems(Set<ShopSystem> shopSystems) {
		this.shopSystems = shopSystems;
	}


	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}