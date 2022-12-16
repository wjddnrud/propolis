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
		<title>CrewView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<link rel="icon" href="/resources/images/images/favicon.ico">
		
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
			
			#partName:hover {
				background: black;
			}
		</style>
	</head>
	<body class="is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<%@include file="/resources/include/header.jsp"%>

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
							<form name="crewForm">
							 
								<input type="hidden" id="cuMember" name="cuMember" value="${one.creator }">
								<input type="hidden" id="seq" name="seq" value="${one.seq }">
								<input type="hidden" id="crLeaderNy" name="crLeaderNy" value="0">
								<input type="hidden" id="mmSeq" name="mmSeq" value="${sessSeq }">
								<input type="hidden" id="poAddress" name="poAddress" value="${one.location }">
								<%-- <input type="hidden" id="partSeq" name="partSeq" value="${part.seq }"> --%>
								
								<center>
								<div class="container mb-5" style="width: 70%;">
									<div class="row" style="text-align: center; width: 100%;">
										<!-- 지도 부분 -->
										<div class="col-6">
											<div id="map" style="width: 100%; height: 100%;"></div>
										</div>
										<!-- 프로필 부분 -->
										<div class="col-6" style="padding-left: 100px;">
											<div class="row justify-content-center mb-3">
												<div class="col">
													<h3 class="mb-2 text-center"><b style="color: #6b33ed;"><c:out value="${one.crewName }"/></b></h3>
												</div>
											</div>
											<div class="row justify-content-center mb-5">
												<img src="${one.path}${one.uuidName}" style="width: 100px; height: 100px; border-radius: 50%; padding: 0;">
												<div class="col">
													<c:forEach items="${crMember}" var="crMember">
														<span id="crMemberName" onclick="crMember(${crMember.seq})" style="cursor: pointer; margin-bottom: 10px; hieght: 100px;">참여자 : <c:out value="${crMember.id}"/></span><br>
													</c:forEach>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>크루리더</b></span>
												</div>
												<div class="col-8 text-start">
													<span onclick="crMember(${one.creator})" style="cursor: pointer; color: gold;"><c:out value="${one.id }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>운동종목</b></span>
												</div>
												<div class="col-8 text-start">
													<span>
													<c:forEach items="${listCodeSports}" var="list" varStatus="statusSports">
														<c:if test="${one.sports eq list.cc_key }"><c:out value="${list.cc_name }"/></c:if>
													</c:forEach>
													</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>모집인원</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.crewMemberNum }"/>명</span> 
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>현재인원</b></span>
												</div>
												<div class="col-8 text-start">
													<c:choose>
														<c:when test="${one.crmmCount eq one.crewMemberNum}">
															<span style="color: #FAB150;">모집완료!</span>
														</c:when>
														<c:otherwise>
															<span><c:out value="${one.crmmCount }"/>명</span>
														</c:otherwise>
													</c:choose> 
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>운동장소</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.location }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>운동일</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.playDate }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>시작시간</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.startTime }"/>시</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>종료시간</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.endTime }"/>시</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>그룹설명</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.detail }"/></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								</center>
								<center>
									<a id="join" class="button primary">🤝JOIN</a> 
									<a href="/crew/crewList" class="button"><i class="fa-solid fa-arrow-left"></i>back</a>
									<a href="javascript:message()" class="button"><i class="fa-regular fa-envelope"></i>message</a>
									<!-- <a href="/findMateNotify" class="button primary" style="float: right;">🚨신고</a> -->
								</center>
							</form>
						</div>
					</section>
				</article>


				<!-- Footer -->
				<%@include file="/resources/include/footer.jsp"%>

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
			
			<!-- 카카오 지도 script 라이브러리 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries=services,clusterer,drawing"></script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    <!-- alert창 꾸미기 -->
			<script>
				var form = $("form[name=crewForm]");
			
				$("#join").on("click", function() {
					swal("Join 완료!", "마이페이지에서 join 정보를 확인하세요.", "success")
					.then(function() {
						form.attr("action", "/crew/crewMemberInst").submit();	
					});
				});
			
				message = function(){
					form.attr("action", "/chat/").submit();
				}
				
				crMember = function(seq) {
					$("#seq").val(seq);
					form.attr("action", "/myPagePostList").submit();
				}
			</script>
			<script>
				/* 카카오 지도 */ 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 4 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
				
				var address = $("#poAddress").val();
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				geocoder.addressSearch(address, function(result, status) {
					
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				    
				     var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: coords, // 마커를 표시할 위치
					        image : markerImage // 마커 이미지 
					    });
				});
				
			</script>
	</body>
</html>