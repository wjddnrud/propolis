<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>CommunityView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
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
											<li><a href="/findMate">Find Mate</a></li>
											<li><a href="/community">Community</a></li>
											<li><a href="/myPage">MyPage</a></li>
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
									<div class="table-wrapper">
										<table class="alt" style="pointer-events: none;">
											<tbody>
												<tr>
													<th>카테고리</th>
													<th>작성자</th>
													<th style="width: 600px;">제목</th>
													<th>작성일자</th>
													<th>조회수</th>
												</tr>
												<tr style="">
													<td>FOOD</td>
													<td>dnwk101</td>
													<td>먹는것 식단 질문 드려요</td>
													<td>2022-07-29 08:13:45</td>
													<td>15</td>
												</tr>
												<tr style="height: 500px;">
													<td colspan="5" style="text-align: start; vertical-align: middle; padding-left: 30px;">아침 일반식<br>
														점심전 11시 삶은계란5알<br>
														점심 12시30분 하림닭가슴살 110g 햇반 200g 샐러드<br>
														저녁 5시 하림 닭가슴살 110g 오뚜기밥 300g 샐러드<br>
														9시 퇴근후 9시30분일반식<br>
														웨이트는 10시넘어서 1시간~1시간 30분 후<br>
														보충제와 식빵 한조각 먹습니다<br>
														전에식단 먹다가 근무 시간도 바뀌고 볶음밥이 질려서 바꿔봤습니다<br>
														목적은 체중증가입니다<br>
														중간중간 텀이있는데 위트빅스로 2-3조각씩 채우면 될까요?</td>
												</tr>
											</tbody>
										</table>
										<center style="margin-left: 12%;">
											<a href="#" class="button primary">💪추천</a>
											<a href="/community" class="button"><i class="fa-solid fa-arrow-left"></i>&nbsp;back</a>
											<a href="/communityNotify" class="button" style="background-color: rgb(255, 0, 0); color: white; float: right;">🚨신고</a>
										</center>
									</div>
								</section>
<!-- 
								<div class="pagination">
									<ul class="pagination">
										<li><a href="#">처음 페이지</a></li>
										<li><a href="#"><</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">></a></li>
										<li><a href="#">마지막 페이지</a></li>
									</ul>
								</div> -->



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