package tad.bean;

import java.util.ArrayList;

import tad.entity.Category;

public class CategoryBean {
	private int id;
	private String name;
	private String image;

	public CategoryBean() {
		this.name = "";
		this.image = "";
	}

	public CategoryBean(int id, String name, String image) {
		this.id = id;
		this.name = name;
		this.image = image;
	}

	public CategoryBean(String name, String image) {
		this.name = name;
		this.image = image;
	}

	public String getName() {
		return this.name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return this.id;
	}

	public static ArrayList<CategoryBean> ConvertListCategory(ArrayList<Category> listCategory)
	{
		ArrayList<CategoryBean> categories = new ArrayList<CategoryBean>();
		for(var categoryData : listCategory)
		{
			CategoryBean bean = new CategoryBean(categoryData.getCategoryId(), categoryData.getName(), categoryData.getImage());
			categories.add(bean);
		}
		return categories;
	}
}
