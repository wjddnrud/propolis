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
							<p>새로운 그룹에 join 해보세요!</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">

								
								<section>
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
								
									<form>
										<div class="table-wrapper">
											<table class="alt" style="pointer-events: none;">
												<tbody>
													<tr>
														<th>No</th>
														<th>작성자</th>
														<th>그룹명</th>
														<th>운동일</th>
														<th>조회수</th>
													</tr>
													<tr style="text-align: center;">
														<td style="width: 100px;"><c:out value="${one.seq }"/></td>
														<td style="width:200px;"><c:out value="${one.creator }"/></td>
														<td><c:out value="${one.group_name }"/></td>
														<td style="width:200px;"><c:out value="${one.playDate }"/></td>
														<td style="width: 100px;"><c:out value="${one.viewCount }"/></td>
													</tr>
													<tr>
														<th>운동종목</th>
														<td class="fmtd" style="text-align: center;">
														<c:forEach items="${listCodeSports}" var="listSports" varStatus="status">
															<c:if test="${one.sports eq listSports.cc_key }"><c:out value="${listSports.cc_name }"/></c:if>
														</c:forEach>
														</td>
														<td colspan="3" rowspan="5" style="text-align: center; vertical-align: middle; padding-right: 50px; padding-left: 50px;">
															<c:out value="${one.detail }"/>
														</td>
													</tr>
													<tr>
														<th>인원</th>
														<td class="fmtd" style="text-align: center;"><c:out value="${one.people_number }"/>명</td>
													</tr>
													<tr>
														<th>시작시간</th>
														<td class="fmtd" style="text-align: center;"><c:out value="${one.startTime }"/>:00</td>
													</tr>
													<tr>
														<th>종료시간</th>
														<td class="fmtd" style="text-align: center;"><c:out value="${one.endTime }"/>:00</td>
													</tr>	
													<tr>
														<th>지역</th>
														<td class="fmtd" style="text-align: center;"><c:out value="${one.location }"/></td>
													</tr>
													<tr style="height: 500px;">
														<td colspan="5">
															<p style="margin-top:-12px">
															    <em class="link">
															        <a href="/web/documentation/#MapTypeId" target="_blank">지도 타입을 보시려면 여기를 클릭하세요!</a>
															    </em>
															</p>
															<div id="map" style="width:100%;height:350px;"></div>
															<p>개발자도구를 통해 직접 확인해 보세요.</p>
														</td>
													</tr>
												</tbody>
											</table>
													
													
													
													
													
													
													
													<!-- <tr style="text-align: center;">
														<td>1</td>
														<td>dnwk301</td>
														<td>3대3 반코트 농구하실분 구해요~</td>
														<td>2022-07-29 08:13:45</td>
														<td>15</td>
													</tr>
													<tr>
														<th>운동종목</th>
														<td colspan="4" class="fmtd" >농구</td>
													</tr>
													<tr>
														<th>인원</th>
														<td colspan="4" class="fmtd">3명</td>
													</tr>
													<tr>
														<th>시작시간</th>
														<td colspan="4" class="fmtd">13:00</td>
													</tr>
													<tr>
														<th>종료시간</th>
														<td colspan="4" class="fmtd">15:00</td>
													</tr>	
													<tr>
														<th>지역</th>
														<td colspan="4" class="fmtd">부천시 원미구</td>
													</tr>
													<tr>
														<td colspan="4">	
															<div class="mapBox">
																<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.3296762520304!2d126.76537019999999!3d37.500141899999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7d3ea96c634f%3A0xba34348dc1f04dc!2z67aA7LKc7KSR7JWZ6rO17JuQ!5e0!3m2!1sko!2skr!4v1661474723176!5m2!1sko!2skr" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
															</div>
															<p style="margin-top:-12px">
															    <em class="link">
															        <a href="/web/documentation/#MapTypeId" target="_blank">지도 타입을 보시려면 여기를 클릭하세요!</a>
															    </em>
															</p>
															<div id="map" style="width:100%;height:350px;"></div>
															<p>개발자도구를 통해 직접 확인해 보세요.</p>
														</td>
													</tr>
													<tr style="height: 500px;">
														<td colspan="3" style="text-align: start; padding-left: 30px; vertical-align: middle;">
															20대 남자 3명이서 농구중인데 3대3 반코트 농구 하실분 3명 구해요~<br>
															재밌게 농구하실분 JOIN해 주세요~!!
														</td>
														<td colspan="2">
															<p style="margin-top:-12px">
															    <em class="link">
															        <a href="/web/documentation/#MapTypeId" target="_blank">지도 타입을 보시려면 여기를 클릭하세요!</a>
															    </em>
															</p>
															<div id="map" style="width:100%;height:350px;"></div>
															<p>개발자도구를 통해 직접 확인해 보세요.</p>
														</td>
													</tr>
												</tbody>
											</table> -->
											
											
	
											
	
	
											<center style="margin-left: 12%;">
												<a href="#" class="button primary">💪추천</a>
												<a href="/sportsGroup/sportsGroupList" class="button"><i class="fa-solid fa-arrow-left"></i>back</a>
												<a href="/findMateNotify" class="button primary" style="color: white; float: right;">🚨신고</a>
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