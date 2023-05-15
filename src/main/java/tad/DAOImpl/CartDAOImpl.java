package tad.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.ICartDAO;
import tad.entity.Cart;
import tad.entity.Coupon;

@Transactional
public class CartDAOImpl implements ICartDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean insertCart(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(cart);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteCart(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(cart);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Coupon getCoupon(String coupon) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateQuantity(int foodId, int qty) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Cart getCart(int accountID, int productID) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Cart WHERE accounts.accountID = :accountID AND products.productID = :productID";
		Query query = session.createQuery(hql);

		query.setInteger("accountID", accountID);
		query.setInteger("productID", productID);

		Cart cart = (Cart) query.uniqueResult();
		return cart;
	}

	@Override
	public List<Cart> getCart(int accountId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeCart(int accountId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCoupon(String coupon, int amount) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateCart(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(cart);
			t.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
		} finally {
			session.close();
		}
		return false;
	}

}
