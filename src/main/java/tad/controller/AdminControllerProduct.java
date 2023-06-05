package tad.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/product")
public class AdminControllerProduct {
	/*
	 * @Autowired private IProductDAO productDAO;
	 *
	 * @Autowired
	 *
	 * @Qualifier("rootFile") private UploadFile rootFile;
	 *
	 * @Autowired
	 *
	 * @Qualifier("productImgDir") private UploadFile productImgDir;
	 *
	 * @RequestMapping() public String getProductList(ModelMap model,
	 *
	 * @RequestParam(value = "crrPage", required = false, defaultValue = "1") int
	 * crrPage) {
	 *
	 * List<Product> product = productDAO.listProducts();
	 *
	 * int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE; int totalPage = 1;
	 * if (product.size() <= Constants.USER_PER_PAGE) totalPage = 1; else {
	 * totalPage = product.size() / Constants.USER_PER_PAGE; if (product.size() %
	 * Constants.USER_PER_PAGE != 0) { totalPage++; } }
	 *
	 * model.addAttribute("totalPage", totalPage); model.addAttribute("crrPage",
	 * crrPage);
	 *
	 * model.addAttribute("list", product.subList(startIndex, Math.min(startIndex +
	 * Constants.USER_PER_PAGE, product.size()))); return "admin/admin-category"; }
	 *
	 * @RequestMapping("searchProduct") public String
	 * gCategoryWithSearch(@RequestParam(required = false, value = "search") String
	 * search,
	 *
	 * @RequestParam(required = false, value = "crrPage", defaultValue = "1") int
	 * crrPage, ModelMap model) { List<Product> product = productDAO.listProducts();
	 * int startIndex = (crrPage - 1) * Constants.USER_PER_PAGE; int totalPage = 1;
	 * if (product.size() <= Constants.USER_PER_PAGE) totalPage = 1; else {
	 * totalPage = product.size() / Constants.USER_PER_PAGE; if (product.size() %
	 * Constants.USER_PER_PAGE != 0) { totalPage++; } }
	 *
	 * model.addAttribute("crrPage", crrPage); model.addAttribute("totalPage",
	 * totalPage); model.addAttribute("list", product.subList(startIndex,
	 * Math.min(startIndex + Constants.USER_PER_PAGE, product.size())));
	 * model.addAttribute("filter", 0); return "admin/admin-category"; }
	 *
	 * @RequestMapping("add") public String gCategoryAdd(ModelMap modelMap) {
	 * Category category = new Category(); CategoryBean categoryBean = new
	 * CategoryBean(category.getCategoryId(), category.getName(),
	 * category.getImage()); modelMap.addAttribute("addBean", categoryBean); return
	 * "admin/admin-category-form"; }
	 *
	 * @RequestMapping("update{id}") public String
	 * gCategoryUpdate(@PathVariable("id") int id, ModelMap modelMap) { Category
	 * category = categoryDAO.getCategory(id); CategoryBean categoryBean = new
	 * CategoryBean(category); modelMap.addAttribute("updateBean", categoryBean);
	 * return "redirect:admin/admin-category-form"; }
	 *
	 * @RequestMapping(value = "add", method = RequestMethod.POST) public String
	 * pCategoryAdd(@ModelAttribute("addBean") CategoryBean categoryBean, ModelMap
	 * model) { if (categoryBean != null) { Category category = new Category();
	 *
	 * category.setName(categoryBean.getName()); if
	 * (categoryBean.getFileImage().isEmpty()) {
	 *
	 * } else { File file = new File(rootFile.getPath() +
	 * categoryBean.getFileImage()); if (file.exists()) file.delete();
	 *
	 * String avatarPath = productImgDir.getPath() + categoryBean.getFileImage();
	 * category.setImage(categoryBean.getFileImage().getOriginalFilename());
	 *
	 * try { categoryBean.getFileImage().transferTo(new File(avatarPath));
	 * Thread.sleep(2000); } catch (Exception e) { e.printStackTrace();
	 * model.addAttribute("message", 1); model.addAttribute("categoryBean",
	 * categoryBean); return "admin/admin-category-form"; } }
	 * categoryDAO.addCategory(category); model.addAttribute("message", 2); }
	 *
	 * return "redirect:/admin/category.htm"; }
	 *
	 * @Autowired
	 *
	 * @Qualifier("categoryImgDir") private UploadFile uploadCategory;
	 *
	 * @RequestMapping(value = "update", method = RequestMethod.POST) public String
	 * pCategoryUpdate(@ModelAttribute("updateBean") CategoryBean categoryBean,
	 * ModelMap model) { Category category =
	 * categoryDAO.getCategory(categoryBean.getId()); if (category != null) {
	 * category.setName(categoryBean.getName());
	 *
	 * if (categoryBean.getFileImage().isEmpty()) {
	 *
	 * } else { File file = new File(rootFile.getPath() +
	 * categoryBean.getFileImage()); if (file.exists()) file.delete();
	 *
	 * String avatarPath = categoryImgDir.getPath() + categoryBean.getFileImage();
	 * category.setImage(categoryBean.getFileImage().getOriginalFilename());
	 *
	 * try { categoryBean.getFileImage().transferTo(new File(avatarPath));
	 * Thread.sleep(2000); } catch (Exception e) { e.printStackTrace();
	 * model.addAttribute("message", 1); model.addAttribute("categoryBean",
	 * categoryBean); return "admin/admin-category-form"; } }
	 * //productDAO.updateProduct(product); model.addAttribute("message", 2);
	 *
	 * }
	 *
	 * return "redirect:/admin/category.htm"; }
	 *
	 * @RequestMapping(value = "delete", method = RequestMethod.GET) public String
	 * pCategoryDelete(@RequestParam("id") int id, RedirectAttributes reAttributes)
	 * { //Category category = categoryDAO.getCategory(id); System.out.println(id);
	 * //if (categoryDAO.deleteCategory(category)) { //
	 * reAttributes.addFlashAttribute("alert", 2); //} else { //
	 * reAttributes.addFlashAttribute("alert", 1); //}
	 *
	 * return "redirect:/admin/category.htm"; }
	 */
}
