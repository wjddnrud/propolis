package com.woo.infra.modules.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/community/")

public class CommunityController {

	@Autowired
	CommunityServiceImpl service;
	

	@RequestMapping(value = "communityList")
	public String CommunityList(Model model) throws Exception {

		List<Community> list = service.selectList();
		
		model.addAttribute("list", list);
		
		return "infra/SportsMate/community";
	}
}
