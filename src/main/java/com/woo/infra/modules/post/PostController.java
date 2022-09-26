package com.woo.infra.modules.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/post/")

public class PostController {

	
	@Autowired
	PostServiceImpl service;
	
	
	@RequestMapping(value = "postList")
	public String postList(Model model, Post dto) throws Exception {
		
		List<Post> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/SportsMate/community";
	}
	

}
