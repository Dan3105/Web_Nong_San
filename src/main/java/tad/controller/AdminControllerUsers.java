package tad.controller;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Role;
import tad.utility.Constants;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("admin/user")
public class AdminControllerUsers {
	@Autowired
	private IAccountDAO accountDAO;

	@RequestMapping()
	public String index() {
		return "redirect:user/get-employee.htm";
	}

	@RequestMapping("get-guest")
	public String gUserListGuest(ModelMap modelMap,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		List<Account> accounts = accountDAO.listAccountWithRole(EnumRoleID.GUEST);

		int startIndex = Math.max((crrPage - 1) * Constants.USER_PER_PAGE, 0);
		if (startIndex >= accounts.size()) {
			crrPage = crrPage - 1; // lui lai trang truoc do
			startIndex = Math.max((crrPage - 1) * Constants.USER_PER_PAGE, 0);
		}
		modelMap.addAttribute("accounts",
				accounts.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, accounts.size())));

		int totalPage = accounts.size() / Constants.USER_PER_PAGE;
		if (accounts.size() % Constants.USER_PER_PAGE != 0) {
			totalPage += 1;
		}

		modelMap.addAttribute("crrPage", crrPage);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("source", "get-guest.htm");

		return "admin/admin-user-manager";
	}

	@RequestMapping("get-employee")
	public String gUserListEmployee(ModelMap modelMap,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {
		List<Account> accounts = accountDAO.listAccountWithRole(EnumRoleID.EMPLOYEE);

		int startIndex = Math.max((crrPage - 1) * Constants.USER_PER_PAGE, 0);
		if (startIndex >= accounts.size()) {
			crrPage = crrPage - 1; // lui lai trang truoc do
			startIndex = Math.max((crrPage - 1) * Constants.USER_PER_PAGE, 0);
		}
		modelMap.addAttribute("accounts",
				accounts.subList(startIndex, Math.min(startIndex + Constants.USER_PER_PAGE, accounts.size())));

		int totalPage = accounts.size() / Constants.USER_PER_PAGE;
		if (accounts.size() % Constants.USER_PER_PAGE != 0) {
			totalPage += 1;
		}

		modelMap.addAttribute("crrPage", crrPage);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("source", "get-employee.htm");
		return "admin/admin-user-manager";
	}

	@RequestMapping(value = "enable{id}")
	public String gEnableStatusUser(@PathVariable("id") int id, ModelMap modelMap,
			@RequestParam("source") String source) {

		Account acc = accountDAO.getAccount(id);
		if (acc != null) {
			System.out.println(acc.getStatus());
			if (acc.getStatus() == 1)
				acc.setStatus(0);
			else if (acc.getStatus() == 0)
				acc.setStatus(1);
			accountDAO.updateAccount(acc);
		}

		return "redirect:" + source;
	}

	@RequestMapping(value = "delete{id}")
	public String gDeleteUser(@PathVariable("id") int id, ModelMap modelMap, @RequestParam("source") String source) {
		System.out.println(id);
		Account acc = accountDAO.getAccount(id);
		if (acc != null) {
			if (accountDAO.deleteAccount(acc)) {

			}
		}

		return "redirect:" + source;
	}

	@RequestMapping("create-employee")
	public String gRegisterEmployeeForm(ModelMap modelMap) {
		UserBean accEmploy = new UserBean();
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, accEmploy);
		return "admin/admin-register-employee";
	}

	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile uploadFile;

	@Autowired
	private ConverterUploadHandler convertHandler;

	@RequestMapping(value = "employee-register", method = RequestMethod.POST)
	public String register(@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user,
			BindingResult errors, ModelMap modelMap) {
		if (!errors.hasErrors()) {
			String avatarDir = "";
			if (!user.getAvatar().isEmpty()) {
				if (convertHandler.MoveMultipartToDirectory(user.getAvatar(), uploadFile.getPath())) {
					user.setAvatarDir(convertHandler.SetImageNameViaMultipartFile(user.getAvatar()));
				}
			}

			Role role = accountDAO.getRoleViaEnum(EnumRoleID.EMPLOYEE);
			Account account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(),
					user.getPhoneNumber(), avatarDir, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));

			if (!user.getAvatarDir().isEmpty()) {
				account.setAvatar(user.getAvatarDir());
			}

			if (accountDAO.addAccountToDB(account)) {

				return "redirect:get-employee.htm";
			}
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		modelMap.addAttribute("message", "Fail in resgiter");
		return "admin/admin-register-employee";
	}
}
