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
	<title>Elements - Spectral by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript>
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</noscript>
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
								<li><a href="index.html">Home</a></li>
								<li><a href="signUp.html">SIGN UP</a></li>
								<li><a href="signIn.html">SIGN IN</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<article id="main">
			<header>
				<h2>sports Mate íìê°ì</h2>
				<p>ë©¤ë²ê° ëì´ sports mateê° ì ê³µíë ë¤ìí ì ë³´ì ì¹êµ¬ë¤ì ë§ëë³´ì¸ì.</p>
			</header>
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<!-- <h2>íìê°ì</h2> -->
						<form method="post" action="#">
							<div class="row gtr-uniform">
								<div class="col-12 col-12-xsmall">
									<label for="demo-id">ID</label>
									<input type="text" name="demo-id" id="demo-id" value="" placeholder="ìë¬¸,ì«ì 5~10ì" />
								</div>
								<div class="col-12 col-12-xsmall">
									<label for="demo-password">PASSWORD</label>
									<input type="password" name="demo-password" id="demo-password" value=""
										placeholder="ì«ì,ìë¬¸,í¹ìë¬¸ì ì¡°í© ìµì 8ì" />
									<input type="password" name="demo-passwordRe" id="demo-passwordRe" value=""
										placeholder="ë¹ë°ë²í¸ ì¬ìë ¥" style="margin-top: 10px;" />
								</div>
								<div class="col-12 col-12-xsmall">
									<label for="demo-name">ì´ë¦</label>
									<input type="text" name="demo-name" id="demo-name" value="" placeholder="" />
								</div>
								<div class="col-12">
									<label for="demo-name">ì±ë³</label>
									<select name="demo-gender" id="demo-gender">
										<option value="">- ì í -</option>
										<option value="1">ë¨ì±</option>
										<option value="2">ì¬ì±</option>
										<option value="3">ê¸°í</option>
									</select>
								</div>
								<div class="col-12 col-12-xsmall">
									<label for="demo-job">ì§ì</label>
									<input type="text" name="demo-job" id="demo-job" value="" placeholder="" />
								</div>
								<div class="col-12 col-12-xsmall">
									<label for="demo-birth">ìëìì¼</label>
									<input type="text" name="demo-birth" id="demo-birth" value=""
										placeholder="ì)19951027(ëëìì¼)" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="demo-phone">í´ëì í</label>
									<input type="text" name="demo-phone" id="demo-phone" value=""
										placeholder="'-'ìì´ ë²í¸ë§ ìë ¥í´ì£¼ì¸ì." />
									<input type="button" class="primary" value="ì¸ì¦ë²í¸ ì ì¡" style="margin-top: 10px;" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="demo-name">í´ëì í ì¸ì¦</label>
									<input type="text" name="demo-name" id="demo-name" value=""
										placeholder="ì¸ì¦ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì." />
									<input type="button" class="primary" value="íì¸" style="margin-top: 10px;" />
								</div>
								<div class="col-12 col-12-xsmall">
									<label for="demo-email">Email</label>
									<input type="text" name="demo-email" id="demo-email" value=""
										placeholder="Email@example.com" />
									<span>ê³ì  ë¶ì¤ ì ë³¸ì¸ì¸ì¦ ì ë³´ë¡ íì©ë©ëë¤.</span>
								</div>
								<div class="col-8 col-12-xsmall">
									<label for="demo-address">ì£¼ì</label>
									<input type="text" name="demo-address" id="demo-address" value="" placeholder="" />
									<input type="text" name="demo-address" id="demo-address" value="" placeholder=""
										style="margin-top: 10px;" />
								</div>
								<div class="col-4 col-12-xsmall">
									<label for="demo-address">Zip Code</label>
									<input type="text" name="demo-address" id="demo-address" value="" placeholder="" />
									<input type="button" class="primary" value="ì£¼ì ê²ì" style="margin-top: 10px;" />
								</div>
								<div class="col-12">
									<label for="demo-name">ê°ìê²½ë¡</label>
									<select name="demo-route" id="demo-route">
										<option value="">- ì í -</option>
										<option value="1">ì§ì¸ì¶ì²</option>
										<option value="1">ì¸í°ë· ê´ê³ </option>
										<option value="1">ì íë¸</option>
										<option value="1">ë¸ë¡ê·¸</option>
									</select>
								</div>
								<div class="col-12 col-12-small" style="padding-top: 80px;">
									<input type="checkbox" id="demo-allAgree" name="demo-allAgree" onclick="selectAll(this)">
									<label for="demo-allAgree">ì½ê´ ì ì²´ ëìíê¸°</label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="demo-agree1" name="demo-agree">
									<label for="demo-agree1">[íì] ê°ì¸ì ë³´ ìì§ ë° ì´ì© ëì&nbsp;<a href="#" target="_blank">ìì¸í</a></label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="demo-agree2" name="demo-agree">
									<label for="demo-agree2">[íì] SPORTS MATE ì´ì© ì½ê´ ëì&nbsp;<a href="#" target="_blank">ìì¸í</a></label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="demo-agree3" name="demo-agree">
									<label for="demo-agree3">[íì] ë§ 14ì¸ ë¯¸ë§ ê°ì ì í</label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="demo-agree4" name="demo-agree">
									<label for="demo-agree4">[ì í] ë§ì¼í íì© ë° ê´ê³ ì± ì ë³´ ìì  ëì&nbsp;<a href="#" target="_blank">ìì¸í</a></label>
								</div>
								<div class="col-12">
									<ul class="actions fit" style="padding-top: 60px;">
										<li><input type="reset" value="Reset" /></li>
										<!-- <li><input type="submit" value="Sign-up" class="primary" /></li> -->
										<li><a class="button primary" href="signIn.html">sign-up</a></li>
										<li><input type="button" value="cancle" onclick="location.href='signIn.html'" /></li>
									</ul>
								</div>
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
		</footer><div id="footers"></div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
		function selectAll(selectAll)  {
			const checkboxes 
				= document.getElementsByName("demo-agree");
			
			checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
			})
		}
	</script>
</body>

</html>