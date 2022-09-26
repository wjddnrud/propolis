package com.woo.infra.modules;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woo.infra.modules.member.Member;
import com.woo.infra.modules.member.MemberServiceImpl;
import com.woo.infra.modules.member.MemberVo;

@Controller
@RequestMapping(value = "/")
public class CommonController {

	
	@Autowired
	MemberServiceImpl service;
	
	
	

	//----------------------------- 페이지 이동
	
	
	@RequestMapping(value = "main")
	public String main() throws Exception {

		return "infra/SportsMate/main";
	}
	
	@RequestMapping(value = "community")
	public String community() throws Exception {

		return "infra/SportsMate/community";
	}
	
	@RequestMapping(value = "communityForm")
	public String communityForm() throws Exception {

		return "infra/SportsMate/communityForm";
	}
	
	@RequestMapping(value = "communityNotify")
	public String communityNotify() throws Exception {

		return "infra/SportsMate/communityNotify";
	}
	
	@RequestMapping(value = "communityView")
	public String communityView() throws Exception {

		return "infra/SportsMate/communityView";
	}
	
	@RequestMapping(value = "findMate")
	public String findMate() throws Exception {

		return "infra/SportsMate/findMate";
	}
	
	@RequestMapping(value = "findMateForm")
	public String findMateForm() throws Exception {

		return "infra/SportsMate/findMateForm";
	}
	
	@RequestMapping(value = "findMateNotify")
	public String findMateNotify() throws Exception {

		return "infra/SportsMate/findMateNotify";
	}

	@RequestMapping(value = "findMateView")
	public String findMateView() throws Exception {

		return "infra/SportsMate/findMateView";
	}
	
	@RequestMapping(value = "") // signIn
	public String signIn() throws Exception {
		
		return "infra/SportsMate/signIn";
	}
	
	@ResponseBody
	@RequestMapping(value = "signIn")
	public Map<String, Object> signInCheck(Member dto) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.signIn(dto);
		
		System.out.println("signIn result: " + result);
		
		if (result > 0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
//		resultMap.put("name", dto.getId());
		
		/* 회원 정보 가져올수 있는 selectOne으로 dto가져오고 값이 들어있으면 success null이면 fail */
		return returnMap;
	}

	@RequestMapping(value = "signUp")
	public String signUp() throws Exception {

		return "infra/SportsMate/signUp";
	}
	
	@RequestMapping(value = "signUpInst")
	public String memberInsert(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		int insert = service.insert(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		System.out.println("service.insert : " + insert);
		
		/* return "infra/SportsMate/signUp"; */
		 return "redirect:/signIn"; 
		/* return "redirect:/member/memberList"; */
	}
	
	
}
