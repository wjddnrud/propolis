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
	<link rel="icon" href="/resources/images/images/favicon.ico">
	<title>MyPage</title>
</head>
	<body class="is-preload">
			<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<%@include file="/resources/include/header.jsp"%>

				<!-- Main -->
				<article id="main">
					<header>
						<h2>회원 정보</h2>
					</header>
					<section class="wrapper style5">
						<div class="inner" style="width: 50%;">
							<section>
								<div class="row pb-3">
									<div class="col-6 pt-3" style="font-weight: bold; text-align: right; vertical-align: middle;">
										<img id="imgProfile" src="${img.path}${img.uuidName}" alt="이미지 없음" style="overflow: hidden; width:150px; height:150px; text-align: center; vertical-align: middle; border: 5px solid black; border-radius: 50%;">
										<br/><a href="/member/memberUserForm" class="button mt-3">정보 수정</a>
									</div>
									<div class="col-6" style="text-align: left;">
										<b>[회원 정보]</b><br/><br/>
										<b>이름: </b><c:out value="${one.name }"/><br>
										<b>ID: </b><c:out value="${one.id }"/><br>
										<c:forEach items="${listCodeGender }" var="listGender" varStatus="statusGender">
											<b>성별: </b><c:if test="${one.gender eq listGender.cc_key }"><c:out value="${listGender.cc_name }"/></c:if><br>
										</c:forEach>
										<b>직업: </b><c:out value="${one.job }"/><br>
										<b>생년월일: </b><c:out value="${one.dob }"/><br> 
										<b>주소: </b><c:out value="${one.address }"/><br>
										<%-- <b>게시글 수: </b><c:out value="${cmlist[0].MyCommunityCount }"/><br> --%>
										<!-- fn:length(리스트) 불러온 리스트의 크기를 알려준다. -->
										<b>게시글 수: </b><c:out value="${fn:length(cmlist) }"/><br>
										<b>참여 그룹 수: </b><c:out value="${fn:length(grlist) }"/><br>
									</div>
								</div>
								<div class="mt-3">
									<ul class="nav nav-tabs">
										<li class="nav-item">
											<a class="nav-link active" href="javascript:goList('cm')">게시글 관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="javascript:goList('gr')">그룹 관리</a>
										</li>
									</ul>
								</div>
								<br>
								
								<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
								<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
								<c:set var="listCodeCategory" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
								
								
								<form id="myPageForm" method="post">
									
									<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
									<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
									<input type="hidden" name="shSeq">
									<input type="hidden" id="seq" name="seq" value="">
									
								<div class="table-wrapper">
								
									<div class="lita"></div>
									
									<!-- pagination s -->
									<%@include file="/resources/include/pagination.jsp"%>
									<!-- pagination e -->
									
									<button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
									<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button>
									<button type="button" class="btn btn-success me-1" style="float: right;"><i class="fa-solid fa-file-excel"></i></button>
									
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
			<script type="text/javascript">
			
				var form = $("form[name=formList]"); // name으로 된거 사용
				// var form = $("#formList");  // id로 된거 사용
				
				var editSeq = $("input:hidden[name=shSeq]");
				/* name이 seq인 hidden type의 input을 editSeq로 정해준다. */
				
				goList = function(thisPage) {
					$("input:hidden[name=thisPage]").val(thisPage);
					form.attr("action", goUrlList).submit();
				}
				
				
				var goUrlList = "/community/communityAjaxList";					/* #-> */
				var goUrlLita = "/community/communityAjaxLita";					/* #-> */
				
				var page = 0;
				
				function setLita() {
					$.ajax({
						async: true 
						,cache: false
						,type: "post"
						/* ,dataType:"json" */
						,url: goUrlLita
						,data : $("#myPageForm").serialize()
						/* ,data : {  } */
						,success: function(response) {
							$("#lita").empty();
							$("#lita").append(response);
							window.location.hash = '#page' + page;
							page++;
						}
						,error : function(jqXHR, textStatus, errorThrown){
							alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
						}
					});
				}
				
				
			</script>
			<script>
				goPage = function(key) {
					
					var url = "";
					switch (key) {
					case 'pr':
					{
						url = "";					
					break;
					}
					case 'cm':
						{
						url = "/myPageCommunityList";		 				
						break;
						}
					case 'gr':
					{
						url = "/myPageGroupList";				
					break;
					}
					case 'dm':
					{
						url = "";					
					break;
					}
					default:
						break;
					}
					
					form.attr("action", url).submit();
				}
			</script>



</body>
</html>