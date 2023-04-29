package tad.controller;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tad.DAO.ICategoryDAO;
import tad.bean.CategoryBean;
import tad.bean.UploadFile;
import tad.entity.Category;
import tad.utility.ConverterUploadHandler;

@Controller
@RequestMapping("/admin/category")
public class AdminControllerCategory {
	@Autowired
	private SessionFactory factory;

	

	@Autowired
	private ICategoryDAO categoryDAO;

	@RequestMapping()
	public String gCategoryList(ModelMap model) throws InterruptedException {
		Thread.sleep(300);
		ArrayList<CategoryBean> categories = CategoryBean.ConvertListCategory(categoryDAO.GetListCategories());
		model.addAttribute("list", categories);

		return "admin/admin-category";
	}

	@RequestMapping("add")
	public String gCategoryAdd(ModelMap modelMap) {
		Category category = new Category();
		CategoryBean categoryBean = new CategoryBean(category.getCategoryId(), category.getName(), category.getImage());
		modelMap.addAttribute("addBean", categoryBean);
		return "admin/admin-category-form";
	}

	@RequestMapping("update{id}")
	public String gCategoryUpdate(@PathVariable("id") int id, ModelMap modelMap) {
		Category category = categoryDAO.GetCategory(id);
		CategoryBean categoryBean = new CategoryBean(category);
		modelMap.addAttribute("updateBean", categoryBean);
		return "admin/admin-category-form";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String pCategoryAdd(@ModelAttribute("addBean") CategoryBean categoryBean) {
		if (categoryBean != null) {
			Category category = new Category();

			category.setName(categoryBean.getName());
			if (categoryBean.getFileImage() != null) {
				if (converter.MoveMultipartToDirectory(categoryBean.getFileImage(), uploadCategory.getPath())) {
					category.setImage(converter.SetImageNameViaMultipartFile(categoryBean.getFileImage()));
				}
			}
			categoryDAO.AddCategory(category);
		}

		return "redirect:/admin/category.htm";
	}

	@Autowired
	@Qualifier("categoryImgDir")
	private UploadFile uploadCategory;

	@Autowired
	private ConverterUploadHandler converter;

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String pCategoryUpdate(@ModelAttribute("updateBean") CategoryBean categoryBean) {
		Category category = categoryDAO.GetCategory(categoryBean.getId());
		if (category != null) {
			category.setName(categoryBean.getName());

			if (categoryBean.getFileImage() != null) {
				if (converter.MoveMultipartToDirectory(categoryBean.getFileImage(), uploadCategory.getPath())) {
					category.setImage(converter.SetImageNameViaMultipartFile(categoryBean.getFileImage()));
				}
			}
			categoryDAO.UpdateCategory(category);

		} else {
			System.out.println(String.format("Error in getting id: %d", categoryBean.getId()));
		}

		return "redirect:/admin/category.htm";
	}

	@RequestMapping(value = "delete{id}", method = RequestMethod.GET)
	public String pCategoryDelete(@PathVariable int id, ModelMap model) {
		Category category = categoryDAO.GetCategory(id);
		if (category != null) {
			if (category.getProducts().size() > 0) {
				model.addAttribute("error-description", "");
				return "redirect:/admin/category.htm";
			} else {
				if (categoryDAO.DeleteCategory(category)) {
					model.addAttribute("success-description", "XÃ³a thÃ nh cÃ´ng");
				} else {
					model.addAttribute("error-description", "Ä�Ã£ cÃ³ lá»—i trong viá»‡c xÃ³a!");
				}
			}
		}
		
		return "redirect:/admin/category.htm";
	}
}

/*
 * @Autowired private IAddressDAO addressDAO;
 * 
 * 
 * @RequestMapping(value = "register", method = RequestMethod.GET) public String
 * userRegisterGET(ModelMap model) {
 * 
 * ArrayList<Province> provinceDatas = addressDAO.GetProvinceList();
 * AddressDatasBean addrDataBean = new AddressDatasBean(); AddressBean address =
 * addrDataBean.ConvertToDataAddressBean(provinceDatas);
 * model.addAttribute("address", address); return "user/userRegister"; }
 */