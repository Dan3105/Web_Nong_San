package tad.DAO;

import java.util.List;

import tad.entity.Cart;
import tad.entity.Coupon;

public interface ICartDAO {

	boolean insert(Cart cart);

	boolean delete(Cart cart);

	Coupon getCoupon(String coupon);

	int updateQuantity(int foodID, int qty);

	Cart getCart(int accountID, int productID);

	List<Cart> getCart(int accountID);

	int removeCart(int accountID);

	int updateCoupon(String coupon, int amount);

}
