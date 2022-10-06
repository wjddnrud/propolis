package com.woo.infra.modules.sportsGroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sportsGroup/")

public class SportsGroupController {

	
	@Autowired
	SportsGroupServiceImpl service;
	
	@RequestMapping(value = "sportsGroupList")
	public String sportsGroupList(Model model) throws Exception { 
		
		List<SportsGroup> list = service.selectList();
		model.addAttribute("list",list);
		
		System.out.println("controller list : " + list);
		
		return "infra/SportsMate/findMate";
	}
	
	@RequestMapping(value = "sportsGroupView")
	public String sportsGroupView(Model model, SportsGroupVo vo) throws Exception {
		
		SportsGroup selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		
		return "infra/SportsMate/findMateView";
	}
}
