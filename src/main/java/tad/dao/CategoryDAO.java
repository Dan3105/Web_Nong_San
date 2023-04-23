package tad.dao;

import java.util.List;

import tad.entities.Category;

public interface CategoryDAO {

	List<Category> listCategories();

	Category getCategory(int id);

	Category getCategoryByName(String name);

	boolean insert(Category category);

	boolean update(Category category);

	boolean delete(Category category);

}
