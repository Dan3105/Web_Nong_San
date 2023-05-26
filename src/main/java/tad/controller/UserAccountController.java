package tad.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.IAccountDAO;
import tad.DAO.IAddressDAO;
import tad.bean.AddressBean;
import tad.bean.AddressDatasBean;
import tad.bean.AddressUserBean;
import tad.bean.ChangePassword;
import tad.bean.ProfileBean;
import tad.bean.UploadFile;
import tad.entity.Account;
import tad.entity.Address;
import tad.entity.Province;
import tad.entity.Ward;

@Controller
@RequestMapping(value = "/account/")
public class UserAccountController {
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private IAddressDAO addressDAO;
	@Autowired
	@Qualifier("accountDir")
	private UploadFile accountDir;

	@Autowired
	@Qualifier("rootFile")
	private UploadFile rootFile;

	@Autowired
	ServletContext servletContext;

	// Hien thi thong tin nguoi dung
	@RequestMapping(value = "index")
	public String profile(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			return "redirect:/account/index.htm";
		}

		ProfileBean profileBean = new ProfileBean();
		profileBean.setLastName(account.getLastName());
		profileBean.setFirstName(account.getFirstName());
		profileBean.setEmail(account.getEmail());
		profileBean.setPhoneNumber(account.getPhoneNumber());

