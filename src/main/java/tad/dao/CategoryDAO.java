package tad.dao;

import java.util.List;

import tad.entities.Category;

public interface CategoryDAO {

	List<Category> listCategories();

	List<Category> listCategoriesHasProducts(int limit);

	Category getCategory(int id);

	Category getCategoryByName(String name);

	boolean insert(Category category);

	boolean update(Category category);

	boolean delete(Category category);

}
