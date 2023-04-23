package tad.entities;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Category")
public class Category {
	@Id
	@GeneratedValue
	@Column(name = "CategoryID")
	private int categoryID;

	@Column(name = "Name")
	private String name;

	@Column(name = "Image")
	private String image;

	@OneToMany(mappedBy = "categoryID", fetch = FetchType.EAGER)
	private Collection<Product> products;

	public Category() {
	}
	

	public Category(int categoryID, String name, String image, Collection<Product> products) {
		super();
		this.categoryID = categoryID;
		this.name = name;
		this.image = image;
		this.products = products;
	}


	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}

}
