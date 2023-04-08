package tad.DAOImpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tad.DAO.IAdminDAO;
import tad.entity.Account;

public class AdminDAOImpl implements IAdminDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Account FindUserAdmin(String username, String psswrd) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Account Where Email = :username and Password = :psswrd";
		Query query = session.createQuery(hql);
		query.setString("username", username);
		query.setString("psswrd", psswrd);
		Account admin = null;
		try
		{
			admin = (Account) query.uniqueResult();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return admin;
	}

}
