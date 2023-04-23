package tad.dao;

import java.util.List;

import tad.entities.Coupon;
import tad.entities.Product;

public interface CouponDAO {
	List<Coupon> listCoupons();

	List<Product> listProductWithCoupon(int limit);

	boolean add(Coupon coupon);

	boolean update(Coupon coupon);

	boolean delete(Coupon coupon);
}
