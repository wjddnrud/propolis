package com.woo.infra.modules;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "myPage") 
	public String myPage() throws Exception {
		return "infra/SportsMate/myPage/myPage";
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
	
	@RequestMapping(value = "signIn") // signIn
	public String signIn() throws Exception {
		
		return "infra/SportsMate/signIn";
	}
	
	@ResponseBody
	@RequestMapping(value = "signInCheck")
	public Map<String, Object> signInCheck(Member dto, HttpSession httpSession) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		
		Member signInCheck = service.signInCheck(dto);
		System.out.println("signIn result: " + signInCheck);
		
		
		
		if (signInCheck != null) {
			returnMap.put("rt", "success");
			
//			System.out.println("returnMap name : " + signInCheck.getName());  
			
//			계정 정보를 가져왔을때 실행시킬 구문들
			
			httpSession.setMaxInactiveInterval(60 * 30); // 60second * 30 = 30minute  세션유지 시간
			httpSession.setAttribute("sessSeq", signInCheck.getSeq());
			httpSession.setAttribute("sessId", signInCheck.getId());
			httpSession.setAttribute("sessPassword", signInCheck.getPassword());
			httpSession.setAttribute("sessName", signInCheck.getName());
			httpSession.setAttribute("sessAdminNY", signInCheck.getAdminNY());
			
			String adminNY = signInCheck.getAdminNY();
			System.out.println("adminNY : " + signInCheck.getAdminNY());
			
			returnMap.put("adminNY", signInCheck.getAdminNY());
			returnMap.put("name", signInCheck.getName());
			
		} else {
			returnMap.put("rt", "fail");
					
		}

		return returnMap; 
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession httpSession) throws Exception {
		
		httpSession.invalidate();
		
		return "infra/SportsMate/signIn";
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
		
		 return "redirect:/signIn"; 
	}
	
	
	
	
	
}
