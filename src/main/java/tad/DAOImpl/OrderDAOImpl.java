package tad.DAOImpl;

import java.util.ArrayList;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IOrderDAO;
import tad.entity.OrderDetail;
import tad.entity.Orders;

@Transactional
public class OrderDAOImpl implements IOrderDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public ArrayList<Orders> GetOrderFromAccount(int idAccount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Orders> GetOrderFromProduct(int idProduct) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<OrderDetail> GetOrderDetail(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertOrder(Orders order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertOrderDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateOrder(Orders order) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.saveOrUpdate(order);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();

		}
		return false;
	}

	@Override
	public ArrayList<Orders> GetUnresolveOrders() {
		// TODO Auto-generated method stub
		String hql = "From Orders where StatusOrder = 0";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Orders> listOrders = (ArrayList<Orders>) query.list();
		return listOrders;
	}

	@Override
	public ArrayList<Orders> GetMovingOrders() {
		String hql = "From Orders where StatusOrder = 1";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Orders> listOrders = (ArrayList<Orders>) query.list();
		return listOrders;
	}

	@Override
	public ArrayList<Orders> GetResolveOrders() {
		String hql = "From Orders where StatusOrder = 2";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Orders> listOrders = (ArrayList<Orders>) query.list();
		return listOrders;
	}

	@Override
	public ArrayList<Orders> GetCancelOrders() {
		String hql = "From Orders where StatusOrder = 3";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Orders> listOrders = (ArrayList<Orders>) query.list();
		return listOrders;
	}

	@Override
	public boolean update(Orders order) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(order);
			t.commit();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
		} finally {
			session.close();

		}
		return false;
	}

	@Override
	public Orders FetchOrderDetail(Orders order) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Orders tOrder = null;
		try {
			tOrder = (Orders) session.get(Orders.class, order.getOrderId());
			Hibernate.initialize(tOrder.getOrderDetails());
			tx.commit();

		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Order occur error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return tOrder == null ? order : tOrder;
	}

	@Override
	public Orders findOrder(int id) {
		String hql = "FROM Orders WHERE OrderID = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Orders order = null;
		try {
			order = (Orders) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return order;
	}
}