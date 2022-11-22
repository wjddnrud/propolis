package com.woo.infra.modules.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping (value = "/chat/")
public class ChatController {

	@Autowired
	ChatServiceImpl service;
	
	@RequestMapping(value="")
	public String chat(HttpSession httpSession, Model model) throws Exception {
		
		List<Chat> list = service.selectChatListFromOne((int)httpSession.getAttribute("sessSeq"));
		model.addAttribute("list", list);
		
		return "infra/chat/user/chat";
	}
	
	@ResponseBody
	@RequestMapping(value="insChat")
	public Map<String,Object> insChat(HttpSession httpSession,Chat dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		Chat newChat = service.createChat((int)httpSession.getAttribute("sessSeq"),dto.getCuMember());
		
		if(newChat != null) {
			result.put("rt", "success");
			result.put("newChat", newChat);
		}
		else
			result.put("rt", "fail");
		
		return result;
	}
}
