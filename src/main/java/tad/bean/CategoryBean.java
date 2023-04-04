package tad.bean;

public class CategoryBean {
	private String name;

	public CategoryBean(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public CategoryBean() {
		this.name = "Empty";
	}
}
