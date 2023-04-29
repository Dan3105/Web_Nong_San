package tad.DAO;

import java.util.ArrayList;
import java.util.List;

import tad.entity.Category;

public interface ICategoryDAO {

	public boolean DeleteCategory(Category category);

	public boolean AddCategory(Category newCategory);

	public ArrayList<Category> GetListCategories();

	public Category GetCategory(int id);

	public boolean UpdateCategory(Category changedCategory);

	public List<Category> listCategoriesHasProducts(int i);
}
