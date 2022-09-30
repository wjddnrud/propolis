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
		<title>Community</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
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
						<h2>Community</h2>
						<p>관련 정보들을 멤버들과 공유해보세요.</p>
					</header>
					<section class="wrapper style5">
						<div class="inner">

							
							<section>
								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<th>카테고리</th>
												<th>작성자</th>
												<th>제목</th>
												<th>작성일자</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr onclick="location.href='/communityView'" style="cursor: pointer;">
												<td>FOOD</td>
												<td>dnwk101</td>
												<td>먹는것 식단 질문 드려요</td>
												<td>2022-07-29 08:13:45</td>
												<td>15</td>
											</tr>
											<tr>
												<td>DIET</td>
												<td>heez2727</td>
												<td>40대 여성 웨이트 및 유산소</td>
												<td>2022-05-14 12:31:22</td>
												<td>31</td>
											</tr>	
											<tr>
												<td>WEIGHT</td>
												<td>bums1004</td>
												<td>운동루틴 및 체지방 줄이는 방법 질문</td>
												<td>2022-06-03 17:20:45</td>
												<td>24</td>
											</tr>
											<tr>
												<td>FOOD</td>
												<td>dnwk101</td>
												<td>[#빼고파] 이왕하는거 맛있게 먹고 확실하게 빼자🔥 김신영의 다이어트 식단 모음집</td>
												<td>2022-05-08 21:02:04</td>
												<td>187</td>
											</tr>
											<tr>
												<td>FOOD</td>
												<td>minsoo1122</td>
												<td>김강민의 근육 커지는 식단</td>
												<td>2022-03-31 16:25:42</td>
												<td>209</td>
											</tr>
											<tr>
												<td>WEIGHT</td>
												<td>zzdd1996</td>
												<td>숄더프레스 외회전 내회전 질문</td>
												<td>2022-08-10 02:21:22</td>
												<td>3</td>
											</tr>
											<tr>
												<td>DIET</td>
												<td>gbh1234</td>
												<td>(사진첨부) 정준하, 조세호, 조영구처럼 얼굴이 촛농처럼 떨어질거같은거요</td>
												<td>2022-08-09 23:36:16</td>
												<td>16</td>
											</tr>
											<tr>
												<td>FOOD</td>
												<td>minsoo1122</td>
												<td>고등부 보디빌딩</td>
												<td>2022-08-09 23:36:16</td>
												<td>5</td>
											</tr>
											<tr>
												<td>FOOD</td>
												<td>shj7272</td>
												<td>운동 전 아메리카노에 대해서</td>
												<td>2022-08-06 08:34:46</td>
												<td>27</td>
											</tr>
											<tr>
												<td>DIET</td>
												<td>shj7272</td>
												<td>다이어트에 매일 하루견과 한봉지 먹어도 괜찮은가요?</td>
												<td>2022-08-01 22:04:50</td>
												<td>40</td>
											</tr>
										</tbody>
										<tfoot>
											<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
											마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
										</tfoot>
									</table>
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
										<a href="/communityForm" class="button primary">작성</a>
										<a href="/main" class="button"><i class="fa-solid fa-house"></i>&nbsp;홈으로</a>
										<!-- <a href="boardNotify.html" class="button" style="background-color: red; color: white;">🚨신고</a> -->
									</center>
								</div>
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