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
		<title>Community</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<header id="header">
					<h1><a href="/main">sports mate</a></h1>
					<nav id="nav">
						<ul>
							<li class="special">
								<a href="#menu" class="menuToggle"><span>Menu</span></a>
								<div id="menu">
									<ul>
										<c:if test="${sessSeq eq null}">   <!-- 로그인전 -->
						                	<li><a href="/signUp">SIGN UP</a></li>
											<li><a href="/signIn">SIGN IN</a></li>
							        	</c:if>
							            <c:if test="${sessSeq ne null}">   <!-- 로그인후 -->
							                <li><a href="/main">Home</a></li>
											<li><a href="/sportsGroup/sportsGroupList">Find Mate</a></li>
											<li><a href="/community/communityList">Community</a></li>
											<li><a href="/myPageCommunityList">MyPage</a></li>
											<li><a href="/logout">LOG-OUT</a></li>
										</c:if>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
				</header>

				<!-- Main -->
				<article id="main">
					<header>
						<h2>Community</h2>
						<p>관련 정보들을 멤버들과 공유해보세요.</p>
					</header>
					<section class="wrapper style5">
						<div class="inner">

							
							<section>
								<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
								<c:set var="listCodeCategory" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
								
								<form name="communityForm" id="communityForm">
								
									<!-- shSeq 받아서 view로 seq 넘겨줄 hidden input -->
									<input type="hidden" name="shSeq">
									<!-- <input type="hidden" name="mainKey"> -->
									<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
									<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
									
									
									<div class="table-wrapper">
										<table class="alt">
											<thead>
												<tr>
													<th>No</th>
													<th>카테고리</th>
													<th>제목</th>
													<th>작성자</th>
													<!-- <th>조회수</th> -->
													<th>작성일자</th>
												</tr>
											</thead>
											<tbody>
											
											
												<c:forEach items="${list}" var="list" varStatus="statusList">
													<tr onclick="viewForm('${list.seq}')">
														<td style="text-align: center;"><c:out value="${list.seq }"/></td>
														<td style="text-align: center;">
															<c:forEach items="${listCodeCategory}" var="listCategory" varStatus="statusCategory">
																<c:if test="${list.category eq listCategory.cc_key}"><c:out value="${listCategory.cc_name }"/></c:if>
															</c:forEach>
														</td>
														<%-- <td><c:out value="${list.category }"></c:out></td> --%>
														<td><c:out value="${list.title }"></c:out></td>
														<td style="text-align: center;"><c:out value="${list.writer }"></c:out></td>
														<%-- <td style="text-align: center;"><c:out value="${list.viewCount }"></c:out></td> --%>
														<td style="text-align: center;"><c:out value="${list.createDate }"></c:out></td>
													</tr>
												</c:forEach>
												
												
											</tbody>
										</table>
										
										<!-- pagination  -->
										<%@include file="../../common/pagination.jsp"%>
										
										<br>
										<center>
											<a href="/communityForm" class="button primary">작성</a>
											<a href="/main" class="button"><i class="fa-solid fa-house"></i>&nbsp;홈으로</a>
											<!-- <a href="boardNotify.html" class="button" style="background-color: red; color: white;">🚨신고</a> -->
										</center>
									</div>
								</form>
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
			<script type="text/javascript">
			
				var goUrlList = "/community/communityList";    /* # -> */
				var goUrlInst = "/community/communityInst";    /* # -> */
				var goUrlUpdt = "/community/communityUpdt";    /* # -> */
				var goUrlUele = "/community/communityUele";    /* # -> */
				var goUrlDele = "/community/communityDele";    /* # -> */		
			
				var form = $('#communityForm')
				var viewSeq = $("input:hidden[name=shSeq]")
				
				viewForm = function(seq) {
					viewSeq.attr("value", seq);
					form.attr("action", "/community/communityView").submit();
				}
				
				goList = function(thisPage) {
					$("input:hidden[name=thisPage]").val(thisPage);
					form.attr("action", goUrlList).submit();
				}
		
			
			</script>

	</body>
</html>