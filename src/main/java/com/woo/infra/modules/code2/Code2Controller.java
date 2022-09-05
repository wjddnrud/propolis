package com.woo.infra.modules.code2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Code2Controller {

	@Autowired
	Code2ServiceImpl service;
	

	@RequestMapping(value = "code2List")
	public String codeGroupList(Model model) throws Exception {

		List<Code2> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
}
