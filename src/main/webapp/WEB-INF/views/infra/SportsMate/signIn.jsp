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
		<title>SingIn</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
    	<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/"> -->
	</head>
	<body class="sign is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header 상단 고정 네비바 -->
				<header id="header" class="alt">
					<h1><a href="/signIn">Sports Mate</a></h1>
					<nav id="nav">
						<ul>
							<li class="special">
								<a href="#menu" class="menuToggle"><span>Menu</span></a>
								<div id="menu">
									<ul>
										<li><a href="/signUp">SIGN UP</a></li>
										<li><a href="/signIn">SIGN IN</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
				</header>

				<!-- Banner 메인화면 처음 모션부분 -->
				<!-- <section id="banner"> -->
				<form action="/main" id="loginForm">
					<section id="banner">
						<div class="inner">
							<h2>Sports Mate</h2>
							<p>만나서 반갑습니다!<br /></p>
							<section class="wrapper style6">
								<div class="inner">
									<section>
										<div class="row gtr-uniform">
											<div class="col-12">
												<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
											</div>
											<div class="col-12 col-12-xsmall">
												<center>
													<input id="login_id" type="text" placeholder="ID" style="width: 300px;">
												</center>
											</div>
											<div class="col-12 col-12-xsmall">
												<center>
													<input id="login_password" type="password" placeholder="PASSWORD" style="width: 300px;">
												</center>
											</div>
											<div class="col-6 col-12">
												<input type="checkbox" id="demo-human" name="demo-human">
												<label for="demo-human">Remember</label>
											</div>
											<div class="col-12">
												<ul class="actions stacked">
													<li><input type="button" value="Sign-in" class="button primary small" onclick="login();"></li>
													<li><input type="button" class="button small" value="Sign-up" onclick="location.href='/signUp'" style="background-color: aliceblue;"></li>
												</ul>
											</div>
										</div>
									</section>
								</div>
							</section>
						</div>
					</section>
				</form>

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
			<script type="text/javascript">
				function login() {
					
					if(document.getElementById('login_id').value == '' || document.getElementById('login_id').value == null) {
						alert("아이디를 입력해주세요.");
						
						document.getElementById("login_id").value="";
						document.getElementById("login_id").focus();
						
						return false;
					}
					
					if(document.getElementById('login_password').value == '' || document.getElementById('login_password').value == null) {
						alert("비밀번호를 입력해주세요.");
						
						document.getElementById("login_password").value="";
						document.getElementById("login_password").focus();
						
						return false;
					}
					
					$('#loginForm').submit();
				}
				
			</script>
	</body>
</html>