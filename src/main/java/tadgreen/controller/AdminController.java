package tadgreen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/amdin/")
public class AdminController {
	@RequestMapping("")
	public String index()
	{
		System.out.println("ádfasf");
		return "admin/adminLogin";
	}
}
