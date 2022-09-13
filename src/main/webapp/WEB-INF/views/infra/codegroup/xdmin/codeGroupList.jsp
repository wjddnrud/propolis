<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<title>Admin_CodeGroupList</title>
</head>
	<body class="is-preload">
			<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<header id="header">
					<h1><a href="#">sports mate</a></h1>
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
						<h2>코드그룹 관리</h2>
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
											<a class="nav-link active" aria-current="page" href="/codegroup/codeGroupList">코드그룹관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/code/codeList">코드관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/member/memberList">회원관리</a>
										</li>
									</ul>
								</div>
								<br>
								<div>
								<form action="http://localhost:8080/codegroup/codeGroupSearch">
									<!-- <form class="d-flex" role="search"> -->
										<select name="shUseNY" class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="">사용여부</option>
											<option value="0">N</option>
											<option value="1">Y</option>
										</select>
										<select name="shDelNY" class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="">삭제여부</option>
											<option value="0">N</option>
											<option value="1">Y</option>
										</select>
										<select name="shDate" class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="">날짜 구분</option>
											<option value="0">등록일</option>
											<option value="1">수정일</option>
										</select>
										<input name="shStartDate" class="form-control me-1" type="search" placeholder="시작일" aria-label="Search">
										<input name="shEndDate" class="form-control me-1" type="search" placeholder="종료일" aria-label="Search">
										
										
										<select id="shOption" name="shOption" class="form-select form-select-sm">
											<option value="" >검색 구분</option>
											<option value="0" <c:if test="${vo.shOption eq 0 }">selected</c:if>>코드그룹 이름</option>
											<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>사용여부</option>
										</select>
										<input id="<c:out value="${vo.shValue }"/>" name="shValue"  class="form-control me-1" type="text" placeholder="검색어">
										<button class="btn btn-outline-success me-1" type="submit">
										<i class="fa-solid fa-magnifying-glass"></i></button>
										<button class="btn btn-outline-warning" type="reset">
										<i class="fa-solid fa-arrow-rotate-left"></i></button>
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
												<th>코드그룹 이름(한글)</th>
												<th>코드갯수</th>
												<th>사용여부</th>
												<th>삭제여부</th>
												<th>등록일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody style="color: black;">
											<c:choose>
												<c:when test="${fn:length(list) eq 0}">
													<tr>
														<td class="text-center" colspan="8">There is no data!</td>
													</tr>
												</c:when>
											</c:choose>
											<c:forEach items="${list}" var="list" varStatus="status">
											<tr style="color: black;">
												<td><input type="checkbox" id="demo-human" name="demo-human"><label></label></td>
												<%-- <td><c:out value="${list.seq }"/></td> --%> <!-- seq 데이터 보여주기만 -->
												<td><a href="/codegroup/codeGroupView?seq=<c:out value="${list.seq }"/>"> <!-- seq 데이터 보여주고 a태그로 넘어가지는 버튼 만들기 -->
												<c:out value="${list.seq}"/>
												</a></td>
												<td><c:out value="${list.ccg_name }"/></td>
												<td><c:out value="${list.xCodeCount }"/></td>
												<td>
												<c:choose>
													<c:when test="${list.useNY eq 0}">N</c:when>
													<c:when test="${list.useNY eq 1}">Y</c:when>
												</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.delNY eq 0}">N</c:when>
														<c:when test="${list.delNY eq 1}">Y</c:when>
													</c:choose>
												</td>
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
									
									<center>
										<a href="/codegroup/codeGroupForm" class="button primary">코드그룹 등록</a>
										<a href="/codegroup/codeGroupList" class="button"><i class="fa-solid fa-house"></i>취소</a>
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



</body>
</html>