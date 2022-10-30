package com.woo.infra.modules.comment;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/comment/")
public class CommentController {

	@Autowired
	CommentServiceImpl service;
	
	@ResponseBody
	@RequestMapping(value = "commentInst")
	public Map<String, Object> commentInst(Comment dto) throws Exception {
	
		Map<String, Object> result = new HashMap<String, Object>();
		
		int insert = service.insert(dto);
		// 작성자 seq
		// member table 로 가서 seq 에 맞는 닉네임 추출 or 프로필 이미지 추출
		// 작성 내용
		
		Comment comments = service.selectOneComment(dto);
		
		
		result.put("contents", dto.getContents());
		result.put("writer", comments.getWriter());
		result.put("img", comments.getPath() + comments.getUuidName());
		/* 조인해준 이름 가지고 넣어주기 */
		
		
		return result;
	}
	
}
