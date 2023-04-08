package tad.DAO;

import org.springframework.transaction.annotation.Transactional;

import tad.entity.Admin;
@Transactional
public interface IAdminDAO {
	public Admin FindUserAdmin(String login, String psswd);
}
