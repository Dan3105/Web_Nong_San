package tadgreen.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class District {
	@Id
	private String districtID;
	
	private String name;
	
	@ManyToOne
	@JoinColumn(name="provinceID")
	private Province provinceID;

	@OneToMany(mappedBy="Ward", fetch=FetchType.EAGER)
	private Collection<Ward> wards;
	
	public String getDistrictID() {
		return districtID;
	}

	public String getName() {
		return name;
	}

	public Province getProvinceID() {
		return provinceID;
	}
}
