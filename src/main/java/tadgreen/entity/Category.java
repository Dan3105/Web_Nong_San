package tadgreen.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Category {
	@Id
	private String CategoryID;
	private String name;
	@ManyToOne
	@JoinColumn(name="AdminID")
	private Admin admin;
}
