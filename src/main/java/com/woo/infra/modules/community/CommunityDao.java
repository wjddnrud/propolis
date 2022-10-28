package com.woo.infra.modules.community;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository

public class CommunityDao {
	
	@Inject
	@Resource(name = "sqlSession")

	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.community.CommunityMapper";
	
	public List<Community> selectList(CommunityVo vo) {
		
		List<Community> selectList = sqlSession.selectList(namespace + ".selectList", vo);
		
		return selectList;
	}
	
	public int insert(Community dto) {
		
		
		int insert = sqlSession.insert(namespace + ".insert", dto);
		
//		System.out.println("dao insert : " + insert);
		
		return insert;
	}
	
	public Community selectOne(CommunityVo vo) {
		
//		System.out.println("dao : " + vo.getShSeq());
		
		Community selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
//		System.out.println("dao selectOne : " + selectOne);
		
		return selectOne;
	}

	
	public int update(Community dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(Community dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(CommunityVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	public int selectLastSeq() throws Exception{ return sqlSession.selectOne(namespace + ".selectLastSeq", "");}
	
	public int insertCommunityUpload(Community dto) throws Exception {return sqlSession.insert(namespace + ".insertCommunityUpload", dto);}

	public Community selectCommunityImg(Community dto) {
		return sqlSession.selectOne(namespace + ".selectCommunityImg", dto);
	}
	
	public List<Community> MyselectList(Community dto) throws Exception {
		
		return sqlSession.selectList(namespace + ".MyselectList", dto);
	}
	
	/* main화면 게시물 수 count */
	public int selectCountFromCategory(int i) {
		return sqlSession.selectOne(namespace + ".selectCountFromCategory" , i) ;
	}
	
	/* main화면 today 신규 등록 게시물 수 count */
	public int selectCountNewFromCategory(Community dto) {
		return sqlSession.selectOne(namespace + ".selectCountNewFromCategory", dto);
	}
	
	public int selectOneCount(CommunityVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	

}
