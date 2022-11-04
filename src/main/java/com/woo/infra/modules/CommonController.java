package com.woo.infra.modules;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@RequestMapping(value = "main")
	public String main(Model model) throws Exception {
		
		
		int dietCount = cmService.selectCountFromCategory(1);
		model.addAttribute("dietCount", dietCount);
		
		int weightCount = cmService.selectCountFromCategory(2);
		model.addAttribute("weightCount", weightCount);
		
		int foodCount = cmService.selectCountFromCategory(3);
		model.addAttribute("foodCount", foodCount);
		
		
		/*
		 * String nowString = UtilDateTime.nowString(); String today =
		 * nowString.substring(0,4) + "-" + nowString.substring(5,7) + "-" +
		 * nowString.substring(8,10);
		 * 
		 * System.out.println("today : " + today);
		 * 
		 * Community community = new Community(); community.setCreateDate(today);
		 * community.setCategory("1");
		 * 
		 * int dietCountNew = cmService.selectCountNewFromCategory(community);
		 * 
		 * community.setCategory("2");
		 * 
		 * int weightCountNew = cmService.selectCountNewFromCategory(community);
		 * 
		 * community.setCategory("3");
		 * 
		 * int foodCountNew = cmService.selectCountNewFromCategory(community);
		 * 
		 * model.addAttribute("dietCountNew", dietCountNew);
		 * model.addAttribute("weightCountNew", weightCountNew);
		 * model.addAttribute("foodCountNew", foodCountNew);
		 */
		
		return "infra/SportsMate/main";
	}
	
	@RequestMapping(value = "myPageCommunityList") 
	public String myPageCommunityList(Model model, Member mmdto, MemberVo vo, Community cmdto,  HttpSession httpSession) throws Exception {
		

		int sessSeq = (int) httpSession.getAttribute("sessSeq");
//		System.out.println("getAttribute: " + sessSeq);
		
		mmdto.setSeq(sessSeq); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */
//		System.out.println("getSeq : " + mmdto.getSeq());
		Member img = mmService.selectMemberImg(mmdto);
		model.addAttribute("img",img);
		
		cmdto.setWriter("" + sessSeq);
		List<Community> cmlist = cmService.MyselectList(cmdto);
		model.addAttribute("cmlist", cmlist);
		
		cmdto.setCreator("" + sessSeq);
//		System.out.println("getCreator : " + cmdto.getCreator());
//		dto.setSeq(sessSeq);
		List<SportsGroup> grlist = sgService.MyselectList(cmdto);
		model.addAttribute("grlist", grlist);
		
		vo.setShSeq(sessSeq);
		Member selectOne = mmService.selectOne(vo);
		model.addAttribute("one", selectOne);
	
		
		return "infra/SportsMate/myPage/myPageCommunityList";
	}
	
	@RequestMapping(value = "myPageGroupList") 
	public String myPageGroupList(Model model, Member mmdto, MemberVo vo, Community cmdto, HttpSession httpSession) throws Exception {
		

		
		int sessSeq = (int) httpSession.getAttribute("sessSeq");
//		System.out.println("getAttribute: " + sessSeq);
		
		mmdto.setSeq(sessSeq); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */
//		System.out.println("getSeq : " + mmdto.getSeq());
		Member img = mmService.selectMemberImg(mmdto);
		model.addAttribute("img",img);
		
		cmdto.setCreator("" + sessSeq);
//		System.out.println("getCreator : " + cmdto.getCreator());
//		dto.setSeq(sessSeq);
		List<SportsGroup> grlist = sgService.MyselectList(cmdto);
		model.addAttribute("grlist", grlist);
		
		cmdto.setWriter("" + sessSeq);
		List<Community> cmlist = cmService.MyselectList(cmdto);
		model.addAttribute("cmlist", cmlist);
		
		return "infra/SportsMate/myPage/myPageGroupList";
	}
	
	@RequestMapping(value = "myPageMessegeList") 
	public String myPageMessegeList(Model model, Member dto, MemberVo vo, Community cmdto, HttpSession httpSession) throws Exception {
		

		
		int sessSeq = (int) httpSession.getAttribute("sessSeq");
//		System.out.println("getAttribute: " + sessSeq);
		
		dto.setpSeq(sessSeq); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */
//		System.out.println("setPseq : " + dto.getpSeq());
		Member img = mmService.selectMemberImg(dto);
		model.addAttribute("img",img);
		
		cmdto.setCreator("" + sessSeq);
//		System.out.println("getCreator : " + cmdto.getCreator());
//		dto.setSeq(sessSeq);
		List<SportsGroup> grlist = sgService.MyselectList(cmdto);
		model.addAttribute("grlist", grlist);
		
		cmdto.setWriter("" + sessSeq);
		List<Community> cmlist = cmService.MyselectList(cmdto);
		model.addAttribute("cmlist", cmlist);
		
		return "infra/SportsMate/myPage/myPageMessegeList";
	}
	
//	@RequestMapping(value = "community")
//	public String community() throws Exception {
//		
//		return "infra/SportsMate/community";
//	}
	
	@RequestMapping(value = "communityForm")
	public String communityForm() throws Exception {

		return "infra/SportsMate/communityForm";
	}
	
	@RequestMapping(value = "communityNotify")
	public String communityNotify() throws Exception {

		return "infra/SportsMate/communityNotify";
	}
	
//	@RequestMapping(value = "communityView")
//	public String communityView() throws Exception {
//
//		return "infra/SportsMate/communityView";
//	}
	
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
		
		return "infra/SportsMate/signIn";
	}

	@RequestMapping(value = "signUp")
	public String signUp() throws Exception {
		
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
	
	@RequestMapping(value = "/")
	public String classify() throws Exception {
		
		return "infra/SportsMate/index";
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
		System.out.println("kakaologin : " + dto.getSeq());
		System.out.println("kakaologin : " + dto.getId());
		System.out.println("kakaologin : " + dto.getName());
		System.out.println("kakaologin : " + dto.getEmail());
	     httpSession.setAttribute("sessSeq", dto.getSeq());    
	     httpSession.setAttribute("sessId", dto.getId());
	     httpSession.setAttribute("sessName", dto.getName());
	     httpSession.setAttribute("sessEmail", dto.getEmail());
	 }
	
}
