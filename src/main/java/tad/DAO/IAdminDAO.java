package tad.DAO;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Account;

@Transactional
public interface IAdminDAO {
	public Account FindUserAdmin(String login, String psswd);
}
