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
	

	@RequestMapping(value = "codeList")
	public String codeList(Model model) throws Exception {
		
		List<Code> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value = "codeSearch")
	public String codeSearch(Model model, @ModelAttribute("vo") CodeVo uza) throws Exception {
		
		List<Code> search = service.search(uza);
		model.addAttribute("list", search);
		
		return "infra/code/xdmin/codeList";
		
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInsert(Model model, Code dto) throws Exception {
		
		int insert = service.insert(dto);
		model.addAttribute("insert", insert);
		
		
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model, CodeVo vo) throws Exception {
		
		Code selectOne = service.selectOne(vo);
		
		model.addAttribute("one", selectOne);
		
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
