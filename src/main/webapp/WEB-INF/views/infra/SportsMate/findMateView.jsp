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
							<div class="inner">
								<section>
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
								
									<form>
										<div class="row">
											<div class="col-6" style="text-align: center;">
												<span><b><c:out value="${one.group_name }"/></b></span>
												<div classs="row">
													<div class="col-6" style="clear: both;">
														<img src="../../../../resources/images/images/noprofil.jpg" width=150px height=150px style="border: 2px solid white; border-radius: 50%;"><br>
														<div class="imgBx"><img src="${list.path}${list.uuidName}"></div>
													</div>
													<div class="col-6" style="float: right;">
														<ul class="sci">
															<li style="--i:1">
																<a href="#"><i class="fa-solid fa-user"></i></a>
															</li>
															<li style="--i:2">
																<a href="#"><i class="fa-regular fa-envelope"></i></a>
															</li>
															<li style="--i:3">
																<a href="#"><i class="fa-regular fa-comments"></i></a>
															</li>
														</ul>
													</div>
												</div>
												<div class="row" style="text-align: start;">
														<p><b>작성자 ID </b> <c:out value="${one.creator }"/></p><br>
														<p><b>운동종목 </b>
														<c:forEach items="${listCodeSports}" var="listSports" varStatus="status">
															<c:if test="${one.sports eq listSports.cc_key }"><c:out value="${listSports.cc_name }"/></c:if>
														</c:forEach></p><br>
														<p><b>모집인원 </b> <c:out value="${one.people_number }"></c:out></p><br>
														<p><b>운동일 </b> <c:out value="${one.playDate }"/></p><br>
														<p><b>시작시간 </b> <c:out value="${one.startTime }"></c:out></p><br>
														<p><b>종료시간 </b> <c:out value="${one.endTime }"></c:out></p><br>
												</div>
												<hr>
												<div class="row" style="text-align: start;">
													<p style="font-weight: bold;">그룹 설명</p>
													<p><c:out value="${one.detail }"/></p>
												</div>
											</div>
											<div class="col col-6">
												<p style="margin-bottom: 0;"><b>운동 위치 : </b> 경기도 부천시 원미구 부천 중앙공원</p>
												<div id="map" style="width:100%; height: 70%;"></div>
											</div>
										</div>
										<center style="margin-left: 12%; margin-top: 30px;">
											<a href="#" class="button primary">🤝JOIN</a>
											<a href="/sportsGroup/sportsGroupList" class="button"><i class="fa-solid fa-arrow-left"></i>back</a>
											<a href="/findMateNotify" class="button primary" style="float: right;">🚨신고</a>
										</center>
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
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries"></script>
			<script>
			
			
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();
				
				// 지도 타입 컨트롤을 지도에 표시합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				var geocoder = new kakao.maps.services.Geocoder();

				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				    }
				};

				geocoder.addressSearch('해남군 송지면', callback);
				
			</script>
	</body>
</html>