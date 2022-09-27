package com.woo.infra.modules.member;

import java.util.List;
import java.util.Map;

public interface MemberService {

	public List<Member> selectList() throws Exception; 
	
	public List<Member> search(MemberVo vo) throws Exception;
	
	public Member selectOne(MemberVo vo) throws Exception;
	
	public int update(Member dto) throws Exception;
	
	public int delete(MemberVo vo) throws Exception;
	
	public int insert(Member dto) throws Exception;
	
	public int checkId(Member dto) throws Exception;
	
	public Member signIn(Member dto) throws Exception;
}
