package tad.DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import org.hibernate.Query;
import tad.DAO.ICategoryDAO;
import tad.entity.Category;

@Transactional
public class CategoryDAOImpl implements ICategoryDAO {

	private SessionFactory sessionFactory;
	private static ArrayList<Category> listCategory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private ArrayList<Category> instanceList() {
		if (listCategory == null) {
			String hql = "From Category";
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			listCategory = (ArrayList<Category>) query.list();
		}
		return listCategory;
	}

	@Override
	public boolean DeleteCategory(String id) {
		return false;
	}

	@Override
	public boolean AddCategory(Category newCategory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Category> GetListCategories() {
		// TODO 
		return instanceList();
	}

	@Override
	public Category GetCategory() {
		// TODO Auto-generated method stub
		return null;
	}

}
