package com.woo.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woo.infra.modules.code.CodeServiceImpl;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;



@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;

	public void setParamsPaging(MemberVo vo) throws Exception {

		vo.setParamsPaging(service.selectOneCount(vo));
		System.out.println("controller vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("controller vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());

	}

	@RequestMapping(value = "memberList")
	public String memberList(Model model, @ModelAttribute("vo") MemberVo vo, Member dto) throws Exception {

		vo.setStartRnumForMysql((vo.getThisPage() - 1) * vo.getRowNumToShow());
		setParamsPaging(vo);

		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);

//		vo.setShDate(vo.getShDate() == null ? 0 : vo.getShDate());
//		vo.setShOption(vo.getShOption() == null ? 2 : vo.getShOption());
//		vo.setShStartDate(vo.getShStartDate() == null || vo.getShStartDate() == "" ? null : vo.getShStartDate());
//		vo.setShEndDate(vo.getShEndDate() == null || vo.getShEndDate() == "" ? null : vo.getShEndDate());

		return "infra/member/xdmin/memberList";
	}

	@RequestMapping(value = "memberSearch")
	public String memberSearch(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {

//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
		
		vo.setStartRnumForMysql((vo.getThisPage() - 1) * vo.getRowNumToShow());
		setParamsPaging(vo);

		List<Member> list = service.search(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "infra/member/xdmin/memberList";
	}

	@RequestMapping(value = "memberAdminForm")
	public String memberAdminForm(Model model, MemberVo vo, HttpSession httpSession) throws Exception {

		Member selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);

		return "infra/member/xdmin/memberForm";
	}
	
	@RequestMapping(value = "memberUserForm")
	public String memberUserForm(Model model, MemberVo vo, HttpSession httpSession) throws Exception {

		int sessSeq = (int) httpSession.getAttribute("sessSeq");
//		System.out.println("getAttribute: " + sessSeq);
		
		vo.setShSeq(sessSeq); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */
		
		Member selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);

		return "infra/SportsMate/signUp";
	}

	
//	@RequestMapping(value = "memberInst") 
//	public String memberInsert(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception {
//	  
//		int insert = service.insert(dto);
//		
//		redirectAttributes.addFlashAttribute("vo", vo);
//		
//		System.out.println("mmService.insert : " + insert);
//		
//		 return "redirect:/signIn"; 
//	}
	 

	@RequestMapping(value = "memberAdminUpdt")
	public String memberAdminUpdt(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.update(dto);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/memberList";
	}
	
	@RequestMapping(value = "memberUserUpdt")
	public String memberUserUpdt(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.update(dto);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "infra/SportsMate/myPage/myPageCommunityList";
	}

	@RequestMapping(value = "memberDele")
	public String memberDelete(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

		service.delete(vo);

		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/xdmin/memberList";

	}

	@ResponseBody
	@RequestMapping(value = "checkId")
	public Map<String, Object> checkId(Member dto) throws Exception {

		System.out.println("controller checkId");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.checkId(dto);

		System.out.println("result : " + result);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	
	//휴대폰 인중
	@ResponseBody
	@RequestMapping(value = "checkPhone")
	public Map<String, Object> checkPhone(Member dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		//5자리 난수 생성
		int rndNumber = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println(rndNumber);
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSEDETMOWCHUM51", "CNPNRQMYA2UNXA5B3MK5ILIZZ4A463P6", "https://api.solapi.com");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01084547909");
		message.setTo(dto.getPhoneNumber());
		message.setText("인증번호 : " + rndNumber);

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		result.put("code", rndNumber);
		
		//
		
		return result;
	}
	
	@RequestMapping("excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			
//			Workbook workbook = new HSSFWorkbook();	// for xls
	        Workbook workbook = new XSSFWorkbook();
	        Sheet sheet = workbook.createSheet("Sheet1");
	        CellStyle cellStyle = workbook.createCellStyle();        
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;
			
//	        each column width setting	        
	        sheet.setColumnWidth(0, 2100);
	        sheet.setColumnWidth(1, 3100);

//	        Header
	        String[] tableHeader = {"Seq", "이름", "아이디", "성별", "생일", "이메일", "모바일", "등록일", "수정일"};

	        row = sheet.createRow(rowNum++);
	        
			for(int i=0; i<tableHeader.length; i++) {
				cell = row.createCell(i);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
				cell.setCellValue(tableHeader[i]);
			}

//	        Body
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            
//	            String type: null 전달 되어도 ok
//	            int, date type: null 시 오류 발생 하므로 null check
//	            String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅	            
	            
	            cell = row.createCell(0);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getSeq());
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getName());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getId());
	        	
	            cell = row.createCell(3);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            if(list.get(i).getGender() != null) cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getGender()));
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getDob());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getEmail());
	            
	            cell = row.createCell(6);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getPhoneNumber());    
	            
	            cell = row.createCell(7);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	if(list.get(i).getCreateDate() != null) cell.setCellValue((list.get(i).getCreateDate()));
	            
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=memberList.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	

}
