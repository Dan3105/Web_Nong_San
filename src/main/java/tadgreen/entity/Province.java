package tadgreen.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Province {
	@Id
	private String provinceID;
	
	private String name;

	@OneToMany(mappedBy = "District", fetch = FetchType.EAGER)
	private Collection<District> districts;
	
	public String getName() {
		return name;
	}

	public Collection<District> getDistricts() {
		return districts;
	}

	public String getProvinceID() {
		return provinceID;
	}
	
	
}
