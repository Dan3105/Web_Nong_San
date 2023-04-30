package tad.DAO;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Account;
import tad.entity.Role;

@Transactional
public interface IAccountDAO {
	public static enum EnumRoleID {
		GUEST, ADMIN, EMPLOYEE,
	}

	public Account FindUserByEmail(String login);
	
	public Account GetUser(int id);

	public Role GetRoleViaEnum(EnumRoleID roleID);

	public boolean AddUserToDB(Account acc);
	
	public ArrayList<Account> GetListAccountWithRole(EnumRoleID roleID);

	public boolean UpdateAccount(Account account);
}
