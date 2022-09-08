package com.woo.infra.modules;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class CommonController {

	

	//----------------------------- 페이지 이동
	
	
	@RequestMapping(value = "main")
	public String main() throws Exception {

		return "infra/SportsMate/main";
	}
	
	@RequestMapping(value = "community")
	public String community() throws Exception {

		return "infra/SportsMate/community";
	}
	
	@RequestMapping(value = "findMate")
	public String findMate() throws Exception {

		return "infra/SportsMate/findMate";
	}
	
	@RequestMapping(value = "")
	public String signIn() throws Exception {

		return "infra/SportsMate/signIn";
	}

	@RequestMapping(value = "signIn")
	public String signIn1() throws Exception {

		return "infra/SportsMate/signIn";
	}
	
	@RequestMapping(value = "signUp")
	public String signUp() throws Exception {

		return "infra/SportsMate/signUp";
	}
	
	
}
