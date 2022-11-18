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
		<title>FindMateView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		
		<style type="text/css">
			div {
				/* border: solid red 1px; */
			}
			/* p {
				margin-bottom: 0;
			} */
		</style>
		<style type="text/css">
			@font-face {
			    font-family: 'GmarketSansMedium';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			.container{
				font-family: 'GmarketSansMedium';
			}
		</style>
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
						<h2>findMate</h2>
						<p>새로운 그룹에 join 해보세요!</p>
					</header>
					<section class="wrapper style5">
						<div class="inner" style="width: 90%;">
							<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
							<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
							<form name="viewForm"> 
								<center>
								<div class="container mb-5" style="width: 70%;">
									<div class="row" style="text-align: center;">
										<!-- 지도 부분 -->
										<div class="col-6">
											<div id="map" style="width: 100%; height: 100%;"></div>
										</div>
										<!-- 프로필 부분 -->
										<div class="col-6" style="padding-left: 100px;">
											<div class="row justify-content-center mb-3">
												<div class="col">
													<h3 class="mb-2 text-center"><b style="color: #6b33ed;"><c:out value="${one.group_name }"/></b></h3>
												</div>
											</div>
											<div class="row justify-content-center mb-5">
												<img src="${one.path}${one.uuidName}" style="width: 100px; height: 100px; border-radius: 50%; padding: 0;">
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>작성자 ID</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.creator }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>운동종목</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.sports }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>모집인원</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.people_number }"/>명</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>운동장소</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.location }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>운동일</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.playDate }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>시작시간</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.startTime }"/>시</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>종료시간</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.endTime }"/>시</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-3 text-start">
													<span><b>그룹설명</b></span>
												</div>
												<div class="col-9 text-start">
													<span><c:out value="${one.detail }"/></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								</center>
								<center>
									<a id="join" class="button primary">🤝JOIN</a>
									<a href="/sportsGroup/sportsGroupList" class="button"><i class="fa-solid fa-arrow-left"></i>back</a>
									<!-- <a href="/findMateNotify" class="button primary" style="float: right;">🚨신고</a> -->
								</center>
							</form>
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
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries"></script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    <!-- alert창 꾸미기 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707"></script>
			<script>
				var form = $("form[name=viewForm]");
			
				$("#join").on("click", function() {
					swal("Join 완료!", "마이페이지에서 join 정보를 확인하세요.", "success")
					.then(function() {
						form.attr("action", "/myPageGroupList").submit();	
					});
				});
			
				/* 지도부분 */
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			</script>
	</body>
</html>