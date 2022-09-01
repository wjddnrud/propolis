<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<title>Home</title>
</head>
	<body class="is-preload">
			<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
				<header id="header">
					<h1><a href="index.html">sports mate</a></h1>
					<nav id="nav">
						<ul>
							<li class="special">
								<a href="#menu" class="menuToggle"><span>Menu</span></a>
								<div id="menu">
									<ul>
										<li><a href="index.html">Home</a></li>
										<li><a href="findMate.html">Find Mate</a></li>
										<li><a href="board.html">Community</a></li>
										<li><a href="signIn.html">LOG-OUT</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
				</header>

				<!-- Main -->
				<article id="main">
					<header>
						<h2>코드그룹 관리</h2>
						<P>  현재시간 : ${serverTime}. </P>
					</header>
					<section class="wrapper style5">
						<div class="inner">

							
							<section>
								<div>
									<ul class="nav nav-tabs">
										<li class="nav-item">
											<a class="nav-link" href="#"><i class="fa-solid fa-house-chimney"></i></a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" aria-current="page" href="#">코드그룹관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#">코드관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#">회원관리</a>
										</li>
									</ul>
								</div>
								<br>
								<div>
									<form class="d-flex" role="search">
										<select class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="gender">삭제여부</option>
											<option value="">N</option>
											<option value="">Y</option>
										</select>
										<select class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="gender">수정일</option>
											<option value="">1</option>
											<option value="">2</option>
										</select>
										<input class="form-control me-1" type="search" placeholder="시작일" aria-label="Search">
										<input class="form-control me-1" type="search" placeholder="종료일" aria-label="Search">
										<select class="form-select form-control me-1 text-center" aria-label="Default selet example">
											<option value="gender">검색구분</option>
											<option value="">1</option>
											<option value="">2</option>
										</select>
										<input class="form-control me-1" type="search" placeholder="검색어" aria-label="Search">
										<button class="btn btn-outline-success me-1" type="submit"><i
												class="fa-solid fa-magnifying-glass"></i></button>
										<button class="btn btn-outline-warning" type="reset"><i class="fa-solid fa-arrow-rotate-left"></i></button>
									</form>
								</div>
								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<th>
													<input type="checkbox" id="demo-human" name="demo-human">
													<label for="demo-human">Remember</label>
												</th>
												<th>No</th>
												<th>코드그룹 코드</th>
												<th>코드그룹 이름(한글)</th>
												<th>코드그룹 이름(영문)</th>
												<th>코드갯수</th>
												<th>등록일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td><input type="checkbox" id="demo-human" name="demo-human">
													<label></label></td>
												<td>1</td>
												<td>1</td>
												<td></td>
												<td></td>
												<td>0</td>
												<td></td>
												<td></td>
											</tr>
											
										</tbody>
										<tfoot>
											<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
											마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
										</tfoot>
									</table>
									<center>
										<a href="boardReg.html" class="button primary">작성</a>
										<a href="index.html" class="button"><i class="fa-solid fa-house"></i>&nbsp;홈으로</a>
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