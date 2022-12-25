package com.woo.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woo.infra.common.util.BaseVo;

@Repository
public class MemberDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.member.MemberMapper";
	
	public List<Member> selectList(MemberVo vo){ 
		
		System.out.println("dao in vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("dao in vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());

		List<Member> selectList = sqlSession.selectList(namespace + ".selectList", vo);
		
		System.out.println("dao in vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("dao in vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());
		
		return selectList;
		
		}
	
	public List<Member> search(MemberVo vo){ return sqlSession.selectList(namespace + ".search", vo); }
	
	public Member selectOne(MemberVo vo) { 
		
		Member selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		System.out.println("dao.selectOne : " + selectOne);
		
		return selectOne;
		
	}
	
	public int selectOneCount(BaseVo vo) {
		 
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int update(Member dto) {
		
		int update = sqlSession.update(namespace + ".update", dto);
		
		return update;
	}
	
	public int delete(MemberVo vo) {
		
		int delete = sqlSession.delete(namespace + ".delete", vo);
		
		return delete;
	}
	

	public int insert(Member dto) {
		
		int insert = sqlSession.insert(namespace + ".insert", dto);
		
		System.out.println("member.insert : " + insert);
		
		return insert;
	}
	
	public int kakaoInsert(Member dto) {
		
		return sqlSession.insert(namespace + ".kakaoInsert" , dto);
	}
	
	public int selectLastSeq() throws Exception {
		
		return sqlSession.selectOne(namespace + ".selectLastSeq", "");
	}
	
	public int insertMemberUpload(Member dto) throws Exception {
		int insertMemberUpload = sqlSession.insert(namespace + ".insertMemberUpload", dto);
		return insertMemberUpload;
	}
	
	public Member selectMemberImg(Member dto) throws Exception {
		
		System.out.println("getSeq : " + dto.getSeq());
		Member selectMemberImg = sqlSession.selectOne(namespace + ".selectMemberImg", dto);
		
		return selectMemberImg;
		
	}
	
	
	public int checkId(Member dto) throws Exception {
		
		return sqlSession.selectOne(namespace + ".checkId", dto);
		
	}
	
	public Member signInCheck(Member dto) throws Exception {
		
		Member signInCheck = sqlSession.selectOne(namespace + ".signInCheck", dto);
		
		System.out.println("dao signInCheck : " + signInCheck);
		
		return signInCheck;
	}
	
	public Member kakaoSignInCheck(Member dto) throws Exception {
		
		Member kakaoSignInCheck = sqlSession.selectOne(namespace + ".kakaoSignInCheck", dto);
		
		return kakaoSignInCheck;
	}
	
	public int memberCount(int i) {return sqlSession.selectOne(namespace + ".memberCount", i);}
	
}
