package com.woo.infra.modules;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woo.infra.modules.community.Community;
import com.woo.infra.modules.community.CommunityServiceImpl;
import com.woo.infra.modules.member.Member;
import com.woo.infra.modules.member.MemberServiceImpl;
import com.woo.infra.modules.member.MemberVo;
import com.woo.infra.modules.sportsGroup.SportsGroup;
import com.woo.infra.modules.sportsGroup.SportsGroupServiceImpl;

@Controller
public class CommonController {

	
	@Autowired
	MemberServiceImpl mmService;
	
	@Autowired
	CommunityServiceImpl cmService;
	
	@Autowired
	SportsGroupServiceImpl sgService;
	
	
	//----------------------------- 페이지 이동
	
	@RequestMapping(value = "/")
	public String classify() throws Exception {
		
		return "infra/SportsMate/index";
	}
	
	@RequestMapping(value = "main")
	public String main(Model model) throws Exception {
		
		int dietCount = cmService.selectCountFromCategory(1);
		model.addAttribute("dietCount", dietCount);
		
		int weightCount = cmService.selectCountFromCategory(2);
		model.addAttribute("weightCount", weightCount);
		
		int foodCount = cmService.selectCountFromCategory(3);
		model.addAttribute("foodCount", foodCount);
		
		
		return "infra/SportsMate/main";
	}
	
	@RequestMapping(value="myPage")
	public String myPage(Model model, Member mmdto, MemberVo vo, Community cmdto,  HttpSession httpSession) throws Exception {
		
		int sessSeq = (int) httpSession.getAttribute("sessSeq");
		
		if(mmdto.getSeq() == null) {			
			mmdto.setSeq(sessSeq); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */						
		}
			
		Member img = mmService.selectMemberImg(mmdto);
		model.addAttribute("img",img);
		
		cmdto.setWriter("" + mmdto.getSeq());
		List<Community> cmlist = cmService.MyselectList(cmdto);
		model.addAttribute("cmlist", cmlist);
			
		cmdto.setCreator("" + mmdto.getSeq());
		List<SportsGroup> grlist = sgService.MyselectList(cmdto);
		model.addAttribute("grlist", grlist); 
		
		vo.setShSeq(mmdto.getSeq());
		Member selectOne = mmService.selectOne(vo);
		model.addAttribute("one", selectOne);
		
		return "infra/SportsMate/myPage/myPageCommunityList";
	}
	
	@RequestMapping(value="myCmList")
	public String myCmList()throws Exception {
		
		return "infra/SportsMate/main";
	}
	
	@RequestMapping(value="mySgList")
	public String mySgList()throws Exception {
		
		return "infra/SportsMate/main";
	}
	
	
//	@RequestMapping(value = "/myPageGroupList") 
//	public String myPageGroupList(Model model, Member mmdto, Community cmdto, HttpSession httpSession) throws Exception {
//		
//		int sessSeq = (int) httpSession.getAttribute("sessSeq");
////		System.out.println("getAttribute: " + sessSeq);
//		
//		if(mmdto.getSeq() == null) {			
//			mmdto.setSeq(sessSeq); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */						
//		}
//		
//		Member img = mmService.selectMemberImg(mmdto);
//		model.addAttribute("img",img);
//		
//		cmdto.setCreator("" + mmdto.getSeq());
//		List<SportsGroup> grlist = sgService.MyselectList(cmdto);
//		model.addAttribute("grlist", grlist);
//		
//		cmdto.setWriter("" + mmdto.getSeq());
//		List<Community> cmlist = cmService.MyselectList(cmdto);
//		model.addAttribute("cmlist", cmlist);
//		
//		MemberVo vo = new  MemberVo(); 
//		vo.setShSeq(mmdto.getSeq());
//		Member selectOne = mmService.selectOne(vo);
//		model.addAttribute("one", selectOne);
//		return "infra/SportsMate/myPage/myPageGroupList";
//	}
	
