package com.woo.infra.modules.comment;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {

	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.comment.CommentMapper";
	
	public List<Comment> selectList(){ return sqlSession.selectList(namespace + ".selectList", ""); }
	
	public int insert(Comment dto) {return sqlSession.insert(namespace + ".insert", dto);}
	
	public List<Comment> comments(CommentVo vo) {return sqlSession.selectList(namespace + ".commentList", vo);}
	
	public Comment selectOneComment(Comment dto) {return sqlSession.selectOne(namespace + ".selectOneComment", dto);}
}
