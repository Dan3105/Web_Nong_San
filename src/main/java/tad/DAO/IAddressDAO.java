package tad.DAO;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Account;
import tad.entity.Address;
import tad.entity.District;
import tad.entity.Province;
import tad.entity.Ward;

@Transactional
public interface IAddressDAO {
	public ArrayList<Province> GetProvinceList();
	public Account FetchAddressAccount(Account account);
	
	public Address GetAddress(int id);
	public boolean CreateAddress(Account account, Address address);
	public boolean UpdateAddress(Address address);
	public boolean DeleteAddress(Address address);

	public Ward GetWard(int id);
}
