package com.woo.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	

	@RequestMapping(value = "memberList")
	public String memberList(Model model, @ModelAttribute("vo")MemberVo vo) throws Exception {

		
		List<Member> list = service.selectList();
		model.addAttribute("list", list);
		
		
//		vo.setShDate(vo.getShDate() == null ? 0 : vo.getShDate());
//		vo.setShOption(vo.getShOption() == null ? 2 : vo.getShOption());
//		vo.setShStartDate(vo.getShStartDate() == null || vo.getShStartDate() == "" ? null : vo.getShStartDate());
//		vo.setShEndDate(vo.getShEndDate() == null || vo.getShEndDate() == "" ? null : vo.getShEndDate());
		
		return "infra/member/xdmin/memberList";
	}
	
	
	@RequestMapping(value = "memberSearch") 
	public String memberSearch(Model model, MemberVo vo) throws Exception {
	  
		System.out.println("vo.getShValue(): " + vo.getShValue());
		System.out.println("vo.getShOption(): " + vo.getShOption());
		 
		List<Member> list = service.search(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		  
		return "infra/member/xdmin/memberList"; 
	}
	
	@RequestMapping(value = "memberForm")
	public String memberForm(Model model, MemberVo vo) throws Exception {
		
		Member selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		
		return "infra/member/xdmin/memberForm";
	}
	
	@RequestMapping(value="memberUpdt")
	public String memberUpdate(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo",vo);
		return "redirect:/member/memberList";
	}
	

	
	  
	
	 
	
	
	
	
}
