package tad.controller;

import java.util.ArrayList;

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
import tad.DAO.IAddressDAO;
import tad.bean.AddressBean;
import tad.bean.AddressDatasBean;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Province;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/admin")
public class AdminControllerOverview {
	@RequestMapping("overview")
	public String overview(ModelMap model) {
		return "admin/admin-menu";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "redirect:/admin/overview.htm";
	}

	@RequestMapping("logout.htm")
	public String logout(ModelMap model, HttpSession session) {
		return "redirect:/guest/logout.htm";
	}

	@RequestMapping("profile.htm")
	public String gInfo(ModelMap model, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}

		UserBean userBean = new UserBean(acc.getEmail(), acc.getFirstName(), acc.getLastName(), acc.getPhoneNumber());
		userBean.setPassword("***************");
		model.addAttribute(DefineAttribute.UserBeanAttribute, userBean);
		return "admin/admin-profile";
	}

	@Autowired
	private IAccountDAO accountDAO;

	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile uploadFile;

	@Autowired
	private ConverterUploadHandler convertHandler;

	@RequestMapping(value = "profile.htm", params = "update", method = RequestMethod.POST)
	public String pInfo(@Validated @ModelAttribute(DefineAttribute.UserBeanAttribute) UserBean user,
			BindingResult errors, HttpSession session, ModelMap modelMap) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}

		if (errors.hasErrors()) {

			for (var error : errors.getAllErrors()) {
				System.out.println(error.toString());
			}

			modelMap.addAttribute(DefineAttribute.UserBeanAttribute, user);
			modelMap.addAttribute("message", false);
			return "admin/admin-profile";
		}
		acc.setLastName(user.getLastName());
		acc.setFirstName(user.getFirstName());
		acc.setPhoneNumber(user.getPhoneNumber());
		acc.setEmail(user.getEmail());

		if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
			if (convertHandler.MoveMultipartToDirectory(user.getAvatar(), uploadFile.getPath())) {
				user.setAvatarDir(convertHandler.SetImageNameViaMultipartFile(user.getAvatar()));
			}
		}

		if (!user.getAvatarDir().isEmpty())
			acc.setAvatar(user.getAvatarDir());

		accountDAO.UpdateAccount(acc);

		modelMap.addAttribute(user);
		modelMap.addAttribute("message", true);
		return "admin/admin-profile";
	}

	@Autowired
	private IAddressDAO addressDAO;
	
	@RequestMapping("address")
	public String gAddressAccount(HttpSession session, ModelMap modelMap) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if(acc == null)
		{
			return "redirect:/";
		}
		Account managerAcc = addressDAO.FetchAddressAccount(acc);
		ArrayList<Province> province = addressDAO.GetProvinceList();
		AddressBean addressBean = new AddressDatasBean().ConvertToDataAddressBean(province);
		
		
		modelMap.addAttribute("addresses", managerAcc.getAddresses());
		modelMap.addAttribute("address", addressBean);
		return "admin/admin-address";
	}
	
	
}
