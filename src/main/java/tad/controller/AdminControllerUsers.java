package tad.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.bean.UserBean;
import tad.entity.Account;

@Controller
@RequestMapping("admin/user")
public class AdminControllerUsers {
	@Autowired
	private IAccountDAO accDAO;
	
	@RequestMapping()
	public String gUserListEmployee(ModelMap modelMap)
	{
		ArrayList<Account> accounts = accDAO.GetListAccountWithRole(EnumRoleID.EMPLOYEE);
		modelMap.addAttribute("accounts", accounts);
		return "admin/admin-user-manager";
	}
	
	@RequestMapping("get-guest")
	public String gUserListGuest(ModelMap modelMap)
	{
		ArrayList<Account> accounts = accDAO.GetListAccountWithRole(EnumRoleID.EMPLOYEE);
		modelMap.addAttribute("accounts", accounts);
		return "admin/admin-user-manager";
	}
	
	
}
