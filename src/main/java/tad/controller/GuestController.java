package tad.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.IAccountDAO;
import tad.DAO.IAccountDAO.RoleDefine;
import tad.bean.LoginBean;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Role;

@Controller
@RequestMapping("/guest")
public class GuestController {
	@Autowired
	private IAccountDAO accountDAO;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		LoginBean emptyLogin = new LoginBean();
		modelMap.addAttribute("user", emptyLogin);
		return "user/user-login";
	}

	@RequestMapping(params = "guest-login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") LoginBean user, ModelMap modelMap, HttpSession session) {

		Account ValidateAdmin = accountDAO.FindUserAdmin(user.getUsername());
		if (ValidateAdmin != null && ValidateAdmin.getPassword().equals(user.getPassword())) {
			if (ValidateAdmin.getRole().getRoleId().equals("ADMIN")) {
				session.setAttribute("user", ValidateAdmin);
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
		modelMap.addAttribute("user", user);
		return "user/user-register";
	}

	@Autowired
	ServletContext context;

	@RequestMapping(value = "guest-register", method = RequestMethod.POST)
	public String register(@Validated @ModelAttribute("user") UserBean user, BindingResult errors, ModelMap modelMap) {
		if (!errors.hasErrors()) {
			String avatarDir = "";
			if (!user.getAvatar().isEmpty()) {
				try {
					avatarDir = context.getRealPath("/assets/img/" + user.getAvatar().getOriginalFilename());
					System.out.println(avatarDir);
					user.getAvatar().transferTo(new File(avatarDir));
				} catch (Exception ex) {
					System.out.println(ex);
				}
			}

			Role role = accountDAO.GetRoleViaEnum(RoleDefine.GUEST);
			Account account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(), avatarDir,
					user.getPassword());
			if (!user.getPhoneNumber().isEmpty() && !user.getPhoneNumber().isBlank()) {
				account.setPhoneNumber(user.getPhoneNumber());
			}
			if (accountDAO.AddUserToDB(account)) {

				return "redirect:/";
			}
		}
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("message", "Fail in resgiter");
		return "user/user-register";
	}

}
