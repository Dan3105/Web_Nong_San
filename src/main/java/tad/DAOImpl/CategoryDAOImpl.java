package tad.DAOImpl;

import java.util.ArrayList;
import java.util.List;

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
	public boolean DeleteCategory(Category category) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try
		{
			session.delete(category);
			t.commit();
			return true;
			
		}
		catch(Exception e)
		{
			t.rollback();
			System.out.println(e);
		}
		finally
		{
			session.close();
		}
		return false;
	}

	@Override
	public boolean AddCategory(Category newCategory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(newCategory);
			t.commit();
			return true;
		} catch (Exception ex) {
			System.out.println(ex);
			t.rollback();
		} finally {
			session.close();
		}
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
		String hql = "FROM Category WHERE id = :id";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Category category = null;
		try {
			category = (Category) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e);
		}
		return category;

	}

	@Override
	public boolean UpdateCategory(Category changedCategory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.update(changedCategory);
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
	public List<Category> listCategoriesHasProducts(int i) {
		// TODO Auto-generated method stub
		return null;
	}

}