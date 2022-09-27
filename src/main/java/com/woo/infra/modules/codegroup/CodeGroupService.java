package com.woo.infra.modules.codegroup;

import java.util.List;

import com.woo.infra.modules.util.BaseVo;


public interface CodeGroupService {

	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception; 
	
	public List<CodeGroup> search(CodeGroupVo vo) throws Exception;
	
	public int insert(CodeGroup dto) throws Exception;
	
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception;
	
	public int update(CodeGroup dto) throws Exception;
	
	public int uelete(CodeGroup dto) throws Exception;
	
	public int delete(CodeGroupVo vo) throws Exception;
	
	public List<CodeGroup> selectListWithoutPaging(CodeGroupVo vo) throws Exception;
	
	public int selectOneCount(BaseVo vo) throws Exception;
	
	
	
	
}
