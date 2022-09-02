package com.woo.infra.modules.codegroup;

import java.util.List;

public interface CodeGroupService {

	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception; 
	
	public List<CodeGroup> srcList(CodeGroupVo vo) throws Exception;
	
}
