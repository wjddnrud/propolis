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
	
	@RequestMapping(value = "communityForm")
	public String communityForm() throws Exception {

		return "infra/SportsMate/communityForm";
	}
	
	@RequestMapping(value = "communityNotify")
	public String communityNotify() throws Exception {

		return "infra/SportsMate/communityNotify";
	}
	
	@RequestMapping(value = "communityView")
	public String communityView() throws Exception {

		return "infra/SportsMate/communityView";
	}
	
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
