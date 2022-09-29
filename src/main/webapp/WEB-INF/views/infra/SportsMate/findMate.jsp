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
							<h2>FIND MATE</h2>
							<p>함께 운동할 친구를 찾아보세요.</p>
						</header>
						<section class="wrapper style1">
							<div class="inner">



								<section>
									<div class="container">
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/서핑.jpg"></div>
												<div class="contentBx">
													<h3>서핑<br><span>함께 서핑해요@</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/바다러닝.jpg"></div>
												<div class="contentBx">
													<h3>러닝<br><span>아침 러닝 같이해요!!</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/친구 농구2.jpg"></div>
												<div class="contentBx">
													<h3>농구<br><span>3대3 반코트 농구하실분 구해요~</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="/findMateView"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/계단 러닝.jpg"></div>
												<div class="contentBx">
													<h3>러닝<br><span>공원 러닝 메이트 구해요~^^</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/바이셉컬.jpg"></div>
												<div class="contentBx">
													<h3>웨이트 트레이닝<br><span>헬스 메이트 구합니다!</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/사이클.jpg"></div>
												<div class="contentBx">
													<h3>사이클<br><span>#윈드브레이커#</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/요가.jpg"></div>
												<div class="contentBx">
													<h3>필라테스<br><span>@필라테스 회원 모집중@</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/러닝머신.jpg"></div>
												<div class="contentBx">
													<h3>러닝<br><span>10kg감량 함께해요!!!!!</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/아이 배드민턴.jpg"></div>
												<div class="contentBx">
													<h3>배드민턴<br><span>배드민턴 2대2</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/나이키2.jpg"></div>
												<div class="contentBx">
													<h3>농구<br><span>@고등학교 농구 대항전@</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/여자 웨이트.jpg"></div>
												<div class="contentBx">
													<h3>웨이트 트레이닝<br><span>함께 할 메이트 구해요!!</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
										<div class="card">
											<div class="content">
												<div class="imgBx"><img src="/resources/images/images/푸쉬업.jpg"></div>
												<div class="contentBx">
													<h3>웨이트 트레이닝<br><span>헬린이 모여라!!</span></h3>
												</div>
											</div>
											<ul class="sci">
												<li style="--i:1">
													<a href="#"><i class="fa-regular fa-envelope"></i></a>
												</li>
												<li style="--i:2">
													<a href="#"><i class="fa-regular fa-eye"></i></a>
												</li>
												<li style="--i:3">
													<a href="#"><i class="fa-regular fa-map"></i></a>
												</li>
											</ul>
										</div>
									</div>
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
	</body>
</html>