<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.woo.infra.modules.code.CodeServiceImpl"/>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<!-- datepicker jquery script import -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<title>Admin_memberList</title>
</head>
	<body class="is-preload">
			<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<header id="header">
					<h1><a href="index.html">sports mate</a></h1>
					<nav id="nav">
						<ul>
							<li class="special">
								<a href="#menu" class="menuToggle"><span>Menu</span></a>
								<div id="menu">
									<ul>
										<li><a href="#">Administor</a></li>
										<li><a href="/codegroup/codeGroupList">CodeGroupList</a></li>
										<li><a href="/code/codeList">CodeList</a></li>
										<li><a href="/member/memberList">MemberList</a></li>
										<li><a href="/signIn">LOG-OUT</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
				</header>

				<!-- Main -->
				<article id="main">
					<header>
						<h2>회원 관리</h2>
					</header>
					<section class="wrapper style5">
						<div class="inner">

							
							<section>
								<div>
									<ul class="nav nav-tabs">
										<li class="nav-item">
											<a class="nav-link" href="#"><i class="fa-solid fa-house-chimney"></i></a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/codegroup/codeGroupList">코드그룹관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/code/codeList">코드관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" aria-current="page" href="/member/memberList">회원관리</a>
										</li>
									</ul>
								</div>
								<br>
								
								<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
								<c:set var="listCodeWayReg" value="${CodeServiceImpl.selectListCachedCode('2')}"/>
								<c:set var="listCodeTelecom" value="${CodeServiceImpl.selectListCachedCode('7')}"/>
								
								<form  action="http://localhost:8080/member/memberSearch" name="formList" id="formList">
								
									<!-- 가져온값 뒷단에 담아주는곳 hidddn -->
									<input type="hidden" name="shSeq">
									
									<div class="row gtr-uniform">
										<div class="col-2">
											<select name="shWayReg" class="form-select form-control me-1 text-center" aria-label="Default selet example">
												<option value="">가입경로</option>
												<option value="1" <c:if test="${vo.shWayReg eq 1 }">selected</c:if>>지인추천</option>
												<option value="2" <c:if test="${vo.shWayReg eq 2 }">selected</c:if>>인터넷</option>
												<option value="3" <c:if test="${vo.shWayReg eq 3 }">selected</c:if>>유튜브</option>
												<option value="4" <c:if test="${vo.shWayReg eq 4 }">selected</c:if>>기타</option>
											</select>
										</div>
										<div class="col-2">
											<select name="shGender" class="form-select form-control me-1 text-center" aria-label="Default selet example">
												<option value="">성별</option>
												<option value="1" <c:if test="${vo.shGender eq 1 }">selected</c:if>>남성</option>
												<option value="2" <c:if test="${vo.shGender eq 2 }">selected</c:if>>여성</option>
												<option value="3" <c:if test="${vo.shGender eq 3 }">selected</c:if>>기타</option>
											</select>
										</div>
										<div class="col-2">
											<select name="shTelecom" class="form-select form-control me-1 text-center" aria-label="Default selet example">
												<option value="">통신사</option>
												<option value="1" <c:if test="${vo.shTelecom eq 1 }">selected</c:if>>SKT</option>
												<option value="2" <c:if test="${vo.shTelecom eq 2 }">selected</c:if>>KT</option>
												<option value="3" <c:if test="${vo.shTelecom eq 3 }">selected</c:if>>LG</option>
											</select>
										</div>
										<div class="col-2">
											<select name="shDate" class="form-select form-control me-1 text-center" aria-label="Default selet example">
												<option value="">날짜 검색</option>
												<option value="1"<c:if test="${vo.shDate eq 1 }">selected</c:if>>등록일</option>
												<option value="2"<c:if test="${vo.shDate eq 2 }">selected</c:if>>최근접속일</option>
												<option value="3"<c:if test="${vo.shDate eq 3 }">selected</c:if>>생년월일</option>
											</select>
										</div>
										<div class="col-2">
											<input autocomplete="off" value="${vo.shStartDate }" class="form-control me-1" name="shStartDate" type="text" placeholder="시작일" id="datepicker1">
										</div>
										<div class="col-2">
											<input autocomplete="off" value="${vo.shEndDate }" class="form-control me-1" name="shEndDate" type="text" placeholder="종료일" id="datepicker2">
										</div>
										<div class="col-2">
											<select name="shDelNY" class="form-select form-control me-1 text-center" aria-label="Default selet example">
												<option value="">삭제여부</option>
												<option value="1" <c:if test="${vo.shDelNY eq 1 }">selected</c:if>>N</option>
												<option value="2" <c:if test="${vo.shDelNY eq 2 }">selected</c:if>>Y</option>
											</select>
										</div>
										<div class="col-2">
											<select id="shOption" name="shOption" class="form-select text-center">
												<option value="">검색구분</option>
												<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>번호</option>
												<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>ID</option>
												<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>PASSWORD</option>
												<option value="4" <c:if test="${vo.shOption eq 4 }">selected</c:if>>이름</option>
												<option value="7" <c:if test="${vo.shOption eq 5 }">selected</c:if>>직업</option>
												<option value="8" <c:if test="${vo.shOption eq 6 }">selected</c:if>>우편번호</option>
												<option value="9" <c:if test="${vo.shOption eq 7 }">selected</c:if>>주소</option>
												<option value="10" <c:if test="${vo.shOption eq 8 }">selected</c:if>>상세주소</option>
												<option value="12" <c:if test="${vo.shOption eq 9 }">selected</c:if>>휴대전화 번호</option>
											</select>
										</div>
										<div class="col-2">
											<input value="${vo.shValue }" id="${vo.shValue }" name="shValue"  class="form-control me-1" type="text" placeholder="검색어">
										</div>
										<div class="col-2">
											<button class="btn btn-success me-1" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
											<button class="btn btn-warning" type="reset" onclick="location.href='/member/memberList'"><i class="fa-solid fa-arrow-rotate-left"></i></button>
										</div>
									</div>
									<hr>
								</form>
								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<th>
													<input type="checkbox" id="allAgree" name="allAgree" onclick="selectAll(this)">
													<label for="allAgree" style="color: white;">선택</label>
												</th>
												<th>#</th>
												<th>ID</th>
												<th>PASSWORD</th>
												<th>이름</th>
												<th>생년월일</th>
												<th>성별</th>
												<th>직업</th>
												<th>우편번호</th>
												<th>주소</th>
												<th>상세주소</th>
												<th>통신사</th>
												<th>휴대전화 번호</th>
												<th>가입경로</th>
												<th>가입일자</th>
												<th>최근접속 시간</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(list) eq 0}">
													<tr>
														<td class="text-center" colspan="16" style="color: black;">There is no data!</td>
													</tr>
												</c:when>
											</c:choose>
											<c:forEach items="${list}" var="list" varStatus="status">
											<tr style="color: black;">
												<td><input type="checkbox" id="agree${list.seq }" name="agree"><label></label></td>
												<td><a href="javascript:editForm(${list.seq })">
												<c:out value="${list.seq }"/></a></td>
												<td><c:out value="${list.id }"/></td>
												<td><c:out value="${list.password }"/></td>
												<td><c:out value="${list.name }"/></td>
												<td><c:out value="${list.dob }"/></td>
												<%-- <td>
													<c:choose>
														<c:when test="${list.gender eq 0}">남성</c:when>
														<c:when test="${list.gender eq 1}">여성</c:when>
														<c:when test="${list.gender eq 2}">기타</c:when>
													</c:choose>
												</td> --%>
												<td>
													<c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
														<c:if test="${list.gender eq listGender.cc_key}"><c:out value="${listGender.cc_name }"/></c:if>
													</c:forEach>
												</td>
												<td><c:out value="${list.job }"/></td>
												<td><c:out value="${list.zipcode }"/></td>
												<td><c:out value="${list.address }"/></td>
												<td><c:out value="${list.address_detail }"/></td>
												<%-- <td>
													<c:choose>
														<c:when test="${list.telecom eq 0 }">SKT</c:when>
														<c:when test="${list.telecom eq 1 }">KT</c:when>
														<c:when test="${list.telecom eq 2 }">LGT</c:when>
													</c:choose>
												</td> --%>
												<td>
													<c:forEach items="${listCodeTelecom}" var="listTelecom" varStatus="statusTelecom">
														<c:if test="${list.telecom eq listTelecom.cc_key}"><c:out value="${listTelecom.cc_name }"/></c:if>
													</c:forEach>
												</td>
												<td><c:out value="${list.phoneNumber }"/></td>
												
												<%-- <td>
													<c:choose>
														<c:when test="${list.way_to_regist eq 0 }">지인추천</c:when>
														<c:when test="${list.way_to_regist eq 1 }">인터넷</c:when>
														<c:when test="${list.way_to_regist eq 2 }">유튜브</c:when>
														<c:when test="${list.way_to_regist eq 3 }">기타</c:when>
													</c:choose>
												</td> --%>
												<td>
													<c:forEach items="${listCodeWayReg}" var="listWayReg" varStatus="statusWayReg">
														<c:if test="${list.way_to_regist eq listWayReg.cc_key}"><c:out value="${listWayReg.cc_name }"/></c:if>
													</c:forEach>
												</td>
												<td><c:out value="${list.createDate }"/></td>
												<td><c:out value="${list.lastLoginDate }"/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
											마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
										</tfoot>
									</table>
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item">
												<a class="page-link" href="#" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</li>
										</ul>
									</nav>
									
									<button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
									<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button>
									<!-- <button type="button" class="btn btn-primary" style="float: right;" onclick="regist()"><i class="fa-solid fa-plus"></i></button> -->
									<button class="btn btn-success me-1" style="float: right;" href="#"><i class="fa-solid fa-file-excel"></i></button>
									
								</div>
							</section>
								

							</div>
						</section>
					</article>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">삭제 여부 재확인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								정말로 삭제를 원하십니까?
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" onclick="remove();">Delete</button>
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</footer>

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
				function selectAll() {
					const checkboxes 
					= document.getElementsByName("agree");
				
					checkboxes.forEach((checkbox) => {
					checkbox.checked = selectAll.checked;
					})
				}
				
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
				
				function regist() {
					location.href = "/member/memberForm";
				}
				
				var form = $("form[name=formList]"); // name으로 된거 사용
				var editSeq = $("input:hidden[name=shSeq]");
				/* name이 seq인 hidden type의 input을 editSeq로 정해준다. */
				
				editForm = function(seq) {
					editSeq.attr("value", seq);
					form.attr("action", "/member/memberForm").submit();
				}
				
				
			</script>



</body>
</html>