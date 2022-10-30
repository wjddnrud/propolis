package com.woo.infra.modules.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao dao;

	@Override
	public List<Comment> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(Comment dto) throws Exception {
		
		return dao.insert(dto);
	}

	@Override
	public List<Comment> comments(CommentVo vo) throws Exception {
		return dao.comments(vo);
	}

	@Override
	public Comment selectOneComment(Comment dto) throws Exception {
		return dao.selectOneComment(dto);
	}
	
	
	
	
	
	
}
