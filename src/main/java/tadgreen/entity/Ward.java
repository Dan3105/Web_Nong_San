package tadgreen.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Ward {
	@Id
	private String wardID;
	private String name;
	
	@ManyToOne
	@JoinColumn(name="DistrictID")
	private District districtID;

	public String getWardID() {
		return wardID;
	}

	public String getName() {
		return name;
	}

	public District getDistrictID() {
		return districtID;
	}
	
	
}
