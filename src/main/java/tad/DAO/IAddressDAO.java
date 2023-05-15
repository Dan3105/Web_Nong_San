package tad.DAO;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Account;
import tad.entity.Address;
import tad.entity.Province;
import tad.entity.Ward;

@Transactional
public interface IAddressDAO {
	public ArrayList<Province> getProvinceList();
	public Account fetchAddressAccount(Account account);

	public Address getAddress(int id);
	public boolean createAddress(Account account, Address address);
	public boolean updateAddress(Address address);
	public boolean deleteAddress(Address address);

	public Ward getWard(int id);
}
