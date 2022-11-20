package com.woo.infra.modules.sportsGroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.woo.infra.common.util.BaseVo;
import com.woo.infra.common.util.UtilUpload;
import com.woo.infra.modules.base.Base;
import com.woo.infra.modules.member.Member;
import com.woo.infra.modules.member.MemberDao;

@Service

public class SportsGroupServiceImpl implements SportsGroupService{
	
	@Autowired
	SportsGroupDao dao;
	MemberDao mmdao;

	@Override
	public List<SportsGroup> selectList(SportsGroupVo vo) throws Exception {
		
		
		List<SportsGroup> selectList = dao.selectList(vo);
		
		System.out.println("selectList : " + selectList);
		
//		sportgroup List 에 이미지 없이 생성한 방의 기본 이미지 지정 로직
		
//		if(selectList.getPath() == null || selectList.getUuidName() == null) {
//			selectList.setPath("/resources/uploaded/sportsgroup/");
//			selectList.setUuidName("basicImg.jpg");
//		}
		 
		return dao.selectList(vo);
	}

	@Override
	public SportsGroup selectOne(SportsGroupVo vo) throws Exception {
		
		SportsGroup selectOne = dao.selectOne(vo);
		
		if(selectOne.getPath() == null || selectOne.getUuidName() == null) {
			selectOne.setPath("/resources/uploaded/member/");
			selectOne.setUuidName("noprofil.jpg");
		}
		
//		System.out.println("selectOne dao : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int insert(SportsGroup dto) throws Exception {

		int insert = dao.insert(dto);
		System.out.println("multipartfile : " + dto.getMultipartFile());
		
        int pSeq = dao.selectLastSeq();
        System.out.println("selectLastSeq : " + pSeq);

        int j = 0;
        for(MultipartFile myFile : dto.getMultipartFile()) {

            if(!myFile.isEmpty()) {
                // postServiceImpl
                String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
                UtilUpload.uploadSportsGroupImg(myFile, pathModule, dto);

                dto.setType(2);
                dto.setDefaultNY(j == 0 ? 1 : 0);
                dto.setSort(j+1);
                dto.setpSeq(pSeq);
//                업데이트하려면 pSeq말고 dto 담아서 레츠기릿

                dao.groupImgUpload(dto);
                j++;
            }

        }
		
		return insert;
	}
	
	@Override
	public List<SportsGroup> sports(SportsGroup dto) throws Exception {
		
		List<SportsGroup> sports = dao.sports(dto);
		
		return sports;
	}

	@Override
	public List<SportsGroup> MyselectList(SportsGroup sgdto) throws Exception {
		
		List<SportsGroup> MyselectList = dao.MyselectList(sgdto);
		
		return MyselectList;
	}

	@Override
	public int selectOneCount(BaseVo vo) throws Exception {

			
		return dao.selectOneCount(vo);
	}
	
	@Override
	public Member selectMemberImg(Member dto) throws Exception {

		Member selectMemberImg = mmdao.selectMemberImg(dto);
		
		System.out.println("dao.selectMemberImg : " + selectMemberImg);
		
		if(selectMemberImg.getPath() == null || selectMemberImg.getUuidName() == null) {
			selectMemberImg.setPath("/resources/uploaded/member/");
			selectMemberImg.setUuidName("noprofil.jpg");
		}
		return selectMemberImg;
	}
	
	
	
}
