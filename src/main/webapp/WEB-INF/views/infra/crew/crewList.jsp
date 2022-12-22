<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.woo.infra.modules.code.CodeServiceImpl"/>


<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Crew</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.2/css/fontawesome.min.css" integrity="sha384-X8QTME3FCg1DLb58++lPvsjbQoCT9bp3MsUU3grbIny/3ZwUJkRNO8NPW6zqzuW9" crossorigin="anonymous">
		<link rel="icon" href="/resources/images/images/favicon.ico">
	</head>
	
	<body class="is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<%@include file="/resources/include/header.jsp"%>

				<!-- Main -->
					<article id="main">
						<header>
							<h2>FIND MATE</h2>
							<p>함께 운동할 친구를 찾아보세요.</p>
						</header>
						<section class="wrapper style1">
							<div class="inner">



								<section>
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
									
									
									<form name="crewForm">
									
										<!-- seq 받아서 view로 seq 넘겨줄 hidden input -->
										<input type="hidden" name="seq">
										<!-- <input type="hidden" name="mainKey"> -->
										<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
										<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
										<input type="hidden" id="mmSeq" name="mmSeq" value="${sessSeq }"> 
										
										
										<div class="row">
											<div class="col d-flex justify-content-center">
												<select class="form-select form-control text-center p-0" id="shSports" name="shSports" style="width:200px; color: white;" onchange="sports()">
													<option value="">운동종목</option>
													<c:forEach items="${listCodeSports}" var="listSports" varStatus="statusList">
														<%-- <option id="sports${listSports.cc_key}" name="sports${listSports.cc_key}" onclick="sports(${listSports.cc_key})" value="${listSports.cc_key}" <c:if test="${vo.shSports eq listSports.cc_key }" >selected</c:if>><c:out value="${listSports.cc_name }"/></option> --%>
														<option id="sports${listSports.cc_key}" name="sports${listSports.cc_key}" value="${listSports.cc_key}"><c:out value="${listSports.cc_name }"/></option>
													</c:forEach>
												</select>
											</div>
										</div>
										
										<div class="container" id="crewCard">   <!-- container에 카드 모양 구성 조건이 들어있어서 있어야한다. -->
											<c:forEach items="${list}" var="list" varStatus="statusList">
												<a href="javascript:viewform(${list.seq})">
													<div class="card">
														<div class="content">
															<c:choose>
																<c:when test="${list.path eq null}">
																	<div class="imgBx"><img src="/resources/uploaded/crew/basicImg.jpg"></div>
																</c:when>
																<c:otherwise>
																	<div class="imgBx"><img src="${list.path}${list.uuidName}"></div>
																</c:otherwise>
															</c:choose>
															<div class="contentBx">
																<c:forEach items="${listCodeSports}" var="listSports" varStatus="status">
																	<c:if test="${list.sports eq listSports.cc_key }"><h3><c:out value="${listSports.cc_name }"/><br></c:if>
																</c:forEach>
																<span><c:out value="${list.crewName}"/></span></h3>
															</div>
														</div>
														<%-- <ul class="sci">
															<li style="--i:1">
																<a href="javascript:viewform(${list.seq})"><i class="fa-solid fa-magnifying-glass"></i></a>
															</li>
															<li style="--i:2">
																<a href="#"><i class="fa-regular fa-envelope"></i></a>
															</li>
														</ul> --%>
													</div>
												</a>
											</c:forEach>
										</div>
									</form>
									
									<!-- pagination  -->
									<%@include file="/resources/include/pagination.jsp"%>
									
									<br>
									<center>
										<a href="/main" class="button" style="background-color: white; color: black; margin-left: 10px;"><i class="fa-solid fa-house"></i>홈으로</a>
										<a href="/crew/crewForm" class="button primary">등록</a>
										<!-- <a href="findMateNotify.html" class="button" style="background-color: red;">🚨신고</a> -->
									</center>
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
			<script type="text/javascript">
			
			var goUrlList = "/crew/crewList";    /* # -> */
			var goUrlInst = "/crew/crewInst";    /* # -> */
			var goUrlUpdt = "/crew/crewUpdt";    /* # -> */
			var goUrlUele = "/crew/crewUele";    /* # -> */
			var goUrlDele = "/crew/crewDele";    /* # -> */	
			
			var form = $("form[name=crewForm]");
			var viewSeq = $("input:hidden[name=seq]");
			
			viewform = function(seq) {
				viewSeq.attr("value", seq);
				form.attr("action", "/crew/crewView").submit();
			};
			
			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				form.attr("action", goUrlList).submit();
			};
			
			/* 운동종목으로 리스트 분류 구현 */
			
			sports = function() {
				
				/* select태그에 선택된 옵션 선언 */
				var selectedElement = $("#shSports");
				
				/* 선택한 option의 value, 텍스트, 선택된 위치 선언 */
				var optionVal = $("#shSports option:selected").val();
				var optionTxt = $("#shSports option:selected").text();
				var index = $("#shSports option").index($("#shSports option:selected"));
				
				/* option 클릭시 status alert */
				/* alert("value : " + optionVal + ", " + "txt : " + optionTxt + ", " + "index : " + index); */
				
				$.ajax({
					url: '/crew/ajaxCrewList'
					,type: 'POST'
					,datatyp: 'json'
					,data: {
						shSports: optionVal
					}
					,success: function(result) {
						
						if(result.list != null) {
							
							/* alert("분류 기능 구현중입니다..."); */
							
							var txt = "";
							
							/* 카드 반복 생성 */
							for(var i = 0; i < result.list.length; i++) {
								
								var basicImg = "/resources/uploaded/crew/basicImg.jpg";
								
								if(result.list[i].path != null) {
									
									basicImg = result.list[i].path + result.list[i].uuidName;
								}
									
									txt += '<div id="card">'
									txt += '<a href="javascript:viewform(' + result.list[i].seq + ')">'
									txt += '<div class="card">'
									txt += '<div class="content">'
									txt += '<div class="imgBx"><img src="'+ basicImg +'"></div>'
									txt += '<div class="contentBx">'
									txt += '<h3>' + result.list[i].sports + '<br>'
									txt += '<span>'+ result.list[i].crewName+'</span></h3>'
									txt += '</div>'
									txt += '</div>'
									txt += '</div>'
									txt += '</a>'
									txt += '</div>'
								
							}
							
								/* 새로 불러온 리스트를 html로 덮어주기 */
								$("#crewCard").html(txt);
							
						}
						
					}
					,error: function() {
						alert("ajax error....!");
					}
				});
				
				
				
			}
			
			</script>
	</body>
</html>