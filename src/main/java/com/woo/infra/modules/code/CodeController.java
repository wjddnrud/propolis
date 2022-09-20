package com.woo.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


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
	public String codeSearch(Model model, CodeVo uza) throws Exception {
		
		List<Code> search = service.search(uza);
		model.addAttribute("search", search);
		
		return "infra/code/xdmin/codeList";
		
	}
	
	
	@RequestMapping(value = "codeForm")
	public String codeForm() throws Exception {
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInsert(Code dto) throws Exception {
		
		int result = service.insert(dto);
		
		return "redirect:/code/codeList";
	}
	
	
}
