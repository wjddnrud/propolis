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
	
	public List<Post> selectList(PostVo vo) {
		
		List<Post> selectList = sqlSession.selectList(namespace + ".selectList", vo);
		
		return selectList;
	}
	
	public int insert(Post dto) {
		
		
		int insert = sqlSession.insert(namespace + ".insert", dto);
		
//		System.out.println("dao insert : " + insert);
		
		return insert;
	}
	
	public Post selectOne(PostVo vo) {
		
//		System.out.println("dao : " + vo.getShSeq());
		
		Post selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
//		System.out.println("dao selectOne : " + selectOne);
		
		return selectOne;
	}

	
	public int update(Post dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(Post dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(PostVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	public int selectLastSeq() throws Exception{ return sqlSession.selectOne(namespace + ".selectLastSeq", "");}
	
	public int insertPostUpload(Post dto) throws Exception {return sqlSession.insert(namespace + ".insertPostUpload", dto);}

	public Post selectPostImg(Post dto) {
		return sqlSession.selectOne(namespace + ".selectPostImg", dto);
	}
	
	public List<Post> MyselectList(Post dto) throws Exception {
		
		return sqlSession.selectList(namespace + ".MyselectList", dto);
	}
	
	/* main화면 게시물 수 count */
	public int selectCountFromCategory(int i) {
		return sqlSession.selectOne(namespace + ".selectCountFromCategory" , i) ;
	}
	
	/* main화면 today 신규 등록 게시물 수 count */
	public int selectCountNewFromCategory(Post dto) {
		return sqlSession.selectOne(namespace + ".selectCountNewFromCategory", dto);
	}
	
	public int selectOneCount(PostVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int thumbUp(Post dto) {return sqlSession.insert(namespace + ".thumbUp", dto);}
	
	public int thumbDown(Post dto) {return sqlSession.delete(namespace + ".thumbDown", dto);}
	
	public List<Post> thumbUpList(Post dto){return sqlSession.selectList(namespace + ".thumbUpList", dto);}
	

}
