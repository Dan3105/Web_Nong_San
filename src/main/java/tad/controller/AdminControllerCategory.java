package tad.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tad.DAO.ICategoryDAO;
import tad.bean.CategoryBean;
import tad.bean.UploadFile;
import tad.entity.Category;
import tad.utility.Constants;
import tad.utility.ConverterUploadHandler;

@Controller
@RequestMapping("/admin/category")
public class AdminControllerCategory {
	@Autowired
	private SessionFactory factory;

	@Autowired
	private ICategoryDAO categoryDAO;

	@RequestMapping()
	public String gCategoryList(ModelMap model,
			@RequestParam(value = "crrPage", required = false, defaultValue = "1") int crrPage) {

		List<Category> categories = categoryDAO.getListCategories();
		int startIndex = Math.max((crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME, 0);
		if (startIndex >= categories.size()) {
			crrPage = crrPage - 1; // lui lai trang truoc do
			startIndex = Math.max((crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME, 0);
		}
		model.addAttribute("crrPage", crrPage);

		int totalPage = categories.size() / Constants.PRODUCT_PER_PAGE_IN_HOME;
		if (categories.size() % Constants.PRODUCT_PER_PAGE_IN_HOME != 0) {
			totalPage += 1;
		}
		model.addAttribute("totalPage", totalPage);

		ArrayList<CategoryBean> categoriesBean = CategoryBean.ConvertListCategory(categories.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_HOME, categories.size())));
		model.addAttribute("list", categoriesBean);
		return "admin/admin-category";
	}

	@RequestMapping("searchCategory")
	public String gCategoryWithSearch(@RequestParam(required = false, value = "search") String search,
			@RequestParam(required = false, value = "crrPage", defaultValue = "1") int crrPage, ModelMap model) {
		List<Category> categories = categoryDAO.searchCategory(search);
		int startIndex = Math.max((crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME, 0);
		if (startIndex >= categories.size()) {
			crrPage = crrPage - 1; // lui lai trang truoc do
			startIndex = Math.max((crrPage - 1) * Constants.PRODUCT_PER_PAGE_IN_HOME, 0);
		}
		model.addAttribute("crrPage", crrPage);

		int totalPage = categories.size() / Constants.PRODUCT_PER_PAGE_IN_HOME;
		if (categories.size() % Constants.PRODUCT_PER_PAGE_IN_HOME != 0) {
			totalPage += 1;
		}

		model.addAttribute("totalPage", totalPage);
		ArrayList<CategoryBean> categoriesBean = CategoryBean.ConvertListCategory(categories.subList(startIndex,
				Math.min(startIndex + Constants.PRODUCT_PER_PAGE_IN_HOME, categories.size())));
		model.addAttribute("list", categoriesBean);
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
		Category category = categoryDAO.getCategory(id);
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
			categoryDAO.addCategory(category);
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
		Category category = categoryDAO.getCategory(categoryBean.getId());
		if (category != null) {
			category.setName(categoryBean.getName());

			if (categoryBean.getFileImage() != null) {
				if (converter.MoveMultipartToDirectory(categoryBean.getFileImage(), uploadCategory.getPath())) {
					category.setImage(converter.SetImageNameViaMultipartFile(categoryBean.getFileImage()));
				}
			}
			categoryDAO.updateCategory(category);

		} else {
			System.out.println(String.format("Error in getting id: %d", categoryBean.getId()));
		}

		return "redirect:/admin/category.htm";
	}

	@RequestMapping(value = "delete{id}", method = RequestMethod.GET)
	public String pCategoryDelete(@PathVariable int id, ModelMap model) {
		Category category = categoryDAO.getCategory(id);
		if (category != null) {
			if (category.getProducts().size() > 0) {
				model.addAttribute("error-description", "");
				return "redirect:/admin/category.htm";
			} else {
				if (categoryDAO.deleteCategory(category)) {
					model.addAttribute("success-description", "Xóa thành công");
				} else {
					model.addAttribute("error-description", "Xóa thất bại!");
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