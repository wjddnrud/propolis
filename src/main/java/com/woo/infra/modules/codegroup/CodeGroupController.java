package com.woo.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/codegroup/")
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	

	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, CodeGroupVo vo) throws Exception {

//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		vo.setParamsPaging(service.selectOneCount(vo));		
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupSearch")
	public String codeGroupSearch(Model model, CodeGroupVo vo) throws Exception {
		
//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
		
		List<CodeGroup> list = service.search(vo);
		model.addAttribute("list", list);
		
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(CodeGroupVo vo, Model model) throws Exception {
		
		if(vo.getSeq() == null)
			vo.setSeq(0);
		 
		System.out.println("-------------"+vo.getSeq());
		
		CodeGroup result = service.selectOne(vo);
		model.addAttribute("item", result);
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		int result = service.insert(dto);
		System.out.println("controller result : " + result);
		
		/* vo.setSeq(dto.getSeq()); */
		
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
