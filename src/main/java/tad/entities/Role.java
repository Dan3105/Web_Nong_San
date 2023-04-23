package tad.entities;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Role")
public class Role {
	@Id
	@Column(name = "RoleID")
	private String roleID;

	@Column(name = "RoleName")
	private String roleName;

	@OneToMany(mappedBy = "roleID", fetch = FetchType.EAGER)
	private Collection<Account> accounts;

	public Role() {
	}

	public Role(String roleID, String roleName, Collection<Account> accounts) {
		this.roleID = roleID;
		this.roleName = roleName;
		this.accounts = accounts;
	}

	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}

	public String getRoleID() {
		return roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Collection<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(Collection<Account> accounts) {
		this.accounts = accounts;
	}

}
