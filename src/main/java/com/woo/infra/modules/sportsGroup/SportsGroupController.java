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
		
		System.out.println("service : " + vo.getShSeq());
		
		SportsGroup selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		
		return "infra/SportsMate/findMateView";
	}
	
	@RequestMapping(value = "sportsGroupInst")
	public String sportsGroupInst(SportsGroup dto) throws Exception {
		
		System.out.println("controller insert");
		int insert = service.insert(dto);
		
		return "redirect:/SportsMate/findMate";
	}
	
	@RequestMapping(value = "sportsGroupForm")
	public String sportsGroupForm(Model model, SportsGroup dto) throws Exception {
		
		List<SportsGroup> list = service.selectList();
		model.addAttribute("list",list);
		
		int sports = service.sports(dto);
		model.addAttribute("sports",sports);
		
		
		return "infra/SportsMate/findMateForm";
	}
}
