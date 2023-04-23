package tad.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.dao.AccountDAO;
import tad.entities.Account;

@Transactional
public class AccountDAOImpl implements AccountDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Account getAccount(int id) {
		/*
		 * Session session = sessionFactory.getCurrentSession(); String hql =
		 * "FROM Account WHERE accountId = :id"; Query query = session.createQuery(hql);
		 * query.setInteger("id", id); Account account = (Account) query.uniqueResult();
		 * return account;
		 */
		return null;
	}

	@Override
	public Account findByEmail(String email) {
		/*
		 * Session session = sessionFactory.getCurrentSession(); String hql =
		 * "FROM Account WHERE email = :email"; Query query = session.createQuery(hql);
		 * query.setString("email", email); Account account = (Account)
		 * query.uniqueResult(); return account;
		 */
		return null;
	}

	@Override
	public List<Account> listAccounts() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Account> list = session.createQuery("FROM Account").list();
		return list;
	}

	@Override
	public List<Account> listLockAccounts() {
		/*
		 * Session session = sessionFactory.getCurrentSession();
		 * 
		 * @SuppressWarnings("unchecked") List<Account> list =
		 * session.createQuery("FROM Account WHERE accountId > 1 and status = 1").list()
		 * ; return list;
		 */
		return null;
	}

	@Override
	public boolean insert(Account account) {

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(account);
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
	public boolean update(Account account) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(account);
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
	public boolean delete(Account account) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(account);
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
	public Account findByPhone(String phone) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Account WHERE phone = :phone";
		Query query = session.createQuery(hql);
		query.setString("phone", phone);
		Account account = (Account) query.uniqueResult();
		return account;
	}
}
