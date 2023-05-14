package tad.DAOImpl;

import java.util.ArrayList;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import tad.DAO.IAccountDAO;
import tad.DAO.IAddressDAO;
import tad.entity.Account;
import tad.entity.Address;
import tad.entity.Province;
import tad.entity.Ward;

public class AddressDAOImpl implements IAddressDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Autowired
	private IAccountDAO accountDAO;

	@Override
	public Account FetchAddressAccount(Account account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Account taccount = null;
		try {
			taccount = (Account) session.get(Account.class, account.getAccountId());
			Hibernate.initialize(taccount.getAddresses());
			tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			System.out.println("Fetch Address occur error");
			System.out.println(e);
		} finally {
			session.close();
		}
		return taccount == null ? account : taccount;
	}

	@Override
	public ArrayList<Province> GetProvinceList() {
		// TODO Auto-generated method stub
		String hql = "From Province";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Province> listProvince = (ArrayList<Province>) query.list();
		return listProvince;
	}

	@Override
	public boolean CreateAddress(Account account, Address address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(address);
			t.commit();
			session.close();
			
			account = FetchAddressAccount(account);
			account.getAddresses().add(address);

			return accountDAO.UpdateAccount(account);
		} catch (Exception ex) {
			t.rollback();
			System.out.println("Create Address occur error");
			System.out.println(ex);
		} finally {
			if (session.isOpen())
				session.close();
		}
		return false;
	}

	@Override
	public boolean UpdateAddress(Address address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(address);
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
	public boolean DeleteAddress(Address address) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(address);
			t.commit();
			return true;

		} catch (Exception e) {
			t.rollback();
			System.out.println(e);
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Address GetAddress(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Address Where AddressID = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Address add = null;
		try {
			add = (Address) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return add;
	}

	@Override
	public Ward GetWard(int id) {
		// TODO Auto-generated method stub
		String hql = "From Ward where WardID = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);

		Ward ward = null;
		try {
			ward = (Ward) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return ward;
	}

}
