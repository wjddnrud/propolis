package com.woo.infra.modules.codegroup;

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

@Controller
@RequestMapping(value = "/codegroup/") //주소에 따라 작동하는 컨트롤러가 다르므로 넘겨주는 model명은 같이해줘도 상관없음!!!
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	
	public void setParamsPaging(CodeGroupVo vo) throws Exception {
		
//		검색 초기값 설정
//		vo.setShDate(vo.getShDate() == null ? 0 : vo.getShDate());
//		vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
//		vo.setShStartDate(vo.getShStartDate() == null || vo.getShStartDate() == "" ? null : vo.getShStartDate());
//		vo.setShEndDate(vo.getShEndDate() == null || vo.getShEndDate() == "" ? null : vo.getShEndDate());
		
		
//		페이징
		vo.setParamsPaging(service.selectOneCount(vo));
		
	}
	
	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {

//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
//		System.out.println("vo.getStartRnumForMysql() : " + vo.getStartRnumForMysql());
//		System.out.println("vo.getThisPage() : " + vo.getThisPage());
//		System.out.println("vo.getRowNumToShow() : " + vo.getRowNumToShow());
		
		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
		
		setParamsPaging(vo);
		
//		System.out.println("vo.getStartRnumForMysql() : " + vo.getStartRnumForMysql());
		
//		List<String> list = new ArrayList<String>();
		List<CodeGroup> list = service.selectList(vo);
		
		model.addAttribute("list", list);
		
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupSearch")
	public String codeGroupSearch(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {

		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
		
		setParamsPaging(vo);
		
//		System.out.println("vo.getShValue(): " + vo.getShValue());
//		System.out.println("vo.getShOption(): " + vo.getShOption());
		 
		List<CodeGroup> search = service.search(vo);
		model.addAttribute("list", search);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		
		
//		 if(vo.getSeq().equals("0") || vo.getSeq().equals("")) {
//			 //insert
//		 } else {
//			 CodeGroup item = service.selectOne(vo);
//			 model.addAttribute("item", item);
//		 }
		
		CodeGroup selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
		System.out.println("controller selectOne : " + selectOne);
		
		List<CodeGroup> list = service.search(vo); 
		model.addAttribute("list", list);
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		int insert = service.insert(dto);
		System.out.println("controller inst : " + insert);
		
//		vo.setSeq(dto.getSeq());
		
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codegroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupView")
	public String codeGroupView() throws Exception {
		
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	
	
	
	@SuppressWarnings(value= {"all"})
	

	@RequestMapping(value="codeGroupUpdt")
	public String codeGroupUpdt(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);  
		
		return "redirect:/codegroup/codeGroupList";
	}

	@RequestMapping(value="codeGroupUele")
	public String codeGroupUele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.uelete(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codegroup/codeGroupList";
	}
	
	@RequestMapping(value="codeGroupDele")
	public String nationalityDele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codegroup/codeGroupList";
	}
	 
	@RequestMapping("excelDownload")
    public void excelDownload(CodeGroupVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		/* paging 걸어주지 않으면 수많은 리스트를 한번에 불러온다. */

		if (vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			
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
	        String[] tableHeader = {"Seq", "코드그룹 이름", "코드갯수", "사용여부", "삭제여부", "등록일"};

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
	        	cell.setCellValue(list.get(i).getCcg_name());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getxCodeCount());
	        	
	            cell = row.createCell(3);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getUseNY());
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getDelNY());
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            if(list.get(i).getCreateDate() != null) cell.setCellValue((list.get(i).getCreateDate()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=codeGroupList.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	
}
