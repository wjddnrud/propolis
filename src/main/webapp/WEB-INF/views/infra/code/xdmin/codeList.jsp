<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<!-- datepicker jquery script import -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="icon" href="/resources/images/images/favicon.ico">
	<title>Admin_CodeList</title>
	<style type="text/css">
			.on:hover {
				cursor: pointer;
			}
	</style>
</head>
	<body class="is-preload">
			<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<%@include file="/resources/include/adminHeader.jsp" %>

				<!-- Main -->
				<article id="main">
					<header>
						<h2>코드 관리</h2>
					</header>
					<section class="wrapper style5">
						<div class="inner">

							
							<section>
								<div>
									<ul class="nav nav-tabs">
										<!-- <li class="nav-item">
											<a class="nav-link" href="#"><i class="fa-solid fa-house-chimney"></i></a>
										</li> -->
										<li class="nav-item">
											<a class="nav-link" aria-current="page" href="/codegroup/codeGroupList">코드그룹관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" aria-current="page" href="/code/codeList">코드관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/member/memberList">회원관리</a>
										</li>
									</ul>
								</div>
								<br>
								<form action="http://localhost:8080/code/codeSearch" name="formList" id="formList" method="post">
								
								
									<!-- 가져온값 뒷단에 담아주는곳 hidddn -->
									<input type="hidden" name="shSeq">
									<!-- paging hidden -->
									<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
									<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
								
									<div class="row gtr-uniform">
										<div class="col-3">
											<select name="shUseNY" class="form-select form-control me-1 text-center">
												<option value="">사용여부</option>
												<option value="1" <c:if test="${vo.shUseNY eq 1}">selected</c:if>>N</option>
												<option value="2" <c:if test="${vo.shUseNY eq 2}">selected</c:if>>Y</option>
												
												<%-- <c:choose>
													<c:when test="${list.useNY eq 0}">N</c:when>
													<c:when test="${list.useNY eq 1}">Y</c:when>
												</c:choose> --%>
												
											</select>
										</div>
										<div class="col-3">
											<select name="shDate" class="form-select form-control me-1 text-center">
												<option value="">날짜 검색</option>
												<option value="1" <c:if test="${vo.shDate eq 1}">selected</c:if>>등록일</option>
												<option value="2" <c:if test="${vo.shDate eq 2}">selected</c:if>>수정일</option>
											</select>
										</div>
										<div class="col-3">
											<input value="${vo.shStartDate}" autocomplete="off" class="form-control me-1" name="shStartDate" type="text" placeholder="시작일" id="datepicker1">
										</div>
										<div class="col-3">
											<input value="${vo.shEndDate}" autocomplete="off" class="form-control me-1" name="shEndDate" type="text" placeholder="종료일" id="datepicker2">
										</div>
										<div class="col-3">
											<select name="shDelNY" class="form-select form-control me-1 text-center">
												<option value="">삭제여부</option>
												<option value="1" <c:if test="${vo.shDelNY eq 1}">selected</c:if>>N</option>
												<option value="2" <c:if test="${vo.shDelNY eq 2}">selected</c:if>>Y</option>
											</select>
										</div>
										<div class="col-3">
											<select id="shOption" name="shOption" class="form-select text-center">
												<option value="" <c:if test="${empty vo.shOption }">selected</c:if>>검색 구분</option>
												<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>코드 이름</option>
												<%-- <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>사용여부</option> --%>
											</select>
										</div>
										<div class="col-3">
											<input autocomplete="off" value="${vo.shValue }" id="<c:out value="${vo.shValue }"/>" name="shValue"  class="form-control me-1" type="text" placeholder="검색어">
										</div>
										<div class="col-3">
											<button class="btn btn-success me-1" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
											<button class="btn btn-warning" type="reset" onclick="location.href='/code/codeList'"><i class="fa-solid fa-arrow-rotate-left"></i></button>
										</div>	
									</div>
									<hr>
									<div class="table-wrapper">
										<table class="alt">
											<thead>
												<tr>
													<!-- <th>
														<input type="checkbox" id="demo-human" name="demo-human" onclick="selectAll(this)">
														<label for="demo-human" style="color: white;"></label>
													</th> -->
													<th>No</th>
													<!-- <th>#</th> -->
													<th>코드 이름(한글)</th>
													<th>사용여부</th>
													<th>삭제여부</th>
													<th>코드 key</th>
													<th>코드그룹_seq</th>
													<th>등록일</th>
													<th>수정일</th>
												</tr>
											</thead>
											<tbody style="color: black;">
												<c:choose>
													<c:when test="${fn:length(list) eq 0}">
														<tr>
															<td class="text-center" colspan="9">There is no data!</td>
														</tr>
													</c:when>
												</c:choose>
												<c:forEach items="${list}" var="list" varStatus="statusList">
												<tr style="color: black; text-align: center;" onclick="editForm('${list.seq}')" class="on">
													<!-- <td><input type="checkbox" id="checkbox" name="checkbox" style="width: 30px;"><label for="checkbox" style="position: relative;"></label></td> -->
													<!-- 게시물 넘버 역순으로 정렬 -->
													<%-- <td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + statusList.index) }"/></td> --%>
													<%-- <td><c:out value="${list.seq }"/></td> --%>
													<td><c:out value="${list.seq}"/></a></td>
													<td><c:out value="${list.cc_name }"/></td>
													<td>
														<c:choose>
															<c:when test="${list.useNY eq 1}">N</c:when>
															<c:when test="${list.useNY eq 2}">Y</c:when>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${list.delNY eq 1}">N</c:when>
															<c:when test="${list.delNY eq 2}">Y</c:when>
														</c:choose>
													</td>
													<td><c:out value="${list.cc_key }"/></td>
													<td><c:out value="${list.ccg_seq }"/></td>
													<td><c:out value="${list.createDate }"/></td>
													<td><c:out value="${list.modiDate }"/></td>
												</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
												마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
											</tfoot>
										</table>
										
										<!-- pagination -->
										<%@include file="/resources/include/pagination.jsp"%>
										
										<!-- <button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
										<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button> -->
										<button type="button" class="btn btn-primary" style="float: right;" onclick="regist();"><i class="fa-solid fa-plus"></i></button>
										<button type="button" class="btn btn-success me-1" id="btnExcel" style="float: right;"><i class="fa-solid fa-file-excel"></i></button>
										
									</div>	
								</form>
							</section>
						</div>
					</section>
				</article>

				<!-- Footer -->
				<%@include file="/resources/include/footer.jsp"%>
			</div>

			<!-- Scripts -->
			<script src="/resources/images/assets/js/jquery.min.js"></script>
			<script src="/resources/images/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/images/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/images/assets/js/browser.min.js"></script>
			<script src="/resources/images/assets/js/breakpoints.min.js"></script>
			<script src="/resources/images/assets/js/util.js"></script>
			<script src="/resources/images/assets/js/main.js"></script>
			<script src="https://kit.fontawesome.com/f92c8dde3d.js" crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
			<script>
				/* datepicker */
				$( function() {
				  	$( "#datepicker1, #datepicker2" ).datepicker({
				  		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					    changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
					    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
					    yearRange: 'c-50:c+20', // 현재 연도를 기준으로 +N 년 -N 년 표시
					    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // [요일] 한글화
					    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // [월] 한글화
				  		closeText: '닫기',
				  		showButtonPanel: true, // 달력 하단에 버튼 표시
				  		currentText: '오늘 날짜', // 오늘 날짜 클릭 시 클릭 시 오늘 날짜로 이동
				    	showAnim: "slide", // 달력에 애니메이션 적용
				    	minDate: '-50y', // 현재 날짜로부터 N 년까지 표시
				    	nextText: '다음 달', // next 아이콘 툴팁
				    	prevText: '이전 달' // prev 아이콘 툴팁
				  	});
				} );
			
				/* 체크박스 전체선택 */
				function selectAll(selectAll)  {
					const checkboxes 
						= document.getElementsByName("checkbox");
					
					checkboxes.forEach((checkbox) => {
					checkbox.checked = selectAll.checked;
					})
				}
				
				/* 신규등록버튼 */
				function regist() {
					location.href = "/code/codeForm";
				}
				
				/* page 이동 */
				var goUrlList = "/code/codeList";    /* # -> */
				var goUrlInst = "/code/codeInst";    /* # -> */
				var goUrlUpdt = "/code/codeUpdt";    /* # -> */
				var goUrlUele = "/code/codeUele";    /* # -> */
				var goUrlDele = "/code/codeDele";    /* # -> */
				
				var form = $("form[name=formList]"); // name으로 된거 사용
				var editSeq = $("input:hidden[name=shSeq]");
				/* name이 seq인 hidden type의 input을 editSeq로 정해준다. */
				
				editForm = function(seq) {
					editSeq.attr("value", seq);
					form.attr("action", "/code/codeForm").submit();
				}
				
				goList = function(thisPage) {
					$("input:hidden[name=thisPage]").val(thisPage);
					form.attr("action", goUrlList).submit();
				}
				
				var excelUri = "/code/excelDownload";
				
				$("#btnExcel").click(function() {
					form.attr("action", excelUri).submit();
				});
				
				
			</script>


</body>
</html>