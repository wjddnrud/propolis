package com.woo.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeDao dao;
	
	@Override
	public List<Code> selectList() throws Exception {
		
		return dao.selectList();
		
	}

	@Override
	public List<Code> search(CodeVo bori) throws Exception {
		
		return dao.search(bori);
		
	}
	
	
	
	@Override
	public Code selectOne(CodeVo vo) throws Exception {

		Code selectOne = dao.selectOne(vo);
		
		System.out.println("Code service selectOne : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int insert(Code dto) throws Exception {
		
		if(dto.getDelNY() == null)
			dto.setDelNY(1);
		
		int insert = dao.insert(dto);
		
		System.out.println("dao insert : " + insert);
		
		return insert;
		
	}

	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		Code.cachedCodeArrayList.clear(); 
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " chached !");
	}
	
	public static List<Code> selectListCachedCode(String ccg_seq) throws Exception {
		
		List<Code> rt = new ArrayList<Code>();
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCcg_seq().equals(ccg_seq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		return rt;
	}
	
}
