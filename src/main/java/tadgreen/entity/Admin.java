package tadgreen.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Admin {
	@Id
	private String adminID;
	
	private String password;
	private String email;
	
	@OneToMany(mappedBy="Category", fetch=FetchType.LAZY)
	private Collection<Category> categories;
	public Admin(String adminID, String password, String email) {
		this.adminID = adminID;
		this.password = password;
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdminID() {
		return adminID;
	}
}
