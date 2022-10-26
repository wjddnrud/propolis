package com.woo.infra.modules.code;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




@Controller
@RequestMapping(value = "/code/")
public class CodeController {

	@Autowired
	CodeServiceImpl service;
	

	public void setParamsPaging(CodeVo vo) throws Exception {
			
	//		페이징
			vo.setParamsPaging(service.selectOneCount(vo));
			
			System.out.println("controller vo.getRowNumToShow : " + vo.getRowNumToShow());
			System.out.println("controller vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());
			
		}
	
	
	@RequestMapping(value = "codeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo, Code dto) throws Exception {
		

		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
		setParamsPaging(vo);
		
		List<Code> list = service.selectList(vo);
		
		model.addAttribute("list", list);		
		
//		List<Code> ccgList = service.ccg_name(dto);
		
//		model.addAttribute("ccgList", ccgList);
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value = "codeSearch")
	public String codeSearch(Model model, @ModelAttribute("vo") CodeVo uza) throws Exception {
		
		uza.setStartRnumForMysql((uza.getThisPage()-1) * uza.getRowNumToShow());
		setParamsPaging(uza);
		
		List<Code> search = service.search(uza);
		model.addAttribute("list", search);
		
		return "infra/code/xdmin/codeList";
		
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInsert(Model model, Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		int insert = service.insert(dto);
		model.addAttribute("insert", insert);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		
		
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model, CodeVo vo, Code dto) throws Exception {
		
		Code selectOne = service.selectOne(vo);
		
		model.addAttribute("one", selectOne);
		
		List<Code> ccg_name = service.ccg_name(dto);
		model.addAttribute("add", ccg_name);
		System.out.println("add controller : " + ccg_name);
		
//		System.out.println("one.seq : " + selectOne.getSeq());
		
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value="codeUpdt")
	public String codeUpdt(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/code/codeList";
		
	}
	
}
