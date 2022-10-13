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
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
								
									<form name="findMateForm">
										
										<!-- 그룹 생성자 (그룹장) -->
										<input type="hidden" value="${sessId}" name="creator" id="creator">
										
										<input type="hidden" name="seq" id="seq">
										
										<div class="row gtr-uniform">
											<div class="col-4"></div>
											<div class="col-4">
												<center>
													<div class="col-4">
														<img id="imgProfile" src="" alt="프로필 이미지" style="padding-top: 10px; width:300px; height:300px; border-color: solid black 2px;">
													</div>
													<div id="ifmmUploadedImage1View" class="col-8 col-12-xsmall filebox">
														<input class="upload-name" placeholder="첨부파일">
														<label for="imgFile" style="margin: 0; padding-top: 5px; background-color: rgb(240, 240, 240); color: rgb(100, 100, 100);  ">파일찾기</label>
														<input id="imgFile" name="multipartFile" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);">
													</div>
												</center>
											</div>
											<div class="col-4"></div>
											<div class="col-4 col-12-xsmall">
												<%-- <select>
													<c:forEach items="${sports }" var="sports" varStatus="statusSports">
														<option name="sports" value="${sports.cc_key }"><c:out value="${sports.cc_name }"/></option>
													</c:forEach>
												</select> --%>
												<select name="sports" id="sports">
													<c:forEach items="${listCodeCategory}" var="listSports" varStatus="statusSports">
														<option value="${sports.seq}" <c:if test="${list.sports eq listSports.cc_key }">selected<c:out value="${listSports.cc_name }"/></c:if>
													</c:forEach>												
												</select>
											</div>
											<div class="col-8 col-12-xsmall">
												<input type="text" name="group_name" id="group_name" placeholder="그룹명을 입력해주세요." >
											</div>
											<div class="col-12 col-12-xsmall filebox">
												<input class="upload-name" value="" placeholder="운동장소">
												<label for="file" style="margin: 0; padding-top: 5px; background-color: rgb(240, 240, 240); color: rgb(100, 100, 100);">주소검색</label>
												<input type="file" id="file">
											</div>
											<div class="col-2 col-12-xsmall">
												<input name="playDate" id="playDate" type="text" placeholder="모임날짜" id="datepicker">
											</div>	
											<div class="col-2 col-12-xsmall">
												<input type="text" name="startTime" id="startTime" placeholder="시작시간 (00:00)" />
											</div>
											<div class="col-2 col-12-xsmall">
												<input type="text" name="endTime" id="endTime" placeholder="종료시간 (00:00)" />
											</div>
											<div class="col-4 col-12-xsmall">
												<input type="text" name="location" id="location" placeholder="지역 (xx시 xx구)" />
											</div>
											<div class="col-2 col-12-xsmall">
												<input type="text" name="people_number" id="people_number" placeholder="인원 (명)" />
											</div>
											<div class="col-12">
												<textarea name="detail" id="detail" placeholder="여기에 그룹의 자세한 내용을 입력해주세요." rows="15"></textarea>
											</div>
											<div class="col-12">
												<ul class="actions" style="justify-content: center;">
													<li><input type="reset" value="Reset"></li>
													<li><a id="btnSave" class="button primary">Sign-up</a></li>
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
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
			
			<script type="text/javascript">
				$("#imgFile").on('change',function(){
					var fileName = $("#imgFile").val();
					$(".upload-name").val(fileName);
				});
				
			
				
				var goUrlList = "/sportsGroup/sportsGroupList";    /* # -> */
				var goUrlInst = "/sportsGroup/sportsGroupInst";    /* # -> */
				var goUrlUpdt = "/sportsGroup/sportsGroupUpdt";    /* # -> */
				var goUrlUele = "/sportsGroup/sportsGroupUele";    /* # -> */
				var goUrlDele = "/sportsGroup/sportsGroupDele";    /* # -> */	
				
				
				
				function btnSave() {
					
				}
				
				
				$("#btnSave").on("click".function() {
					
					if(document.getElementById('group_name').value == "") {
						alert("그룹명을 작성해주세요.");
						
						document.getElementById('group_name').value = "";
						document.getElementById('group_name').focus();
						
						return false;
					}
					
					if(document.getElementById('sports').value == 0) {
						alert("운동종목을 작성해주세요.");
						
						document.getElementById('sports').value = 0;
						document.getElementById('sports').focus();
						
						return false;
					}
					
					if(document.getElementById('location').value == "") {
						alert("거주 지역을 작성해주세요.");
						
						document.getElementById('location').value = "";
						document.getElementById('location').focus();
						
						return false;
					}
					
					if(document.getElementById('people_number').value == "") {
						alert("참여인원을 작성해주세요.");
						
						document.getElementById("people_number").value = "";
						document.getElementById("people_number").focus();
						
						return false;
					}
					
					if(document.getElementById('startTime').value == "") {
						alert("운동 시작시간을 작성해주세요.");
						
						document.getElementById("startTime").value = "";
						document.getElementById("startTime").focus();
						
						return false;
					}
					
					if(document.getElementById("endTime").value == "") {
						alert("운동 종료시간을 작성해주세요.");
						
						document.getElementById("endTime").value = "";
						document.getElementById("endTime").focus();
						
						return false;
					}
					
					if(document.getElementById('detail').value == "") {
						alert("세부사항을 작성해주세요.");
						
						document.getElementById("detail").value = "";
						document.getElementById("detail").focus();
						
						return false;
					}
					
					if(document.getElementById('playDate').value == "") {
						alert("운동 날짜을 작성해주세요.");
						
						document.getElementById("playDate").value = "";
						document.getElementById("playDate").focus();
						
						return false;
					}
					form.attr("action", goUrlInst).submit();
					
					var form = ${"form[name=findMateForm]"};
					var seq = ${"input:hidden[name=seq]"};
					
					if(seq.val() == "0" || seq.val() == ""){
						form.attr("action", goUrlInst).submit();
					} else {
						form.attr("action", goUrlUpdt).submit();
					}
				});
				
			</script>
			

	</body>
</html>