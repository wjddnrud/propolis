package com.woo.infra.modules.comment;

import java.util.List;

public interface CommentService {

	public List<Comment> selectList() throws Exception;
	
	public int insert(Comment dto) throws Exception;
	
	public List<Comment> comments(CommentVo vo) throws Exception;
	
	public Comment selectOneComment(Comment dto) throws Exception;
	
}
