package tad.entity;
// Generated Apr 3, 2023, 10:50:00 AM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Province generated by hbm2java
 */
@Entity
@Table(name = "Province", schema = "dbo", catalog = "DB_Tad")
public class Province implements {
	@Id

	@Column(name = "ProvinceID", unique = true, nullable = false)
	private String provinceId;

	@Column(name = "Name", nullable = false)
	private String name;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "province")
	private Set<District> districts = new HashSet<District>(0);

	public Province() {
	}

	public Province(String provinceId, String name) {
		this.provinceId = provinceId;
		this.name = name;
	}

	public Province(String provinceId, String name, Set<District> districts) {
		this.provinceId = provinceId;
		this.name = name;
		this.districts = districts;
	}

	
	public String getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<District> getDistricts() {
		return this.districts;
	}

	public void setDistricts(Set<District> districts) {
		this.districts = districts;
	}

}
