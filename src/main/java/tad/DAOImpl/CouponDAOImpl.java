package tad.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.ICouponDAO;
import tad.entity.Coupon;
import tad.entity.Product;

@Transactional
public class CouponDAOImpl implements ICouponDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Coupon> listCoupons() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Coupon> list = session.createQuery("FROM Coupon").list();
		return list;
	}

	@Override
	public List<Product> listProductWithCoupon(int limit) {

		return null;
	}

	@Override
	public boolean add(Coupon coupon) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Coupon coupon) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Coupon coupon) {
		// TODO Auto-generated method stub
		return false;
	}

}
