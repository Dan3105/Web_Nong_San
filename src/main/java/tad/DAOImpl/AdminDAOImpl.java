package tad.DAOImpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tad.DAO.IAdminDAO;
import tad.entity.Admin;

public class AdminDAOImpl implements IAdminDAO {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Admin FindUserAdmin(String username, String psswrd)
	{
		Session session = sessionFactory.getCurrentSession();
		String hql = "From Admin Where Email = :username and Password = :psswrd";
		Query query = session.createQuery(hql);
		query.setString("username", username);
		query.setString("psswrd", psswrd);
		Admin admin = (Admin)query.uniqueResult();
		
		return admin;
	}
}
