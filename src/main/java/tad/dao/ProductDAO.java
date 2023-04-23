package tad.dao;

import java.util.Date;
import java.util.List;

import tad.entities.Product;

public interface ProductDAO {

	List<Product> listProducts();

	List<Product> listProducts(String productName, float price, String image, int quantity, String detail,
			Date postingDate, Date expiryDate);

	List<Product> filterProductByName(String name);

	List<Product> listProductsWithCoupon();

	boolean insert(Product product);

	boolean update(Product product);

	boolean delete(Product product);

}
