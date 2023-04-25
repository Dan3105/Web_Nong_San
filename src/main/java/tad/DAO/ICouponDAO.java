package tad.DAO;

import java.util.List;

import tad.entity.Coupon;
import tad.entity.Product;

public interface ICouponDAO {
	List<Coupon> listCoupons();

	List<Product> listProductWithCoupon(int limit);

	boolean add(Coupon coupon);

	boolean update(Coupon coupon);

	boolean delete(Coupon coupon);
}
