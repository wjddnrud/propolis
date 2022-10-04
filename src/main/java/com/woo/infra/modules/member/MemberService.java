package com.woo.infra.modules.member;

import java.util.List;

import com.woo.infra.common.util.BaseVo;

public interface MemberService {

	public List<Member> selectList(MemberVo vo) throws Exception; 
	
	public List<Member> search(MemberVo vo) throws Exception;
	
	public Member selectOne(MemberVo vo) throws Exception;
	
	public int update(Member dto) throws Exception;
	
	public int delete(MemberVo vo) throws Exception;
	
	public int insert(Member dto) throws Exception;
	
	public int checkId(Member dto) throws Exception;
	
	public Member signInCheck(Member dto) throws Exception;
	
	public int selectOneCount(BaseVo vo) throws Exception;
}
