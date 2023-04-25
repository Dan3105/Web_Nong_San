package tad.entity;
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

@Entity
@Table(name = "Address", schema = "dbo", catalog = "DB_Tad")
public class Address {

	@Id

	@Column(name = "AddressID", unique = true, nullable = false)
	private int addressId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "WardID", nullable = false)
	private Ward ward;

	@Column(name = "Name")
	private String name;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "AddressAccount", joinColumns = {
			@JoinColumn(name = "AddressID", nullable = false, updatable = true) }, inverseJoinColumns = {
					@JoinColumn(name = "AccountID", nullable = false, updatable = true) })
	private Set<Account> accounts = new HashSet<Account>(0);

	public Address() {
	}

	public Address(int addressId, Ward ward) {
		this.addressId = addressId;
		this.ward = ward;
	}

	public Address(int addressId, Ward ward, String name, Set<Account> accounts) {
		this.addressId = addressId;
		this.ward = ward;
		this.name = name;
		this.accounts = accounts;
	}

	public int getAddressId() {
		return this.addressId;
	}

	public void setAddressId(int addressId) {
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

	public Set<Account> getAccounts() {
		return this.accounts;
	}

	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}

}
