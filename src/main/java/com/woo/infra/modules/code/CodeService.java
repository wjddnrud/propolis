package com.woo.infra.modules.code;

import java.util.List;

public interface CodeService {

	public List<Code> selectList() throws Exception;
	
	public List<Code> search(CodeVo bori) throws Exception;
	
	public Code selectOne(CodeVo vo) throws Exception;
	
	public int insert(Code dto) throws Exception;
	
	public void selectListCachedCodeArrayList() throws Exception;
	
	
}
