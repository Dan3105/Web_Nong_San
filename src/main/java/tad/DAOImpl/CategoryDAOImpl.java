package tad.DAOImpl;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import tad.DAO.ICategoryDAO;
import tad.entity.Category;

@Transactional
public class CategoryDAOImpl implements ICategoryDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Override
	public boolean DeleteCategory(String id) {
		return false;
	}

	@Override public boolean AddCategory(Category newCategory) { 
		// TODO	  Auto-generated method stub 
		return false; }

	@Override
	public ArrayList<Category> GetListCategories() { 
		// TODO 
		String hql = "From Category";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Category> listCategory = (ArrayList<Category>) query.list();
		return listCategory;
	}

	@Override
	public Category GetCategory() { // TODO Auto-generated method stub
		return null;
	}

}
