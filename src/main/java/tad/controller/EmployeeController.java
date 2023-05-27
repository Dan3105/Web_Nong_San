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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.IAccountDAO;
import tad.DAO.IAddressDAO;
import tad.bean.AddressBean;
import tad.bean.AddressDatasBean;
import tad.bean.AddressUserBean;
import tad.bean.UploadFile;
import tad.bean.UserBean;
import tad.entity.Account;
import tad.entity.Address;
import tad.entity.Province;
import tad.entity.Ward;
import tad.utility.ConverterUploadHandler;
import tad.utility.DefineAttribute;

@Controller
@RequestMapping("/employee/")
public class EmployeeController {
	@RequestMapping("overview")
	public String overview(ModelMap model) {
		return "employee/employee-menu";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "redirect:/employee/overview.htm";
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
		return "employee/employee-profile";
	}

	@Autowired
	@Qualifier("accountImgDir")
	private UploadFile uploadFile;

	@Autowired
	private IAccountDAO accountDAO;

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
			return "employee/employee-profile";
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

		accountDAO.updateAccount(acc);

		modelMap.addAttribute(user);
		modelMap.addAttribute("message", true);
		return "employee/employee-profile";
	}

	@Autowired
	private IAddressDAO addressDAO;

	@RequestMapping("address")
	public String gAddressAccount(HttpSession session, ModelMap modelMap) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}
		acc = addressDAO.fetchAddressAccount(acc);
		ArrayList<Province> province = addressDAO.getProvinceList();
		AddressBean addressBean = new AddressDatasBean().ConvertToDataAddressBean(province);

		AddressUserBean useraddress = new AddressUserBean();

		modelMap.addAttribute("useraddress", useraddress);
		modelMap.addAttribute("addresses", acc.getAddresses());
		modelMap.addAttribute("address", addressBean);
		return "employee/employee-address";
	}

	@RequestMapping(value = "create-address", method = RequestMethod.POST)
	public String pCreateAddressAccount(@Validated @ModelAttribute("useraddress") AddressUserBean userAddress,
			BindingResult errors, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}
		if (errors.hasErrors()) {
			return "redirect:/employee/address.htm";
		}
		Ward ward = addressDAO.getWard(userAddress.getWardId());
		if (ward == null) {
			return "redirect:/";
		}
		Address address = new Address(ward, acc);
		address.setName(userAddress.getAddressLine());
		addressDAO.insertAddress(acc, address);
		return "redirect:/employee/address.htm";
	}

	@RequestMapping(value = "update-address{id}", method = RequestMethod.POST)
	public String pUpdateAddressAccount(@Validated @ModelAttribute("useraddress") AddressUserBean user,
			BindingResult errors, @PathVariable("id") int id, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}
		if (errors.hasErrors()) {
			return "redirect:/employee/address.htm";
		}
		Address address = null;
		acc = addressDAO.fetchAddressAccount(acc);
		for (Address uAddress : acc.getAddresses()) {
			if (uAddress.getAddressId() == id) {
				address = uAddress;
				break;
			}
		}
		if (address == null) {
			return "redirect:/";
		}

		Ward ward = addressDAO.getWard(user.getWardId());

		address.setName(user.getAddressLine());
		address.setWard(ward);
		addressDAO.updateAddress(address);
		return "redirect:/employee/address.htm";
	}

	@RequestMapping(value = "address/delete{id}", method = RequestMethod.POST)
	public String pDeleteAddressAccount(@Validated @ModelAttribute("useraddress") AddressUserBean user,
			BindingResult errors, @PathVariable("id") int id, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}
		if (errors.hasErrors()) {
			return "redirect:/employee/address.htm";
		}
		Address address = null;
		acc = addressDAO.fetchAddressAccount(acc);
		for (Address uAddress : acc.getAddresses()) {
			if (uAddress.getAddressId() == id) {
				address = uAddress;
				break;
			}
		}

		if (address != null) {
			if (addressDAO.deleteAddress(address)) {

			}
		}

		return "redirect:/employee/address.htm";
	}

	@RequestMapping("set-addr-default{id}")
	public String setDefaultAddress(@PathVariable("id") int id, HttpSession session) {
		Account acc = (Account) session.getAttribute(DefineAttribute.UserAttribute);
		if (acc == null) {
			return "redirect:/";
		}
		acc = addressDAO.fetchAddressAccount(acc);
		for (Address uAddress : acc.getAddresses()) {
			if (uAddress.getAddressId() == id) {
				acc.setDefaultAddress(uAddress);
				accountDAO.updateAccount(acc);
				break;
			}
		}

		return "redirect:/employee/address.htm";
	}
}
