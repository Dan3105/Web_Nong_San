package tad.dao;

import java.util.List;

import tad.entities.Cart;
import tad.entities.Coupon;

public interface CartDAO {

	boolean insert(Cart cart);

	boolean delete(Cart cart);

	Coupon getCoupon(String coupon);

	int updateQuantity(int foodID, int qty);

	Cart getCart(int accountID, int productID);

	List<Cart> getCart(int accountID);

	int removeCart(int accountID);

	int updateCoupon(String coupon, int amount);

}
