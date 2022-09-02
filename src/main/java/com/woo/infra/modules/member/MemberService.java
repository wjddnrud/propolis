package com.woo.infra.modules.member;

import java.util.List;

public interface MemberService {

	public List<Member> selectList(MemberVo vo) throws Exception; 
	
	public List<Member> srcList(MemberVo vo) throws Exception; 
	
}
