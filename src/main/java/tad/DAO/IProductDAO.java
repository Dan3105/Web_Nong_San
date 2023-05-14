package tad.DAO;

import java.util.Date;
import java.util.List;

import tad.entity.Account;
import tad.entity.Product;

public interface IProductDAO {

	List<Product> listProducts();

	List<Product> listProducts(String productName, float price, String image, int quantity, String detail,
			Date postingDate, Date expiryDate);

	List<Product> filterProductByName(String name);

	List<Product> listProductsWithCoupon();

	boolean insert(Product product);

	boolean update(Product product);

	boolean delete(Product product);

	public Product GetProduct(int id);
	
	public Account FetchProductsAccount(Account acc);
}