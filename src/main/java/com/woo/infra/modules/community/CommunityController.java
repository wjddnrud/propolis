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
	
	@RequestMapping(value = "communityInst")
	public String communityInsert(Model model, Community dto) throws Exception {
		
		System.out.println("dto.getMultipartFile : " + dto.getMultipartFile().length);
		
		service.insert(dto);

		return "redirect:/community/communityList";
	}
	
	@RequestMapping(value = "communityForm")
	public String communityForm(Model model, Community dto, CommunityVo vo) throws Exception {
		
		Community selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		System.out.println("controller selectOne : " + selectOne);
		
		return "infra/SportsMate/communityForm";
	}
	
	@RequestMapping(value = "communityView")
	public String communityView(Model model, Community dto, CommunityVo vo) throws Exception {
		
		System.out.println("service : " + vo.getShSeq());
		
		Community selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		System.out.println("controller selectOne : " + selectOne);
		
		dto.setpSeq(vo.getShSeq()); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */
		Community img = service.selectCommunityImg(dto);
		model.addAttribute("img",img);
		
		return "infra/SportsMate/communityView";
	}
	
	
//	마이페이지에서 게시물 리스트 먼저 만들고 그 페이지에서 seq 눌러서 수정할수 있도록 만들기
	
//	@RequestMapping(value = "communityUpdt")
//	public String communityUpdt(CommunityVo vo, Community dto, RedirectAttributes redirectAttributes) throws Exception {
//			
//		service.update(dto);
//		
//		redirectAttributes.addFlashAttribute("vo", vo);
//		
//		return "redirect:/community/communityList";
//	}
	
	
	
//	@RequestMapping(value = "imgLoad")
//	public String imgLoad(Model model, Community dto) throws Exception {
//		
//		
//		
//		return "/infra/SportsMate/communityView";
//	}
	 
}


