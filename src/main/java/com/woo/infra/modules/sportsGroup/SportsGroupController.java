package com.woo.infra.modules.sportsGroup;

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

import com.woo.infra.modules.community.Community;
import com.woo.infra.modules.community.CommunityVo;


@Controller
@RequestMapping(value = "/sportsGroup/")

public class SportsGroupController {

	
	@Autowired
	SportsGroupServiceImpl service;
	
	
	public void setParamsPaging(SportsGroupVo vo) throws Exception {
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "sportsGroupList")
	public String sportsGroupList(Model model, SportsGroup dto, @ModelAttribute("vo") SportsGroupVo vo) throws Exception { 
	
		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
		setParamsPaging(vo);
		
		
		List<SportsGroup> list = service.selectList(vo);
		model.addAttribute("list",list);
		
		System.out.println("controller list : " + list);
		
		return "infra/SportsMate/findMate";
	}
	
	@RequestMapping(value = "sportsGroupView")
	public String sportsGroupView(Model model, SportsGroupVo vo) throws Exception {
		
		System.out.println("service : " + vo.getShSeq());
		
		SportsGroup selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		
		return "infra/SportsMate/findMateView";
	}
	
	@RequestMapping(value = "sportsGroupInst")
	public String sportsGroupInst(Model model, SportsGroup dto, SportsGroupVo vo) throws Exception {
		
		service.insert(dto);
		
		return "redirect:/sportsGroup/sportsGroupList";
	}
	
	
	@RequestMapping(value = "sportsGroupForm")
	public String sportsGroupForm(Model model, SportsGroupVo vo, SportsGroup dto) throws Exception {
		
		List<SportsGroup> list = service.selectList(vo);
		model.addAttribute("list",list);
		
		List<SportsGroup> sports = service.sports(dto);
		model.addAttribute("sports",sports);
		
		
		return "infra/SportsMate/findMateForm";
	}
	
	@RequestMapping("excelDownload")
    public void excelDownload(SportsGroupVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		/* paging 걸어주지 않으면 수많은 리스트를 한번에 불러온다. */

		if (vo.getTotalRows() > 0) {
			List<SportsGroup> list = service.selectList(vo);
			
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
	        sheet.setColumnWidth(2, 2100);
	        sheet.setColumnWidth(3, 3100);
	        sheet.setColumnWidth(4, 2100);
	        sheet.setColumnWidth(5, 3100);
	        sheet.setColumnWidth(6, 2100);
	        
//	        Header
	        String[] tableHeader = {"No", "작성자", "제목", "운동종목", "모집인원", "운동일자", "시작시간", "종료시간", "그룹설명", "운동위치", "등록일자",};

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
	            cell.setCellValue(Integer.parseInt(list.get(i).getSeq()));
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getCreator());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getGroup_name());
	            
	            cell = row.createCell(3);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getSports());

	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getPeople_number());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getPlayDate());
	            
	            cell = row.createCell(6);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getStartTime());
	            
	            cell = row.createCell(7);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getEndTime());
	            
	            cell = row.createCell(8);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getDetail());
	            
	            cell = row.createCell(9);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getLocation());
	            
	            cell = row.createCell(10);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            if(list.get(i).getCreateDate() != null) cell.setCellValue((list.get(i).getCreateDate()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=sportsGroupList.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
}
