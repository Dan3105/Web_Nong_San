package tad.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tad.DAO.IAccountDAO;
import tad.DAO.IAddressDAO;
import tad.bean.AddressBean;
import tad.bean.AddressDatasBean;
import tad.bean.AddressUserBean;
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

	@RequestMapping(value = "index")
	public String profile(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			return "index.htm";
		}

		ProfileBean profileBean = new ProfileBean();
		profileBean.setLastName(account.getLastName());
		profileBean.setFirstName(account.getFirstName());
		profileBean.setEmail(account.getEmail());
		profileBean.setPhoneNumber(account.getPhoneNumber());

		modelMap.addAttribute("profileBean", profileBean);
		return "account/accountProfile";
	}

	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String editProfile(ModelMap model, RedirectAttributes reAttributes, HttpSession session,
			@Validated @ModelAttribute("profileBean") ProfileBean profileBean, BindingResult errors) {

		if (errors.hasErrors()) {
			model.addAttribute("message", 0);
			model.addAttribute("profileBean", profileBean);
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

	@RequestMapping(value = "address")
	public String address(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		if (account == null) {
			return "index.htm";
		}

		List<Address> adresses = addressDAO.getAddressesByAccountId(account.getAccountId());
		System.out.println(adresses.size());

		modelMap.addAttribute("adresses", adresses);
		return "account/addressProfile";
	}

	@RequestMapping(value = "addressDetail")
	public String addressDetail(ModelMap modelMap, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			return "index.htm";
		}
		ArrayList<Province> province = addressDAO.getProvinceList();
		AddressBean addressBean = new AddressDatasBean().ConvertToDataAddressBean(province);

		AddressUserBean userAddress = new AddressUserBean();
		modelMap.addAttribute("userAddress", userAddress);
		modelMap.addAttribute("addresses", account.getAddresses());
		modelMap.addAttribute("address", addressBean);
		return "account/addressDetail";
	}

	@RequestMapping(value = "add")
	public String addAddress(ModelMap modelMap, HttpSession session,
			@Validated @ModelAttribute("userAddress") AddressUserBean userAddress, BindingResult errors) {
		Account account = (Account) session.getAttribute("account");

		if (account == null) {
			modelMap.addAttribute("message", false);
			return "index.htm";
		}
		if (errors.hasErrors()) {
			modelMap.addAttribute("message", false);
			return "redirect:/account/addressDetail.htm";
		}
		Ward ward = addressDAO.getWard(userAddress.getWardId());
		if (ward == null) {
			modelMap.addAttribute("message", false);
			return "redirect:/account/addressDetail.htm";
		}
		Address address = new Address(ward, account);
		address.setName(userAddress.getAddressLine());
		boolean s = addressDAO.insertAddress(account, address);
		modelMap.addAttribute("message", s);
		modelMap.addAttribute("userAddress", userAddress);
		return "redirect:/account/addressDetail.htm";
	}

}