package tad.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.entity.Account;

@Controller
@RequestMapping("admin/user")
public class AdminControllerUsers {
	@Autowired
	private IAccountDAO accDAO;
	
	@RequestMapping()
	public String index()
	{
		return "redirect:user/get-employee.htm";
	}
	
	@RequestMapping("get-guest")
	public String gUserListGuest(ModelMap modelMap)
	{
		ArrayList<Account> accounts = accDAO.GetListAccountWithRole(EnumRoleID.GUEST);
		modelMap.addAttribute("accounts", accounts);
		modelMap.addAttribute("source", "get-guest.htm");
		return "admin/admin-user-manager";
	}
	
	@RequestMapping("get-employee")
	public String gUserListEmployee(ModelMap modelMap)
	{
		ArrayList<Account> accounts = accDAO.GetListAccountWithRole(EnumRoleID.EMPLOYEE);
		modelMap.addAttribute("accounts", accounts);
		modelMap.addAttribute("source", "get-employee.htm");
		return "admin/admin-user-manager";
	}
	
	@RequestMapping("enable{id}")
	public String pEnableStatusUser(@PathVariable("id") int id, ModelMap modelMap, @RequestParam("source") String source)
	{
		System.out.println(id);
		Account acc = accDAO.GetUser(id);
		if(acc != null)
		{
			System.out.println(acc.getStatus());
			if(acc.getStatus() == 1)
				acc.setStatus(0);
			else if(acc.getStatus() == 0)
				acc.setStatus(1);
			accDAO.UpdateAccount(acc);
		}
	
		return "redirect:" + source;
	}
}
