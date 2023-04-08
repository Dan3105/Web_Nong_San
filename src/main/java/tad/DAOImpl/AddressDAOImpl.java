package tad.DAOImpl;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tad.DAO.IAddressDAO;
import tad.entity.District;
import tad.entity.Province;
import tad.entity.Ward;

public class AddressDAOImpl implements IAddressDAO {
	
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public ArrayList<Province> GetProvinceList() {
		// TODO Auto-generated method stub
		String hql = "From Province";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		ArrayList<Province> listProvince = (ArrayList<Province>) query.list();
		return listProvince;
	}

}
