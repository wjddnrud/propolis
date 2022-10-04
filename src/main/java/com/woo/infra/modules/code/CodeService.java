package com.woo.infra.modules.code;

import java.util.List;

import com.woo.infra.common.util.BaseVo;

public interface CodeService {

	public List<Code> selectList(CodeVo vo) throws Exception;
	
//	public List<Code> ccg_name(Code dto) throws Exception;
	
	public List<Code> search(CodeVo bori) throws Exception;
	
	public int insert(Code dto) throws Exception;
	
	public Code selectOne(CodeVo vo) throws Exception;
	
	public int update(Code dto) throws Exception;
	
	public void selectListCachedCodeArrayList() throws Exception;
	
	public int selectOneCount(BaseVo vo) throws Exception;
	
	
	
}