	@RequestMapping(value = "signIn") // signIn
	public String signIn(@ModelAttribute("loginCheck")Member dto) throws Exception {
		 
		return "infra/SportsMate/signIn";
	}
	
	@ResponseBody
	@RequestMapping(value = "signInCheck")
	public Map<String, Object> signInCheck(Member dto, HttpSession httpSession) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member signInCheck = mmService.signInCheck(dto);
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
			
//			String writer = signInCheck.getId();
			
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
		
		return "infra/SportsMate/index";
	}

	@RequestMapping(value = "signUp")
	public String signUp(Model model, MemberVo vo) throws Exception {
		
		Member selectOne = mmService.selectOne(vo);
		model.addAttribute("one", selectOne);
		
		return "infra/SportsMate/signUp";
	}
	
	@RequestMapping(value = "signUpInst")
	public String memberInsert(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
		
		int insert = mmService.insert(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		System.out.println("mmService.insert : " + insert);
		
		 return "redirect:/signIn"; 
	}
	
	@RequestMapping("kakaoInsert")
	public String kakaoInsert() throws Exception {
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "kakaoLoginProc")
	public Map<String, Object> kakaoLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    String txt = dto.getId();
	    System.out.println(dto.getId());
	    
	    String[] split = txt.split("@");
	    System.out.println(split[0]);
	    dto.setId(split[0]);
	    
		Member kakaoLogin = mmService.kakaoSignInCheck(dto);
		
//		 System.out.println("test : " + dto.getToken());
		
		if (kakaoLogin == null) {
			
			mmService.kakaoInsert(dto);
			
//			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
//			session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
            session(dto, httpSession); 
			returnMap.put("rt", "success");
		} else {
//			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			
			// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
			session(kakaoLogin, httpSession);
			returnMap.put("rt", "success");
		}
		return returnMap;
	}

	 public void session(Member dto, HttpSession httpSession) {
		System.out.println("snslogin : " + dto.getSeq());
		System.out.println("snslogin : " + dto.getId());
		System.out.println("snslogin : " + dto.getName());
		System.out.println("snslogin : " + dto.getEmail());
	     httpSession.setAttribute("sessSeq", dto.getSeq());    
	     httpSession.setAttribute("sessId", dto.getId());
	     httpSession.setAttribute("sessName", dto.getName());
	     httpSession.setAttribute("sessEmail", dto.getEmail());
	 }
	 
 	@ResponseBody
	@RequestMapping(value = "googleLoginProc")
	public Map<String, Object> googleLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    String txt = dto.getId();
	    System.out.println(dto.getId());
	    
	    String[] split = txt.split("@");
	    System.out.println(split[0]);
	    dto.setId(split[0]);
	    
		Member kakaoLogin = mmService.kakaoSignInCheck(dto);
		
//			 System.out.println("test : " + dto.getToken());
		
		if (kakaoLogin == null) {
			
			mmService.kakaoInsert(dto);
			
//				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
//				session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
            session(dto, httpSession); 
			returnMap.put("rt", "success");
		} else {
//				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			
			// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
			session(kakaoLogin, httpSession);
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	 
 	@ResponseBody
	@RequestMapping(value = "naverLoginProc")
	public Map<String, Object> naverLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    String txt = dto.getId();
	    System.out.println(dto.getId());
	    
	    String[] split = txt.split("@");
	    System.out.println(split[0]);
	    dto.setId(split[0]);
	    
		Member naverLogin = mmService.kakaoSignInCheck(dto);
		
//		 System.out.println("test : " + dto.getToken());
		
		if (naverLogin == null) {
			
			mmService.kakaoInsert(dto);
			
//			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
//			session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
            session(dto, httpSession); 
			returnMap.put("rt", "success");
		} else {
//			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			
			// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
			session(naverLogin, httpSession);
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	 
	 
}
