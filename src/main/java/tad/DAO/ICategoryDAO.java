package tad.DAO;

import java.util.List;

import tad.entity.Category;
import tad.entity.Product;

public interface ICategoryDAO {

	public boolean deleteCategory(Category category);

	public boolean addCategory(Category newCategory);

	public List<Category> getListCategories();

	public Category getCategory(int id);

	public boolean updateCategory(Category changedCategory);

	public List<Category> listCategoriesHasProducts(int limit);
	
	
}
