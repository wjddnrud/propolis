package com.woo.infra.modules.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.woo.infra.common.util.UtilUpload;

@Service
public class CommunityServiceImpl implements CommunityService{
	

	@Autowired
	CommunityDao dao;
	
	@Override
	public List<Community> selectList(CommunityVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public int insert(Community dto) throws Exception {

		int insert = dao.insert(dto);
//		System.out.println("service insert : " + insert);
		
		
        int pSeq = dao.selectLastSeq();
//        System.out.println("dao.selectLastSeq : " + dao.selectLastSeq());

        int j = 0;
        for(MultipartFile myFile : dto.getMultipartFile()) {

            if(!myFile.isEmpty()) {
                // postServiceImpl
                String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
                UtilUpload.uploadCommunityImg(myFile, pathModule, dto);

                dto.setType(2);
                dto.setDefaultNY(j == 0 ? 1 : 0);
                dto.setSort(j+1);
                dto.setpSeq(pSeq);

                dao.insertCommunityUpload(dto);
                j++;
            }

        }
		
		return insert;
	}

	@Override
	public Community selectOne(CommunityVo vo) throws Exception {
		
//		System.out.println("service : " + vo.getShSeq());
		
		Community selectOne = dao.selectOne(vo);
		
//		System.out.println("service selectOne : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int update(Community dto) throws Exception {
		
		return dao.update(dto);
	}

	@Override
	public int ulete(Community dto) throws Exception {
		
		return dao.uelete(dto);
	}

	@Override
	public int delete(CommunityVo vo) throws Exception {
		
		return dao.delete(vo);
	}

	@Override
	public Community selectCommunityImg(Community dto) throws Exception {

		return dao.selectCommunityImg(dto);
	}

	@Override
	public List<Community> MyselectList(Community dto) throws Exception {
		
		System.out.println("getSeq : " + dto.getSeq());
		
		return dao.MyselectList(dto);
	}

	@Override
	public int selectCountFromCategory(int i) throws Exception {
		return dao.selectCountFromCategory(i);
	}

	@Override
	public int selectCountNewFromCategory(Community dto) throws Exception {
		
		return dao.selectCountNewFromCategory(dto);
	}

	@Override
	public int selectOneCount(CommunityVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	
	
	
	
	


	
	
	
	
	
	
	
	
}