		modelMap.addAttribute("profileBean", profileBean);
		return "account/accountProfile";
	}

	// Bam nut chinh sua thong tin nguoi dung
	@RequestMapping(value = "editProfile", method = RequestMethod.POST)
	public String editProfile(ModelMap model, HttpSession session,
			@Validated @ModelAttribute("profileBean") ProfileBean profileBean, BindingResult errors) {

		if (errors.hasErrors()) {
			model.addAttribute("message", 0);
			return "account/accountProfile";
		}

		Account account = (Account) session.getAttribute("account");

		account.setLastName(profileBean.getLastName());
		account.setFirstName(profileBean.getFirstName());
		account.setEmail(profileBean.getEmail());
		account.setPhoneNumber(profileBean.getPhoneNumber());

		if (profileBean.getAvatar().isEmpty()) {
		} else {
			File file = new File(rootFile.getPath() + account.getAvatar());
			if (file.exists())
				file.delete();

			String avatarPath = accountDir.getPath() + profileBean.getAvatar();
			account.setAvatar(profileBean.getAvatar().getOriginalFilename());

			try {
				profileBean.getAvatar().transferTo(new File(avatarPath));
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", 2);
				model.addAttribute("profileBean", profileBean);
				return "account/accountProfile";
			}
		}
		boolean updated = accountDAO.updateAccount(account);
		if (updated) {
			model.addAttribute("message", 1);
		} else {
			model.addAttribute("message", 0);
		}

		model.addAttribute("profileBean", profileBean);
		return "account/accountProfile";

	}

	// Hien thi tab cac dia chi nguoi dung
	@RequestMapping(value = "address")
	public String address(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		if (account == null) {
			return "redirect:/account/index.htm";
		}
		List<Address> adresses = addressDAO.getAddressesByAccountId(account.getAccountId());
		// Chuyen default address len dau
		int index = -1;
		for (int i = 0; i < adresses.size(); i++) {
			if (adresses.get(i).getAddressId() == account.getDefaultAddress().getAddressId()) {
				index = i;
			}
		}
		if (index != -1) {
			Collections.swap(adresses, index, 0);
		}
		modelMap.addAttribute("adresses", adresses);
		return "account/addressProfile";
	}

	// Bam nut edit dia chi
	@RequestMapping(value = "addressUpdate")
	public String addressUpdate(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "addressID") int addressID) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			return "redirect:/account/index.htm";
		}
		ArrayList<Province> province = addressDAO.getProvinceList();
		AddressBean addressBean = new AddressDatasBean().ConvertToDataAddressBean(province);

		AddressUserBean userAddress = new AddressUserBean();
		modelMap.addAttribute("userAddress", userAddress);
		modelMap.addAttribute("address", addressBean);
		Address address = addressDAO.getAddress(addressID);
		modelMap.addAttribute("addressObject", address);
		modelMap.addAttribute("addressID", addressID);
		return "account/addressUpdate";
	}

	// Bam nut submit chinh sua dia chi
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateAddress(@Validated @ModelAttribute("userAddress") AddressUserBean userAddress,
			BindingResult errors, @RequestParam(value = "addressID") int addressID, HttpSession session,
			ModelMap modelMap) {
		Account account = (Account) session.getAttribute("account");
		if (account == null) {
			return "redirect:/account/address.htm";
		}
		if (errors.hasErrors()) {
			modelMap.addAttribute("message", 0);
			return "account/addressUpdate";
		}
		Address address = null;
		account = addressDAO.fetchAddressAccount(account);
		for (Address uAddress : account.getAddresses()) {
			if (uAddress.getAddressId() == addressID) {
				address = uAddress;
				break;
			}
		}
		if (address == null) {
			modelMap.addAttribute("message", 0);
			return "account/addressUpdate";
		}

		Ward ward = addressDAO.getWard(userAddress.getWardId());
		address.setName(userAddress.getAddressLine());
		address.setWard(ward);
		boolean s = addressDAO.updateAddress(address);
		if (s)
			modelMap.addAttribute("message", 1);
		else
			modelMap.addAttribute("message", 0);

		return "account/addressUpdate";
	}

	// Tao address moi
	@RequestMapping(value = "createAddress")
	public String createAddress(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			return "redirect:/account/address";
		}
		ArrayList<Province> province = addressDAO.getProvinceList();
		AddressBean addressBean = new AddressDatasBean().ConvertToDataAddressBean(province);

		AddressUserBean userAddress = new AddressUserBean();
		modelMap.addAttribute("userAddress", userAddress);
		modelMap.addAttribute("address", addressBean);

		return "account/createAddress";
	}

	// Bam nut submit tao dia chi moi
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addAddress(ModelMap modelMap, HttpSession session,
			@Validated @ModelAttribute("userAddress") AddressUserBean userAddress, BindingResult errors) {
		Account account = (Account) session.getAttribute("account");

		ArrayList<Province> province = addressDAO.getProvinceList();
		AddressBean addressBean = new AddressDatasBean().ConvertToDataAddressBean(province);

		if (account == null) {
			return "redirect:/account/address";
		}
		if (errors.hasErrors()) {
			return "redirect:/account/address";
		}

		Ward ward = addressDAO.getWard(userAddress.getWardId());
		if (ward == null) {
			return "redirect:/account/address";
		}
		Address address = new Address(ward, account);
		address.setName(userAddress.getAddressLine());
		boolean s = addressDAO.insertAddress(account, address);
		System.out.println(s);
		if (s)
			modelMap.addAttribute("message", 1);
		else
			modelMap.addAttribute("message", 0);
		modelMap.addAttribute("userAddress", userAddress);
		modelMap.addAttribute("address", addressBean);
		return "account/createAddress";
	}

	// Bam nut xoa
	@RequestMapping(value = "delete")
	public String delete(@Validated @ModelAttribute("userAddress") AddressUserBean userAddress,
			RedirectAttributes reAttributes, BindingResult errors, @RequestParam(value = "addressID") int addressID,
			HttpSession session, ModelMap modelMap) {
		Account account = (Account) session.getAttribute("account");
		if (account == null) {
			return "redirect:/account/address.htm";
		}
		if (errors.hasErrors()) {
			reAttributes.addFlashAttribute("message", 0);
			return "redirect:/account/address.htm";
		}
		Address address = null;
		account = addressDAO.fetchAddressAccount(account);
		for (Address uAddress : account.getAddresses()) {
			if (uAddress.getAddressId() == addressID) {
				address = uAddress;
				break;
			}
		}

		if (address != null) {
			boolean s = addressDAO.deleteAddress(address);
			if (s)
				reAttributes.addFlashAttribute("message", 1);
			else
				reAttributes.addFlashAttribute("message", 0);
		}

		return "redirect:/account/address.htm";
	}

	@RequestMapping(value = "changePassword", method = RequestMethod.GET)
	public String changePassword(@ModelAttribute("password") ChangePassword password) {
		return "acount/changePassword";
	}

	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public String savePassword(ModelMap model, @ModelAttribute("password") ChangePassword password,
			BindingResult errors, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		if (!BCrypt.checkpw(password.getOldPass(), account.getPassword())) {
			errors.rejectValue("oldPass", "password", "Mật khẩu hiện tại không đúng!");
		}
		if (BCrypt.checkpw(password.getNewPass(), account.getPassword()))

		{
			errors.rejectValue("newPass", "password", "Mật khẩu mới trùng với mật khẩu cũ!");
		}
		if (!password.getConfirmPass().equalsIgnoreCase(password.getNewPass())) {
			errors.rejectValue("confirmPass", "password", "Mật khẩu xác nhận không đúng!");
		}

		if (errors.hasErrors())
			return "account/changePassword";
		else {
			account.setPassword(BCrypt.hashpw(password.getNewPass(), BCrypt.gensalt(12)));
			boolean s = accountDAO.updateAccount(account);
			if (s) {
				session.setAttribute("account", account);
				model.addAttribute("message", 1);
			} else

				model.addAttribute("message", 0);
		}

		return "account/changePassword";
	}

}