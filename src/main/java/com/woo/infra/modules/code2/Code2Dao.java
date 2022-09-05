package com.woo.infra.modules.code2;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Code2Dao {

		@Inject
		@Resource(name = "sqlSession")
		private SqlSession sqlSession;  //MYBATIS
		
		private static String namespace = "com.woo.infra.modules.code2.Code2Mapper";
		
		public List<Code2> selectList(){ return sqlSession.selectList(namespace + ".selectList", ""); }
}
