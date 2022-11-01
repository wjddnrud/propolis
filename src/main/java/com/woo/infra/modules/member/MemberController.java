package com.woo.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;



@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;

	public void setParamsPaging(MemberVo vo) throws Exception {

		vo.setParamsPaging(service.selectOneCount(vo));
		System.out.println("controller vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("controller vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());

	}

	@RequestMapping(value = "memberList")
	public String memberList(Model model, @ModelAttribute("vo") MemberVo vo, Member dto) throws Exception {

		vo.setStartRnumForMysql((vo.getThisPage() - 1) * vo.getRowNumToShow());
		setParamsPaging(vo);

		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);

//		vo.setShDate(vo.getShDate() == null ? 0 : vo.getShDate());
//		vo.setShOption(vo.getShOption() == null ? 2 : vo.getShOption());
//		vo.setShStartDate(vo.getShStartDate() == null || vo.getShStartDate() == "" ? null : vo.getShStartDate());
//		vo.setShEndDate(vo.getShEndDate() == null || vo.getShEndDate() == "" ? null : vo.getShEndDate());

		return "infra/member/xdmin/memberList";
	}

	@RequestMapping(value = "memberSearch")
	public String memberSearch(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {

//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
		
		vo.setStartRnumForMysql((vo.getThisPage() - 1) * vo.getRowNumToShow());
		setParamsPaging(vo);

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

	/*
	 * @RequestMapping(value = "signUp") public String memberInsert(MemberVo vo,
	 * Member dto, RedirectAttributes redirectAttributes) throws Exception {
	 * 
	 * int insert = service.insert(dto);
	 * 
	 * redirectAttributes.addFlashAttribute("vo", vo);
	 * 
	 * return "redirect:/signIn"; }
	 */

	@RequestMapping(value = "memberUpdt")
	public String memberUpdate(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.update(dto);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberList";
	}

	@RequestMapping(value = "memberDele")
	public String memberDelete(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.delete(vo);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberList";

	}

	@ResponseBody
	@RequestMapping(value = "checkId")
	public Map<String, Object> checkId(Member dto) throws Exception {

		System.out.println("controller checkId");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.checkId(dto);

		System.out.println("result : " + result);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	
	//휴대폰 인중
	@ResponseBody
	@RequestMapping(value = "checkPhone")
	public Map<String, Object> checkPhone(Member dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		//5자리 난수 생성
		int rndNumber = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println(rndNumber);
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSEDETMOWCHUM51", "CNPNRQMYA2UNXA5B3MK5ILIZZ4A463P6", "https://api.solapi.com");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01084547909");
		message.setTo(dto.getPhoneNumber());
		message.setText("인증번호 : " + rndNumber);

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		result.put("code", rndNumber);
		
		//
		
		return result;
	}

}
