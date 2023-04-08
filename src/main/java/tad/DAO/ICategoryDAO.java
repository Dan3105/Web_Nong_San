package tad.DAO;

import java.util.ArrayList;

import tad.entity.Category;

public interface ICategoryDAO {

	public boolean DeleteCategory(String id);

	public boolean AddCategory(Category newCategory);

	public ArrayList<Category> GetListCategories();

	public Category GetCategory();

}
