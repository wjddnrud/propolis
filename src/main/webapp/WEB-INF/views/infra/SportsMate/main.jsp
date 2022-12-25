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
<!-- 		<link rel="icon" href="/resources/images/images/favicon.ico"> -->
		
		<style type="text/css">
			.graphBox{
				posiotion:relative;
				width:100%;
				display:grid;
				grid-template-columns: 1fr 2fr;
				grid-gap:30px;
				min-height: 200px;
			}
			
			.graphBox .box{ 
				position:relative;
				background: #fff;
				padding:20px;
				width:100%;
				box-shadow: 0 7px 25px rgba(0,0,0,0.08);
				border-radius: 20px;
			}
		</style>
	</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header 상단 고정 네비바 -->
				<%@include file="/resources/include/header.jsp"%>

				<!-- Banner 메인화면 처음 모션부분 -->
				<form name="mainForm">
					<section id="banner">
						<div class="inner">
							<h2>Sports Mate</h2>
							<p><b>[<c:out value="${sessId }" />]</b> 회원님 방문해주셔서 감사합니다!</p>
							<div class="row" style="margin-top: 150px;"> 
								<div class="col col-6">
									<p>함께 운동할 친구를 찾아보세요.<br /></p>
									<!-- crafted by <a href="http://html5up.net">HTML5 UP</a>.</p> -->
									<ul class="actions special">
										<li><a href="/crew/crewList" class="button primary">Find Mate</a></li>
									</ul>
								</div>
								<div class="col col-6">
									<p>멤버들과 정보를 공유해보세요.<br /></p>
									<!-- crafted by <a href="http://html5up.net">HTML5 UP</a>.</p> -->
									<ul class="actions special">
										<li><a href="/post/postList" class="button primary">Community</a></li>
									</ul>
								</div>
							</div>
						</div>
						<a href="#one" class="more scrolly">Learn More</a>
					</section>

				<!-- One -->
					<section id="one" class="wrapper style1 special" style="padding-top: 50px; padding-bottom: 50px;">
						<div class="inner" style="width: 1100px;">
							<div class="container">
								<div class="row">
									<div class="col">
										<span style="font-size: 50pt; color: white;">통계현황</span>
									</div>
								</div>
								<div class="row d-flex" style="justify-content:space-between; align-items:center; padding-right: 10px; width: 100%;">
									<div class="col-4" style="margin-bottom: 30px;">
								        <div class="row" style="width:250px; height:150px; border:none; border-radius:10px; background: #6b33ed; margin: 25px;">
								            <div class="col-8" style="padding-top:36px; padding-left: 30px;">
								                <div class="row"> 
								                    <span style="font-size:26pt; font-weight:bold; color: white;"><c:out value="${memberCount }"></c:out></span>
								                </div>
								                <div class="row">
								                    <span style="color: white; font-size:12pt; font-weight:500; padding-left:15px; padding-top: 10px;">회원수</span>   
								                </div>
								            </div>
								            <div class="col text-center" style="padding-top:50px;">
								                <i style="color:#101010; font-size:36pt; margin-top:auto;" class="fa-solid fa-user"></i> 
								            </div>
								        </div>
								        <div class="row" style="width:250px; height:150px; border:none; border-radius:10px; background: #6b33ed; margin-left: 25px;ss">
								            <div class="col-7" style="padding-top:36px; padding-left: 30px;">
								                <div class="row"> 
								                    <span style="font-size:26pt; font-weight:bold; color: white;"><c:out value="${postCount }"></c:out></span>
								                </div>
								                <div class="row">
								                    <span style="color: white; font-size:12pt; font-weight:500; padding-left:15px; padding-top: 10px;">게시물 수</span>   
								                </div>
								            </div> 
								            <div class="col text-center" style="padding-top:50px;">
								                <i style="color:#101010; font-size:36pt; margin-top:auto;" class="fa-regular fa-pen-to-square"></i>
								            </div>
								        </div>
									</div>			
									<div class="col-8">
										<div class="row mt-4">
								        	<div class="graphBox" style="padding-left: 0px; padding-right: 0px;">
								        		<div class="box">
								        			<canvas id="myChart"></canvas> 
								        		</div>
								        		<div class="box">	        			
								        			<canvas id="myChart2" style="height: 100%; width: 300px; "></canvas> 
								        		</div>
								        	</div>
								        </div>
									</div>	
								</div>
							</div>
							<!-- <header class="major">
								<h2>게시판을 통해 정보를 공유해 보세요.</h2>
								<p>다양한 카테고리별로 유익한 정보를 함께 공유하실수 있습니다.<br>
								</p>
								<a href="/post/postList" class="button primary">Community</a>
							</header> -->
						</div>
					</section>

				<!-- Two -->
					<section id="two" class="wrapper alt style2">
						<section class="spotlight">
							<div class="image">
								<a href="/post/postList"><img src="/resources/images/images/요가.jpg" alt="" /></a>
							</div>
							<div class="content">
								<h2>[diet]<br>
								loose your weight</h2>
								<c:choose>
									<c:when test="${dietCountNew eq null || dietCountNew eq 0}">
									</c:when>
									<c:otherwise>
										<p style="color: red;">새 게시물 +<c:out value="${dietCountNew}"/></p>
									</c:otherwise>
								</c:choose>
								<p>총 게시물 <c:out value="${dietCount}" /></p>
								<!-- <button type="button" class="btn btn-outline-dark" href="#" style="border-radius: 0;">detail</button> -->
							</div>
						</section>
						<section class="spotlight">
							<div class="image">
								<a href="/post/postList"><img src="/resources/images/images/웨이트.jpg" alt="" /></a>
							</div>
							<div class="content">
								<h2>[weight]<br>
								grow up your muscle</h2>
								<c:choose>
									<c:when test="${weightCountNew eq null || weightCountNew eq 0}">
									</c:when>
									<c:otherwise>
										<p style="color: red;">새 게시물 +<c:out value="${weightCountNew}"/></p>
									</c:otherwise>
								</c:choose>
								<p>총 게시물 <c:out value="${weightCount}" /></p>
								<!-- <button type="button" class="btn btn-outline-dark" href="#" style="border-radius: 0;">detail</button> -->
							</div>
						</section>
						<section class="spotlight">
							<div class="image">
								<a href="/post/postList"><img src="/resources/images/images/food1.jpg" alt="" /></a>
							</div>
							<div class="content">
								<h2>[food]<br>
								healthy menu & recipe</h2>
								<c:choose>
									<c:when test="${foodCountNew eq null || foodCountNew eq 0}">
									</c:when>
									<c:otherwise>
										<p style="color: red;">새 게시물 +<c:out value="${foodCountNew}"/></p>
									</c:otherwise>
								</c:choose>
								<p>총 게시물 <c:out value="${foodCount}" /></p>
								<!-- <button type="button" class="btn btn-outline-dark" href="#" style="border-radius: 0;">detail</button> -->
							</div>
						</section>
					</section>
				</form>

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
			<!-- chart js -->
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<!-- 폰트어썸 -->
			<script src="https://kit.fontawesome.com/f92c8dde3d.js" crossorigin="anonymous"></script>
			
			<script> /* 차트 */
				const ctx = document.getElementById('myChart');
				
				  new Chart(ctx, {
					type: 'doughnut',
					data: {
					    labels: ['남', '여'],
					    datasets: [{
							label: '회원수',
							data: [
						    	  ${menCount}, 
						    	  ${womenCount}
						   	  ]
						    }]
						  },
						  options: {
						    scales: {
						      y: {
						        beginAtZero: true
						      }
						    }
						  } 
						});
				  const ctx2 = document.getElementById('myChart2');
				  new Chart(ctx2, {
					    type: 'bar',
					    data: {
					        labels: [
			        			'다이어트', 
			        			'웨이트', 
			        			'푸드'],
					        datasets: [{
					            label: '커뮤니티 게시물 수',
					            data: [
					            	${dietCount}, 
					            	${weightCount}, 
					            	${foodCount}
				            	],
					            borderWidth: 1
					        }]
					    },
					    options: {
					        scales: {
					            y: {
					                beginAtZero: true
					            }
					        }
					    }
					});
			</script>
	</body>
</html>