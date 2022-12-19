package com.woo.infra.modules.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.woo.infra.modules.comment.Comment;
import com.woo.infra.modules.comment.CommentServiceImpl;
import com.woo.infra.modules.comment.CommentVo;

@Controller
@RequestMapping(value = "/post/")

public class PostController {

	@Autowired
	PostServiceImpl service;
	
	@Autowired
	CommentServiceImpl cmService;
	
	@RequestMapping(value = "postList")
	public String postList(@ModelAttribute("vo") PostVo vo, Model model) throws Exception {

		setSearch(vo);
		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Post> list = service.selectList(vo);
			model.addAttribute("list", list);
		}
		
		return "infra/post/postList";
	}
	
	
	@RequestMapping(value = "postInst")
	public String postInst(Model model, Post dto) throws Exception {
		
		System.out.println("dto.getMultipartFile : " + dto.getMultipartFile().length);
		
		service.insert(dto);

		return "redirect:/post/postList";
	}
	
	@RequestMapping(value = "postForm")
	public String postForm(Model model, Post dto, PostVo vo) throws Exception {
		
		Post selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
//		System.out.println("controller selectOne : " + selectOne);
		
		return "infra/post/postForm";
	}
	
	@RequestMapping(value = "postView")
	public String postView(Model model, Post dto, PostVo vo, CommentVo cmvo) throws Exception {
		
//		System.out.println("service : " + vo.getShSeq());
		
		Post selectOne = service.selectOne(vo);
		model.addAttribute("one", selectOne);
//		System.out.println("controller selectOne : " + selectOne);
		
		dto.setpSeq(vo.getShSeq()); /* vo로 seq를 받아온것을 pSeq에 set해줘야지 src확인 가능 */
		Post img = service.selectPostImg(dto);
		model.addAttribute("img",img);
		
		cmvo.setPost_seq(Integer.parseInt(selectOne.getSeq()));
		List<Comment> comments = cmService.comments(cmvo);
		model.addAttribute("comments", comments);
		
		
		return "infra/post/postView";
	}
	
	
//	마이페이지에서 게시물 리스트 먼저 만들고 그 페이지에서 seq 눌러서 수정할수 있도록 만들기
	
//	@RequestMapping(value = "communityUpdt")
//	public String communityUpdt(CommunityVo vo, Community dto, RedirectAttributes redirectAttributes) throws Exception {
//			
//		service.update(dto);
//		
//		redirectAttributes.addFlashAttribute("vo", vo);
//		
//		return "redirect:/community/communityList";
//	}
	
	
	
//	@RequestMapping(value = "imgLoad")
//	public String imgLoad(Model model, Community dto) throws Exception {
//		
//		
//		
//		return "/infra/SportsMate/communityView";
//	}
	
	@RequestMapping("excelDownload")
    public void excelDownload(PostVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		/* paging 걸어주지 않으면 수많은 리스트를 한번에 불러온다. */

		if (vo.getTotalRows() > 0) {
			List<Post> list = service.selectList(vo);
			
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
	        String[] tableHeader = {"No", "카테고리", "제목", "작성자", "작성일자"};

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
	        	cell.setCellValue(list.get(i).getCategory());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getTitle());
	            
	            cell = row.createCell(3);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getWriter());
	            
	            cell = row.createCell(4);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            if(list.get(i).getCreateDate() != null) cell.setCellValue((list.get(i).getCreateDate()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=communityList.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	
	
	/* community list ajax로 구현 */
	
	
	public void setSearch(PostVo vo) throws Exception {
			
//		vo.setShUseNy(vo.getShUseNy() == null ? 1 : vo.getShUseNy());
//		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
//		vo.setShOptionDate(vo.getShOptionDate() == null ? null : vo.getShOptionDate());
//		vo.setShDateStart(vo.getShDateStart() == null || vo.getShDateStart() == "" ? null : UtilDateTime.add00TimeString(vo.getShDateStart()));
//		vo.setShDateEnd(vo.getShDateEnd() == null || vo.getShDateEnd() == "" ? null : UtilDateTime.add59TimeString(vo.getShDateEnd()));
	}
	
	@RequestMapping(value = "myPostAjaxList")
	public String postAjaxList(@ModelAttribute("vo") PostVo vo, Model model) throws Exception {
		
		setSearch(vo);

		return "infra/post/myPostAjaxList";
	}
	
	
	@RequestMapping(value = "myPostAjaxLita")
	public String postAjaxLita(@ModelAttribute("vo") PostVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Post> list = service.selectList(vo);
			model.addAttribute("list", list);
		}

		return "infra/post/myPostAjaxLita";
	}
	
	@RequestMapping(value="postSearch")
	public String postSearch(PostVo vo) throws Exception {
		vo.setStartRnumForMysql((vo.getThisPage()-1) * vo.getRowNumToShow());
				
		return "infra/post/postList";
	}
	
	@ResponseBody
	@RequestMapping(value="thumbUp")
	public Map<String, Object> thumbUp(Post dto) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int thumbUp = service.thumbUp(dto);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="thumbDown")
	public Map<String, Object> thumbDown(Post dto) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int thumbDown = service.thumbDown(dto);
		
		return result;
	}
	 
	
	
}


