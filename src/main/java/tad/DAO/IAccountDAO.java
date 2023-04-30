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

	public Account FindUserAdmin(String login);

	public Role GetRoleViaEnum(EnumRoleID roleID);

	public Role GetRoleViaDB(String idUser);

	public boolean AddUserToDB(Account acc);
	
	public ArrayList<Account> GetListAccountWithRole(EnumRoleID roleID);

}
