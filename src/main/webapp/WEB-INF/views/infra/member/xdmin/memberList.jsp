<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
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
										<li><a href="/codegroup/main">Home</a></li>
										<li><a href="/codegroup/findMate">Find Mate</a></li>
										<li><a href="/codegroup/board">Community</a></li>
										<li><a href="/codegroup/signIn">LOG-OUT</a></li>
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
											<a class="nav-link" href="#">코드그룹관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#">코드관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" aria-current="page" href="#">회원관리</a>
										</li>
									</ul>
								</div>
								<br>
								<div>
								<form  action="http://localhost:8080/member/src">
									<form class="d-flex" role="search">
										<select class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="gender">삭제여부</option>
											<option value="">N</option>
											<option value="">Y</option>
										</select>
										<select class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="gender">수정일</option>
											<option value="">1</option>
											<option value="">2</option>
										</select>
										
										<p>Date: <input <%-- value="<c:out value="${vo.shStartDate }" />" --%> class="form-control me-1" name="shStartDate" type="text" placeholder="시작일" id="datepicker1"></p>
										
										<p>Date: <input <%-- value="<c:out value="${vo.shEndDate }" />" --%> class="form-control me-1" name="shEndDate" type="text" placeholder="종료일" id="datepicker2"></p>
										
										<select id="shOption" name="shOption" class="form-select form-select-sm">
											<option value="0" <c:if test="${vo.shOption eq 0 }">selected</c:if>>검색구분</option>
											<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>번호</option>
											<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>ID</option>
											<option value="3" <c:if test="${vo.shOption eq 3 }"></c:if>>PASSWORD</option>
											<option value="4" <c:if test="${vo.shOption eq 4 }">selected</c:if>>이름</option>
											<option value="5" <c:if test="${vo.shOption eq 5 }">selected</c:if>>생년월일</option>
											<option value="6" <c:if test="${vo.shOption eq 6 }">selected</c:if>>성별</option>
											<option value="7" <c:if test="${vo.shOption eq 7 }">selected</c:if>>직업</option>
											<option value="8" <c:if test="${vo.shOption eq 8 }">selected</c:if>>우편번호</option>
											<option value="9" <c:if test="${vo.shOption eq 9 }">selected</c:if>>주소</option>
											<option value="10" <c:if test="${vo.shOption eq 10 }">selected</c:if>>상세주소</option>
											<option value="11" <c:if test="${vo.shOption eq 11 }">selected</c:if>>통신사</option>
											<option value="12" <c:if test="${vo.shOption eq 12 }">selected</c:if>>휴대전화 번호</option>
											<option value="13" <c:if test="${vo.shOption eq 13 }">selected</c:if>>가입경로</option>
										</select>
										<input id="<c:out value="${vo.shValue }"/>" name="shValue"  class="form-control me-1" type="text" placeholder="검색어">
										
										<button class="btn btn-outline-success me-1" type="submit"><i
												class="fa-solid fa-magnifying-glass"></i></button>
										<button class="btn btn-outline-warning" type="reset"><i class="fa-solid fa-arrow-rotate-left"></i></button>
									</form>
								</div>
								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<th>
													<input type="checkbox" id="demo-human" name="demo-human">
													<label for="demo-human">선택</label>
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
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td><c:out value="${list.seq }"/></td>
												<td><c:out value="${list.id }"/></td>
												<td><c:out value="${list.password }"/></td>
												<td><c:out value="${list.name }"/></td>
												<td><c:out value="${list.dob }"/></td>
												<td><c:out value="${list.gender }"/></td>
												<td><c:out value="${list.job }"/></td>
												<td><c:out value="${list.zipcode }"/></td>
												<td><c:out value="${list.address }"/></td>
												<td><c:out value="${list.address_detail }"/></td>
												<td><c:out value="${list.mobileCarrier }"/></td>
												<td><c:out value="${list.phoneNumber }"/></td>
												<td><c:out value="${list.way_to_regist }"/></td>
												<td>2022-09-01 00:00:00</td>
												<td>2022-09-01 00:00:00</td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
											마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
										</tfoot>
									</table>
									
									<center>
										<a href="boardReg.html" class="button primary">작성</a>
										<a href="index.html" class="button"><i class="fa-solid fa-house"></i>&nbsp;홈으로</a>
										<!-- <a href="boardNotify.html" class="button" style="background-color: red; color: white;">🚨신고</a> -->
									</center>
								</div>
							</section>



							</div>
						</section>
					</article>

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
			$( function() {
			  	$( "#datepicker1" ).datepicker({
			  		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				    changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
				    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				    yearRange: "1900:2023"
			  	});
			} );
			$( function() {
			  	$( "#datepicker2" ).datepicker({
			  		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				    changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
				    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				    yearRange: "1900:2023"
			  	});
			} );
			
			</script>



</body>
</html>