package tad.DAOImpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import tad.DAO.IAccountDAO;
import tad.entity.Account;
import tad.entity.Role;

public class AccountDAOImpl implements IAccountDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Account FindUserAdmin(String username) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Account Where Email = :username";
		Query query = session.createQuery(hql);
		query.setString("username", username);
		Account acc = null;
		try {
			acc= (Account) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}

		return acc;
	}

	@Override
	public Role GetRoleViaEnum(RoleDefine role) {

		String roleGetterID = "";
		switch (role) {
		case GUEST:
			roleGetterID = "GUEST";
			break;
		case ADMIN:
			roleGetterID = "ADMIN";
		default:
			roleGetterID = "";
		}
		if (roleGetterID.isEmpty())
			return null;
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Role Where RoleID = :roleGetterID";
		Query query = session.createQuery(hql);
		query.setString("roleGetterID", roleGetterID);
		Role roleDB = null;

		try {
			roleDB = (Role) query.uniqueResult();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return roleDB;
	}

	@Override
	public Role GetRoleViaDB(String accountId) {
		// TODO Auto-generated method stub
		String hql = "From User Where AccountID = :accountId";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setString("accountId", accountId);

		Role roleDB = null;
		try {
			roleDB = ((Account) query.uniqueResult()).getRole();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return roleDB;
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
