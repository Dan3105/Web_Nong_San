package tad.dao.Impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import tad.dao.ProductDAO;
import tad.entities.Product;

@Transactional
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public ProductDAOImpl() {
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Product> listProducts() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery("FROM Product").list();
		return list;
	}

	@Override
	public List<Product> listProducts(String productName, float price, String image, int quantity, String detail,
			Date postingDate, Date expiryDate) {
		return null;
	}

	@Override
	public boolean insert(Product product) {
		return false;
	}

	@Override
	public boolean update(Product product) {
		return false;
	}

	@Override
	public boolean delete(Product product) {
		return false;
	}
	@Override
	public List<Product> filterProductByName(String name) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		name = (name == null) ? "%" : "%" + name + "%";

		String hql = "FROM Product WHERE ProductName LIKE :name";

		Query query = session.createQuery(hql);
		query.setParameter("name", name);

		@SuppressWarnings("unchecked")
		List<Product> list = query.list();

		session.getTransaction().commit();
		session.close();
		return list;

	}

	@Override
	public List<Product> listProductsWithCoupon() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "FROM Product P ORDER BY P.coupons.discount DESC";
		@SuppressWarnings("unchecked")
		List<Product> list = session.createQuery(hql).list();

		return list;
	}

}
