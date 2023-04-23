package tad.DAOImpl;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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

	@Override
	public boolean AddCategory(Category newCategory) {
		// TODO Auto-generated method stub
		return false;
	}

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
	public Category GetCategory(int id) { // TODO Auto-generated method stub
		String hql = String.format("From Category Where id = %d", id);
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		Category category = null;
		try {
			category = (Category) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return category;
	}

	@Override
	public boolean EditCategory(Category changedCategory) {
		// TODO Auto-generated method stub
		boolean isSuccess = false;
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(changedCategory);
			t.commit();
			isSuccess = true;

		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			isSuccess= false;
		}
		finally
		{
			session.close();
			
		}
		return isSuccess;
	}

}
