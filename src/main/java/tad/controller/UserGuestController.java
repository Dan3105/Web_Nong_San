package tad.controller;

import java.util.Base64;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
public class UserGuestController {
	@Autowired
	private IAccountDAO accountDAO;

	public Cookie read(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					String decodedvalue = new String(Base64.getDecoder().decode(cookie.getValue()));
					cookie.setValue(decodedvalue);
					return cookie;
				}
			}
		}
		return null;
	}

	public Cookie create(String name, String value, int days) {
		String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodedValue);
		cookie.setMaxAge(days * 24 * 60 * 60);
		cookie.setPath("/");
		return cookie;

	}

	public void delete(String name) {
		this.create(name, "", 0);
	}

	@RequestMapping()
	public String index(ModelMap modelMap, HttpServletRequest request) {
		LoginBean emptyLogin = new LoginBean();
		Cookie ckemail = this.read(request, "email");
		Cookie ckpw = this.read(request, "pass");
		if (ckemail != null) {
			String email = ckemail.getValue();
			String pwd = ckpw.getValue();

			emptyLogin.setUsername(email);
			emptyLogin.setPassword(pwd);
		}
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute, emptyLogin);
		return "user/user-login";
	}

	@RequestMapping(params = "guest-login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") LoginBean user, ModelMap modelMap, HttpSession session,
			HttpServletResponse response) {
		Account ValidateAdmin = accountDAO.findAccountByEmail(user.getUsername());

		if (ValidateAdmin != null && ValidateAdmin.getStatus() != 0
				&& BCrypt.checkpw(user.getPassword(), ValidateAdmin.getPassword())) {

			if (ValidateAdmin.getStatus() == 0) {
				modelMap.addAttribute("error", "Tài khoản không đúng hoặc sai mật khẩu");
				modelMap.addAttribute(DefineAttribute.UserBeanAttribute,  user);
				return "user/user-login";
			}

			// Ghi nho tai khoan bang cookie
			if (user.getIsRemember()) {
				Cookie ckemail = this.create("email", ValidateAdmin.getEmail(), 30);
				Cookie ckpass = this.create("pass", user.getPassword(), 30);

				response.addCookie(ckemail);
				response.addCookie(ckpass);

			} else {
				this.delete("email");
				this.delete("pass");
			}


			session.setAttribute(DefineAttribute.UserAttribute, ValidateAdmin);
			return "redirect:/";
		}

		modelMap.addAttribute("error", "Tài khoản không đúng hoặc sai mật khẩu");
		modelMap.addAttribute(DefineAttribute.UserBeanAttribute,  user);
		return "user/user-login";
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
	public String register(@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user,
			BindingResult errors, ModelMap modelMap) {
		if (!errors.hasErrors()) {

			if (!user.getAvatar().isEmpty()) {
				if (convertHandler.MoveMultipartToDirectory(user.getAvatar(), uploadFile.getPath())) {
					user.setAvatarDir(convertHandler.SetImageNameViaMultipartFile(user.getAvatar()));
				}
			}

			Role role = accountDAO.getRoleViaEnum(EnumRoleID.GUEST);
			Account account = new Account(role, user.getLastName(), user.getFirstName(), user.getEmail(),
					user.getPhoneNumber(), user.getAvatarDir(), user.getPassword());

			if(accountDAO.findAccountByEmail(user.getEmail()) != null)
			{
				modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
				modelMap.addAttribute("message", "Email is already exists");
				return "user/user-register";
			}
			
			if (accountDAO.addAccountToDB(account)) {

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
	
	@Autowired
	JavaMailSender mailer;

	@RequestMapping("resend-password")
	public String resendPassword()
	{
		return "";
	}
}
