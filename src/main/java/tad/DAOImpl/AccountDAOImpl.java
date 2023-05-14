package tad.DAOImpl;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.IAccountDAO;
import tad.entity.Account;
import tad.entity.Role;
@Transactional
public class AccountDAOImpl implements IAccountDAO {
	@Override
	public boolean DeleteAccount(Account account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(account);
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
	public ArrayList<Account> GetListAccountWithRole(EnumRoleID roleID) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Account Where RoleID = :role";
		Query query = session.createQuery(hql);
		query.setString("role", roleID.toString());
		ArrayList<Account> acc = (ArrayList<Account>) query.list();
		return acc;
	}

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Account FindUserByEmail(String username) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Account Where Email = :username";
		Query query = session.createQuery(hql);
		query.setString("username", username);
		Account acc = null;
		try {
			acc = (Account) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}

		return acc;
	}

	@Override
	public Account GetUser(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Account Where AccountID = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Account acc = null;
		try {
			acc = (Account) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return acc;
	}

	@Override
	public Role GetRoleViaEnum(EnumRoleID role) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Role Where RoleID = :roleGetterID";
		Query query = session.createQuery(hql);
		query.setString("roleGetterID", role.toString());
		Role roleDB = null;

		try {
			roleDB = (Role) query.uniqueResult();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return roleDB;
	}

	@Override
	public boolean UpdateAccount(Account account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.saveOrUpdate(account);
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
	public void FindAddressUser(Account account) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean AddUserToDB(Account acc) {
		// TODO Auto-generated method stub

		try {
			Session session = sessionFactory.openSession(); // session.refresh(acc);
			Transaction t = session.beginTransaction();
			session.save(acc);
			t.commit();
			return true;
		} catch (Exception ex) {
			System.out.println(acc.getAccountId());
			System.out.println(ex);
			return false;
		}

	}

}
