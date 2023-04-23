package tad.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import tad.dao.CategoryDAO;
import tad.entities.Category;

@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	private SessionFactory sessionFactory;

	@Override
	public List<Category> listCategories() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Category> list = session.createQuery("FROM Category").list();
		return list;
	}

	@Override
	public Category getCategory(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Category getCategoryByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

}
