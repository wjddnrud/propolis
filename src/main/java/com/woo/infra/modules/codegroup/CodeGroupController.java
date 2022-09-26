package com.woo.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/codegroup/") //주소에 따라 작동하는 컨트롤러가 다르므로 넘겨주는 model명은 같이해줘도 상관없음!!!
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	
	public void setParamsPaging(CodeGroupVo vo) throws Exception {
		
//		검색 초기값 설정
		vo.setParamsPaging(service.selectOneCount(vo)); 
//		vo.setShDate(vo.getShDate() == null ? 0 : vo.getShDate());
//		vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
//		vo.setShStartDate(vo.getShStartDate() == null || vo.getShStartDate() == "" ? null : vo.getShStartDate());
//		vo.setShEndDate(vo.getShEndDate() == null || vo.getShEndDate() == "" ? null : vo.getShEndDate());
		
		
//		페이징
		vo.setParamsPaging(service.selectOneCount(vo));
		
	}
	
	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {

//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
//		System.out.println("vo.getStartRnumForMysql() : " + vo.getStartRnumForMysql());
//		System.out.println("vo.getThisPage() : " + vo.getThisPage());
//		System.out.println("vo.getRowNumToShow() : " + vo.getRowNumToShow());
		
		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
		
//		System.out.println("vo.getStartRnumForMysql() : " + vo.getStartRnumForMysql());
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		setParamsPaging(vo);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupSearch")
	public String codeGroupSearch(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {
		
//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
		 
		List<CodeGroup> search = service.search(vo);
		model.addAttribute("list", search);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		
		
//		 if(vo.getSeq().equals("0") || vo.getSeq().equals("")) {
//			 //insert
//		 } else {
//			 CodeGroup item = service.selectOne(vo);
//			 model.addAttribute("item", item);
//		 }
		
		CodeGroup result = service.selectOne(vo);
		model.addAttribute("one", result);
		
		List<CodeGroup> list = service.search(vo); 
		model.addAttribute("list", list);
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		int result = service.insert(dto);
		System.out.println("controller inst : " + result);
		
//		vo.setSeq(dto.getSeq());
		
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codegroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupView")
	public String codeGroupView() throws Exception {
		
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	
	
	
	@SuppressWarnings(value= {"all"})
	

	@RequestMapping(value="codeGroupUpdt")
	public String codeGroupUpdt(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);  
		
		return "redirect:/codegroup/codeGroupList";
	}

	@RequestMapping(value="codeGroupUele")
	public String codeGroupUele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codegroup/codeGroupList";
	}
	
	@RequestMapping(value="codeGroupDele")
	public String nationalityDele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codegroup/codeGroupList";
	}
	 
//	@RequestMapping(value="codeGroupMultiUele")
//	public String codeGroupMultiUele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
//		
//		for(String checkboxSeq : vo.getCheckboxSeqArray()) {
//			vo.setSeq(checkboxSeq);
//			service.uelete(dto);
//		}
//	}
	
	
}
