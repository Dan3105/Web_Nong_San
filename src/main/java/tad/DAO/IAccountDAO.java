package tad.DAO;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Account;
import tad.entity.Role;
import tad.entity.Role.RoleDefine;

@Transactional
public interface IAccountDAO {
	public Account FindUserAdmin(String login);
	public Role GetRoleViaEnum(RoleDefine role);
	public Role GetRoleViaDB(String idUser);
	public boolean AddUserToDB(Account acc);
}
