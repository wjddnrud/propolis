package com.woo.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.woo.infra.common.util.BaseVo;
import com.woo.infra.common.util.UtilSecurity;
import com.woo.infra.common.util.UtilUpload;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		
		System.out.println("service vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("service vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());
		
		return dao.selectList(vo);
	}

	@Override
	public List<Member> search(MemberVo vo) throws Exception {
		
		return dao.search(vo);
		
//		  if(vo.getShGender() == null) vo.setShGender(0);
//		  
//		  if(vo.getShTelecom() == null) vo.setShTelecom(1);
//		  
//		  if(vo.getShWayReg() == null) vo.setShWayReg(3);
//		 
//		  
//		  if(vo.getShStartDate() == null || vo.getShStartDate() == "")
//		  vo.setShStartDate("1900-01-01 00:00:00");
//		  
//		  if(vo.getShEndDate() == null || vo.getShEndDate() == "")
//		  vo.setShEndDate("2023-12-31 00:00:00");
//		 
//		
//		if(vo.getShValue() == null)
//			vo.setShValue("");
//		
//		if(vo.getShOption() == null)
//			vo.setShOption(2);
//		System.out.println("----------------");
//		System.out.println(vo.getShOption());
//		
//		  if(vo.getShDelNY() == null) vo.setShOption(0);
//		  
//		  if(vo.getShDate() == null) vo.setShDate(0);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		
		Member selectOne = dao.selectOne(vo);
		
		System.out.println("Service selectOne : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int update(Member dto) throws Exception {
		
		int update = dao.update(dto);
		
		return update;
	}
	
	@Override
	public int delete(MemberVo vo) throws Exception {
		
		int delete = dao.delete(vo);
		
		return delete;
	}

	@Override
	public int insert(Member dto) throws Exception {
		
//		password 암호화
		dto.setPassword(UtilSecurity.encryptSha256(dto.getPassword()));
		
		int insert = dao.insert(dto);
		System.out.println("dao.insert : " + insert);
		
		
		int pSeq = dao.selectLastSeq();
		System.out.println("dao.selectLastSeq : " + dao.selectLastSeq());

		int j = 0;
		for(MultipartFile myFile : dto.getMultipartFile()) {

			if(!myFile.isEmpty()) {
				// postServiceImpl
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				UtilUpload.uploadProfileImg(myFile, pathModule, dto);

				dto.setType(2);
				dto.setDefaultNY(j == 0 ? 1 : 0);
				dto.setSort(j+1);
				dto.setpSeq(pSeq);

				dao.insertMemberUpload(dto);
				j++;
			}
		}
		return insert;	
	}
	
	@Override
	public int kakaoInsert(Member dto) throws Exception {
		
		return dao.kakaoInsert(dto);
	}

	@Override
	public Member selectMemberImg(Member dto) throws Exception {

		Member selectMemberImg = dao.selectMemberImg(dto);
		
		System.out.println("dao.selectMemberImg : " + selectMemberImg);
		
		if(selectMemberImg.getPath() == null || selectMemberImg.getUuidName() == null) {
			selectMemberImg.setPath("/resources/uploaded/member/");
			selectMemberImg.setUuidName("noprofil.jpg");
		}
		return selectMemberImg;
	}

	@Override
	public int selectOneCount(BaseVo vo) throws Exception {
		
		return dao.selectOneCount(vo) ;
	}

	@Override
	public int checkId(Member dto) throws Exception {
		
		int checkId = dao.checkId(dto);
		
		return checkId;
	}

	@Override
	public Member signInCheck(Member dto) throws Exception {
		
		dto.setPassword(UtilSecurity.encryptSha256(dto.getPassword()));  // 로그인할 떄도 암호화 시켜서 들어가도록!
		
		Member signInCheck = dao.signInCheck(dto);
		
		System.out.println("service signInCheck : " + signInCheck);
		
		return signInCheck;
	}

	@Override
	public Member kakaoSignInCheck(Member dto) throws Exception {
		
		return dao.kakaoSignInCheck(dto);
	}
	
	



	
	
	
	
}
