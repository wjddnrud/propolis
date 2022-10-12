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
		<title>FindMate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.2/css/fontawesome.min.css" integrity="sha384-X8QTME3FCg1DLb58++lPvsjbQoCT9bp3MsUU3grbIny/3ZwUJkRNO8NPW6zqzuW9" crossorigin="anonymous">
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
											<li><a href="/myPage">My Page</a></li>
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
							<h2>FIND MATE</h2>
							<p>함께 운동할 친구를 찾아보세요.</p>
						</header>
						<section class="wrapper style1">
							<div class="inner">



								<section>
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
									
									<form name="findMateForm">
									
										<!-- shSeq 받아서 view로 seq 넘겨줄 hidden input -->
										<input type="hidden" name="shSeq">
										
										<div class="container">   <!-- container에 카드 모양 구성 조건이 들어있어서 있어야한다. -->
										
										<c:forEach items="${list}" var="list" varStatus="statusList">
											<div class="card">
												<div class="content">
													<div class="imgBx"><img src="/resources/images/images/서핑.jpg"></div>
													<div class="contentBx">
														<c:forEach items="${listCodeSports}" var="listSports" varStatus="status">
															<c:if test="${list.sports eq listSports.cc_key }"><h3><c:out value="${listSports.cc_name }"/><br></c:if>
														</c:forEach>
														<span><c:out value="${list.group_name}"/></span></h3>
													</div>
												</div>
												<ul class="sci">
													<li style="--i:1">
														<a href="javascript:viewform(${list.seq})"><i class="fa-solid fa-magnifying-glass"></i></a>
													</li>
													<li style="--i:2">
														<a href="#"><i class="fa-regular fa-envelope"></i></a>
													</li>
													<li style="--i:3">
														<a href="#"><i class="fa-regular fa-map"></i></a>
													</li>
												</ul>
											</div>
										</c:forEach>
										</div>
									</form>
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
									<br>
									<center>
										<a href="/findMateForm" class="button primary">등록</a>
										<a href="/main" class="button" style="background-color: white; color: black;"><i class="fa-solid fa-house"></i>&nbsp;홈으로</a>
										<!-- <a href="findMateNotify.html" class="button" style="background-color: red;">🚨신고</a> -->
									</center>
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
			
			var goUrlList = "/sportsGroup/sportsGroupList";    /* # -> */
			var goUrlInst = "/sportsGroup/sportsGroupInst";    /* # -> */
			var goUrlUpdt = "/sportsGroup/sportsGroupUpdt";    /* # -> */
			var goUrlUele = "/sportsGroup/sportsGroupUele";    /* # -> */
			var goUrlDele = "/sportsGroup/sportsGroupDele";    /* # -> */	
			
			var form = $("form[name=findMateForm]");
			var viewSeq = $("input:hidden[name=shSeq]")
			
			viewform = function(seq) {
				viewSeq.attr("value", seq);
				form.attr("action", "/sportsGroup/sportsGroupView").submit();
			}
			
			
			</script>
	</body>
</html>