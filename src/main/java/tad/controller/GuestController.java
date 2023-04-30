package tad.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.EnumRoleID;
import tad.bean.LoginBean;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Role;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/guest")
public class GuestController {
	@Autowired
	private IAccountDAO accountDAO;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		LoginBean emptyLogin = new LoginBean();
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, emptyLogin);
		return "user/user-login";
	}

	@RequestMapping(params = "guest-login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") LoginBean user, ModelMap modelMap, HttpSession session) {

		Account ValidateAdmin = accountDAO.FindUserByEmail(user.getUsername());
		if (ValidateAdmin != null && ValidateAdmin.getPassword().equals(user.getPassword())) {
			if (ValidateAdmin.getRole().getRoleId().equals("ADMIN")) {
				session.setAttribute(DefineAttribute.UserAttribute, ValidateAdmin);
				return "redirect:admin/";
			}
			return "redirect:/";
		}
		if (ValidateAdmin != null) {
			System.out.println(user.getPassword() + " vs " + ValidateAdmin.getPassword());
		}
		return "redirect:/guest.htm";
	}

	@RequestMapping(value = "guest-register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		UserBean user = new UserBean();
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		return "user/user-register";
	}

	@Autowired
	private ServletContext context;
	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile uploadFile;

	@Autowired
	private ConverterUploadHandler convertHandler;

	@RequestMapping(value = "guest-register", method = RequestMethod.POST)
	public String register(@Validated @ModelAttribute("user") UserBean user, BindingResult errors, ModelMap modelMap) {
		if (!errors.hasErrors()) {
			String avatarDir = "";
			if (!user.getAvatar().isEmpty()) {
				if (convertHandler.MoveMultipartToDirectory(user.getAvatar(), uploadFile.getPath())) {
					user.setAvatarDir(convertHandler.SetImageNameViaMultipartFile(user.getAvatar()));
				}
			}

			Role role = accountDAO.GetRoleViaEnum(EnumRoleID.GUEST);
			Account account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(),
					user.getPhoneNumber(), avatarDir, user.getPassword());

			if (!user.getAvatarDir().isEmpty()) {
				account.setAvatar(user.getAvatarDir());
			}

			if (accountDAO.AddUserToDB(account)) {

				return "redirect:/";
			}
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
		modelMap.addAttribute("message", "Fail in resgiter");
		return "user/user-register";
	}

	@RequestMapping("logout")
	public String logout(ModelMap model, HttpSession session) {
		Account crrAcc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (crrAcc != null)
			session.removeAttribute(DefineAttribute.UserAttribute);
		return "redirect:/";
	}
}
