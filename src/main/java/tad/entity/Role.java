package tad.entity;
// Generated Apr 8, 2023, 3:38:47 PM by Hibernate Tools 3.6.2.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Role generated by hbm2java
 */
@Entity
@Table(name = "Role", schema = "dbo", catalog = "DB_Tad")
public class Role {

	private String roleId;
	private String roleName;
	private Set<Account> accounts = new HashSet<Account>(0);

	public Role() {
	}

	public Role(String roleId, String roleName) {
		this.roleId = roleId;
		this.roleName = roleName;
	}

	public Role(String roleId, String roleName, Set<Account> accounts) {
		this.roleId = roleId;
		this.roleName = roleName;
		this.accounts = accounts;
	}

	@Id

	@Column(name = "RoleID", unique = true, nullable = false)
	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	@Column(name = "RoleName", nullable = false)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<Account> getAccounts() {
		return this.accounts;
	}

	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}

}
