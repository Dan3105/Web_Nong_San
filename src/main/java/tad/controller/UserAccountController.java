package tad.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.IAccountDAO;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;

@Controller
@RequestMapping(value = "/account/")
public class UserAccountController {
	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	@Qualifier("accountDir")
	private UploadFile accountDir;

	@Autowired
	@Qualifier("rootFile")
	private UploadFile rootFile;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "index")
	public String profile(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			return "index.htm";
		}

		UserBean accountBean = new UserBean();
		accountBean.setLastName(account.getLastName());
		accountBean.setFirstName(account.getFirstName());
		accountBean.setEmail(account.getEmail());
		accountBean.setPhoneNumber(account.getPhoneNumber());

		modelMap.addAttribute("accountBean", accountBean);
		return "account/accountProfile";
	}

	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String editProfile(ModelMap model, RedirectAttributes reAttributes, HttpSession session,
			@Validated @ModelAttribute("accountBean") UserBean accountBean, BindingResult errors) {

		if (errors.hasErrors()) {
			System.out.println("No");
			model.addAttribute("message", 0);
			model.addAttribute("accountBean", accountBean);
			return "account/accountProfile";
		}

		Account account = (Account) session.getAttribute("account");

		account.setLastName(accountBean.getLastName());
		account.setFirstName(accountBean.getFirstName());
		account.setEmail(accountBean.getEmail());
		account.setPhoneNumber(accountBean.getPhoneNumber());

		if (accountBean.getAvatar().isEmpty()) {
		} else {
			File file = new File(rootFile.getPath() + account.getAvatar());
			if (file.exists())
				file.delete();

			String avatarPath = accountDir.getPath() + accountBean.getAvatar();
			account.setAvatar(accountBean.getAvatar().getOriginalFilename());

			try {
				accountBean.getAvatar().transferTo(new File(avatarPath));
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		boolean updated = accountDAO.updateAccount(account);
		if (updated) {
			System.out.println("OK");
			model.addAttribute("message", 1);
		} else {
			System.out.println("No");
			model.addAttribute("message", 0);
		}

		model.addAttribute("accountBean", accountBean);
		return "account/accountProfile";

	}

}