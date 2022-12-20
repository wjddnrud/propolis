<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="CodeServiceImpl"
	class="com.woo.infra.modules.code.CodeServiceImpl" />


<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<title>Community</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<link rel="icon" href="/resources/images/images/favicon.ico">
	
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
		<%@include file="/resources/include/header.jsp"%> 

		<form name="postForm" id="postForm" style="margin-bottom: 0px;">
			<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
			<c:set var="listCodeCategory" value="${CodeServiceImpl.selectListCachedCode('3')}" />

			<!-- shSeq 받아서 view로 seq 넘겨줄 hidden input -->
			<input type="hidden" name="shSeq" id="shSeq">
			
			<!-- <input type="hidden" name="mainKey"> -->
			<input type="hidden" name="thisPage"
				value="<c:out value="${vo.thisPage}" default="1"/>"> <input
				type="hidden" name="rowNumToShow"
				value="<c:out value="${vo.rowNumToShow}"/>">
				
			<!-- Main -->
			<article id="main">
				<header>
					<h2>Community</h2>
					<p>관련 정보들을 멤버들과 공유해보세요.</p>
				</header>
				<section class="wrapper style5">
					<div class="inner">
						<section style="height: 100px;">
							<div class="row gtr-uniform" style="padding-left: 15px;">
								<div class="col-3">
									<select class="form-select form-control me-1 text-center" id="shCategory" name="shCategory">
										<option value="">카테고리</option>
										<option value="1" <c:if test="${one.sports eq 1 }" >selected</c:if>>Diet</option>
										<option value="2" <c:if test="${one.sports eq 2 }" >selected</c:if>>Weight</option>
										<option value="3" <c:if test="${one.sports eq 3 }" >selected</c:if>>Food</option>
									</select>
								</div>
								<div class="col-3">
									<select id="shOption" name="shOption" class="form-select text-center">
										<option value="" <c:if test="${empty vo.shOption }">selected</c:if>>검색 구분</option>
										<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>제목</option>
										<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>작성자</option>
									</select>
								</div>
								<div class="col-3">
									<input autocomplete="off" value="${vo.shValue }" id="<c:out value="${vo.shValue }"/>" name="shValue"  class="form-control me-1" type="text" placeholder="검색어">
								</div>
								<div class="col-3">
									<button class="btn btn-success me-1" onclick="searchPost()"><i class="fa-solid fa-magnifying-glass"></i></button>
									<button class="btn btn-warning" type="reset" onclick="location.href='/post/postList'"><i class="fa-solid fa-arrow-rotate-left"></i></button>
								</div>	
							</div>
						</section>
						
						<section>
							<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>No</th>
											<th>카테고리</th>
											<th>제목</th>
											<th>작성자</th>
											<th>추천수</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(list) eq 0}">
												<tr>
													<td class="text-center" colspan="6">데이터가 없습니다.</td>
												</tr>
											</c:when>
										</c:choose>
										<c:forEach items="${list}" var="list" varStatus="statusList">
											<tr onclick="viewForm('${list.seq}')" class="on">
												<td style="text-align: center;"><c:out
														value="${list.seq }" /></td>
												<td style="text-align: center;">
													<c:forEach items="${listCodeCategory}" var="listCategory" varStatus="statusCategory">
														<c:if test="${list.category eq listCategory.cc_key}">
															<c:out value="${listCategory.cc_name }" />
														</c:if>
													</c:forEach></td>
												<td><c:out value="${list.title }"></c:out></td>
												<td style="text-align: center;"><c:out value="${list.writer }"></c:out></td>
												<td style="text-align: center;"><c:out value="${list.thumbUpCount }"></c:out></td>
												<td style="text-align: center;"><c:out value="${list.createDate }"></c:out></td>
											</tr>
										</c:forEach>
	
									</tbody>
								</table>
	
								<!-- pagination  -->
								<%@include file="/resources/include/pagination.jsp"%>
	
								<br>
								<center>
									<!-- <button type="button" class="btn btn-success me-1"
										id="btnExcel" style="float: right;"> 
										<i class="fa-solid fa-file-excel"></i>
									</button> -->
									<a href="/main" class="button">홈</a>
									<a href="/post/postForm" class="button primary">작성</a> 
									<!-- <a class="button" id="btnExcel" style="background: green; color: white;">Excel다운</a> -->
									<!-- <a href="boardNotify.html" class="button" style="background-color: red; color: white;">🚨신고</a> -->
								</center> 
							</div>
						</section>
	
	
	
					</div>
				</section>
			</article>
		</form>

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
	<script src="https://kit.fontawesome.com/f92c8dde3d.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		var goUrlList = "/post/postList"; /* # -> */
		var goUrlInst = "/post/postInst"; /* # -> */
		var goUrlUpdt = "/post/postUpdt"; /* # -> */
		var goUrlUele = "/post/postUele"; /* # -> */
		var goUrlDele = "/post/postDele"; /* # -> */

		var form = $('#postForm')
		var viewSeq = $("input:hidden[name=shSeq]")

		viewForm = function(seq) {
			viewSeq.attr("value", seq);
			form.attr("action", "/post/postView").submit();
		}

		goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		}

		var excelUri = "/post/excelDownload"
		$("#btnExcel").on("click", function() {

			form.attr("action", excelUri).submit();
		});
		
		searchPost = function() {
			
			form.attr("action", "/post/searchPost").submit();
		}
	</script>

</body>
</html>