package com.woo.infra.modules.code;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woo.infra.modules.member.Member;
import com.woo.infra.modules.member.MemberVo;




@Controller
@RequestMapping(value = "/code/")
public class CodeController {

	@Autowired
	CodeServiceImpl service;
	

	public void setParamsPaging(CodeVo vo) throws Exception {
			
	//		페이징
			vo.setParamsPaging(service.selectOneCount(vo));
			
			System.out.println("controller vo.getRowNumToShow : " + vo.getRowNumToShow());
			System.out.println("controller vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());
			
		}
	
	
	@RequestMapping(value = "codeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo, Code dto) throws Exception {
		

		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
		setParamsPaging(vo);
		
		List<Code> list = service.selectList(vo);
		
		model.addAttribute("list", list);		
		
//		List<Code> ccgList = service.ccg_name(dto);
		
//		model.addAttribute("ccgList", ccgList);
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value = "codeSearch")
	public String codeSearch(Model model, @ModelAttribute("vo") CodeVo uza) throws Exception {
		
		uza.setStartRnumForMysql((uza.getThisPage()-1) * uza.getRowNumToShow());
		setParamsPaging(uza);
		
		List<Code> search = service.search(uza);
		model.addAttribute("list", search);
		
		return "infra/code/xdmin/codeList";
		
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInsert(Model model, Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		int insert = service.insert(dto);
		model.addAttribute("insert", insert);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		
		
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model, CodeVo vo, Code dto) throws Exception {
		
		Code selectOne = service.selectOne(vo);
		
		model.addAttribute("one", selectOne);
		
		List<Code> ccg_name = service.ccg_name(dto);
		model.addAttribute("add", ccg_name);
		System.out.println("add controller : " + ccg_name);
		
//		System.out.println("one.seq : " + selectOne.getSeq());
		
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value="codeUpdt")
	public String codeUpdt(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/code/codeList";
		
	}
	
	@RequestMapping("excelDownload")
    public void excelDownload(CodeVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Code> list = service.selectList(vo);
			
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
	        String[] tableHeader = {"Seq", "코드이름", "코드 key값", "사용여부", "삭제여부", "코드그룹Seq", "등록일자"};

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
	        	cell.setCellValue(list.get(i).getCc_name());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getCc_key());
	        	
	            cell = row.createCell(3);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            if(list.get(i).getUseNY() != null) cell.setCellValue(list.get(i).getUseNY());
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getDelNY());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getCcg_seq());
	            
	            cell = row.createCell(6);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	if(list.get(i).getCreateDate() != null) cell.setCellValue((list.get(i).getCreateDate()));
	            
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	
}
