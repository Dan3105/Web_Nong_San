package tadgreen.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Address {
	@Id
	private String addressID;
	private String name;
	
	@ManyToOne
	@JoinColumn(name="WardID")
	private String wardID;
}
