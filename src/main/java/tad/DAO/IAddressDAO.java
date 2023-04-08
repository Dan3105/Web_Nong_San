package tad.DAO;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Province;

@Transactional
public interface IAddressDAO {
	public ArrayList<Province> GetProvinceList();
}
