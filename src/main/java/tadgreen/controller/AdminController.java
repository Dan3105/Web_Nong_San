package tadgreen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping()
	public String index()
	{
		return "admin/adminLogin";
	}
	
	@RequestMapping("user")
	public String user()
	{
		return "admin/adminUserManager";
	}
	
	@RequestMapping("category")
	public String category()
	{
		return "admin/adminCategoryManager";
	}
}
