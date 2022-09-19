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
		<title>Sports Mate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
	</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header 상단 고정 네비바 -->
				<header id="header">
					<h1><a href="/main">sports mate</a></h1>
					<nav id="nav">
						<ul>
							<li class="special">
								<a href="#menu" class="menuToggle"><span>Menu</span></a>
								<div id="menu">
									<ul>
										<li><a href="/main">Home</a></li>
										<li><a href="/findMate">Find Mate</a></li>
										<li><a href="/community">Community</a></li>
										<li><a href="/signIn">LOG-OUT</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
				</header>

				<!-- Banner 메인화면 처음 모션부분 -->
					<section id="banner">
						<div class="inner">
							<h2>Sports Mate</h2>
							<p>방문해주셔서 감사합니다!<br /><br />
							함께 운동할 친구를 찾아보세요.<br /></p>
							<!-- crafted by <a href="http://html5up.net">HTML5 UP</a>.</p> -->
							<ul class="actions special">
								<li><a href="/findMate" class="button primary">Find Mate</a></li>
							</ul>
						</div>
						<a href="#one" class="more scrolly">Learn More</a>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style1 special">
						<div class="inner">
							<header class="major">
								<h2>게시판을 통해 정보를 공유해 보세요.</h2>
								<p>다양한 카테고리별로 유익한 정보를 함께 공유하실수 있습니다.<br>
								</p>
								<a href="/community" class="button primary">Community</a>
							</header>
						</div>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper alt style2">
						<section class="spotlight">
							<div class="image"><img src="/resources/images/images/요가.jpg" alt="" /></div><div class="content">
								<h2>diet<br>
								loose your weight</h2>
								<p>NEW 17</p>
								<p>TOTAL 253</p>
								<!-- <button type="button" class="btn btn-outline-dark" href="#" style="border-radius: 0;">detail</button> -->
							</div>
						</section>
						<section class="spotlight">
							<div class="image"><img src="/resources/images/images/웨이트.jpg" alt="" /></div><div class="content">
								<h2>weight<br>
								grow up your muscle</h2>
								<p>NEW 8</p>
								<p>TOTAL 164</p>
								<!-- <button type="button" class="btn btn-outline-dark" href="#" style="border-radius: 0;">detail</button> -->
							</div>
						</section>
						<section class="spotlight">
							<div class="image"><img src="/resources/images/images/food1.jpg" alt="" /></div><div class="content">
								<h2>food<br>
								healthy menu & recipe</h2>
								<p>NEW 11</p>
								<p>TOTAL 79</p>
								<!-- <button type="button" class="btn btn-outline-dark" href="#" style="border-radius: 0;">detail</button> -->
							</div>
						</section>
					</section>

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
		<!-- 폰트어썸 -->
			<script src="https://kit.fontawesome.com/f92c8dde3d.js" crossorigin="anonymous"></script>

	</body>
</html>