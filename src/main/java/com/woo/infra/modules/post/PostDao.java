package com.woo.infra.modules.post;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository

public class PostDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.post.PostMapper";
	
	public List<Post> selectList(){ return sqlSession.selectList(namespace + ".selectList", ""); }
	
}
