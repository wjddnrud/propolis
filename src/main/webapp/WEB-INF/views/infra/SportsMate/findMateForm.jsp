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
		<title>FindMateForm</title>
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
							<h2>findMate</h2>
							<p>새로운 그룹을 만들어 mate를 모집하세요.</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">

								

								<section>
									<form method="post">
										<div class="row gtr-uniform">
											<div class="col-4 col-12-xsmall">
											
											<select name="sports">
												<c:foreach items="list" var="list" varStatus="statusList">
													<option value="${list.sports }" <c:if test="${one.sports eq list.sports }"
												</c:foreach>
											</select>
												<select>
													<option value="">- 운동 종목 -</option>
													<option value="1">러닝</option>
													<option value="1">웨이트 트레이닝</option>
													<option value="1">농구</option>
													<option value="1">축구</option>
													<option value="1">야구</option>
													<option value="1">배드민턴</option>
													<option value="1">요가</option>
													<option value="1">필라테스</option>
													<option value="1">서핑</option>
													<option value="1">직접입력</option>
												</select>
											</div>
											<div class="col-8 col-12-xsmall">
												<input type="text" value="" placeholder="그룹명을 입력해주세요.">
											</div>
											<div class="col-12 col-12-xsmall filebox">
												<input class="upload-name" value="" placeholder="운동장소">
												<label for="file" style="margin: 0; padding-top: 5px; background-color: rgb(240, 240, 240); color: rgb(100, 100, 100);">주소검색</label>
												<input type="file" id="file">
											</div>
											<div class="col-3 col-12-xsmall">
												<input type="text" placeholder="시작시간 (00:00)" />
											</div>
											<div class="col-3 col-12-xsmall">
												<input type="text" placeholder="종료시간 (00:00)" />
											</div>
											<div class="col-3 col-12-xsmall">
												<input type="text" placeholder="지역 (xx시 xx구)" />
											</div>
											<div class="col-3 col-12-xsmall">
												<input type="text" placeholder="인원 (명)" />
											</div>
											<div class="col-12">
												<textarea placeholder="여기에 그룹의 자세한 내용을 입력해주세요." rows="15"></textarea>
											</div>
											<div class="col-12">
												<ul class="actions" style="justify-content: center;">
													<li><input type="reset" value="Reset"></li>
													<li><a href="/sportsGroup/sportsGroupList" class="button primary">Sign-up</a></li>
													<!-- <li><button type="submit" class="button primary">Sign-up(제출)</button></li> -->
													<li><a href="/sportsGroup/sportsGroupList" class="button">Cancle</a></li>
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

			<script>	
				$("#file").on('change',function(){
					var fileName = $("#file").val();
					$(".upload-name").val(fileName);
				});
			</script>
			

	</body>
</html>