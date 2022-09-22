<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<title>Admin_CodeForm</title>
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
								<li><a href="#">Administor</a></li>
									<li><a href="/codegroup/codeGroupList">CodeGroupList</a></li>
									<li><a href="/code/codeList">CodeList</a></li>
									<li><a href="/member/memberList">MemberList</a></li>
									<li><a href="/signIn">LOG-OUT</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</header>

			<!-- Main -->
			<article id="main">
				<header>
					<c:choose>
						<c:when test="${seq eq 0}"><h2>코드 등록</h2></c:when>
						<%-- <c:when test="${vo.seq ne 0}"><h2>코드그룹 수정</h2></c:when> --%>
					</c:choose>
				</header>
				<section class="wrapper style5">
					<div class="inner">
						<form name="forma">
							<center>
								<input type="hidden" name="shUseNY" value="${vo.shUseNY }" style="width:300px; margin-bottom: 10px; color: black;">
								<input type="hidden" name="shDelNY" value="${vo.shDelNY }" style="width:300px; margin-bottom: 10px; color: black;">
								<input type="hidden" name="shDate" value="${vo.shDate }" style="width:300px; margin-bottom: 10px; color: black;">
								<input type="hidden" name="shStartDate" value="${vo.shStartDate }" style="width:300px; margin-bottom: 10px; color: black;">
								<input type="hidden" name="shEndDate" value="${vo.shEndDate }" style="width:300px; margin-bottom: 10px; color: black;">
								<input type="hidden" name="shOption" value="${vo.shOption }" style="width:300px; margin-bottom: 10px; color: black;">
								<input type="hidden" name="shValue" value="${vo.shValue }" style="width:300px; margin-bottom: 10px; color: black;">
								
								<input name="seq" id="seq" type="hidden" style="width:300px; margin-bottom: 10px; color: black;" value="${one.seq }" placeholder="seq" >
								<input name="ccg_name" type="text" id="ccg_name" value="${one.cc_name}" placeholder="코드명" style="width:300px; margin-bottom: 10px;">
								<input name="useNY" type="text" id="useNY" value="<c:out value="${one.useNY }"/>" placeholder="사용여부 1=N or 2=Y" style="width:300px; margin-bottom: 10px;">
								<input name="delNY" id="delNY" value="${one.delNY }" placeholder="삭제여부 1=N or 2=Y">
								<input name="cc_key" id="cc_key" value="${one.cc_key }" placeholder="코드 key">
								<input name="ccg_seq" id="ccg_seq" value="${one.ccg_seq }" placeholder="그룹코드_seq">
								
								<!-- <button id="btnSave" type="button">등록</button> -->
								<a  id="btnSave" class="button primary">등록</a>
								<a href="/code/codeList" class="button">취소</a>
							</center>
						</form>
						<center>
							<!-- <a href="/codegroup/codeGroupForm" class="button primary">등록</a> -->
							
							<!-- <a href="boardNotify.html" class="button" style="background-color: red; color: white;">🚨신고</a> -->
						</center>
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
		
		<script type="text/javascript">
		
		var goUrlList = "/code/codeList";    /* # -> */
		var goUrlInst = "/code/codeInst";    /* # -> */
		var goUrlUpdt = "/code/codeUpdt";    /* # -> */
		var goUrlUele = "/code/codeUele";    /* # -> */
		var goUrlDele = "/code/codeDele";    /* # -> */
		
		var form = ${"form[name=forma]}"};
		
		$("#btnSave").on("click", function() {
			
			if(document.getElementById('cc_name').value == "") {
				alert("코드 이름을 입력해주세요.");
				
				document.getElementById("cc_name").value="";
				document.getElementById("cc_name").focus();
				
				return false;
			}
			
			if($('useNY').value == "") {
				alert("사용여부를 확인해주세요.");
				
				$("useNY").value="";
				$("useNY").focus();
				
				return false;
			}
			
			if(document.getElementById('cc_key').value == "") {
				alert("코드key를 입력해주세요.");
				
				document.getElementById("cc_key").value="";
				document.getElementById("cc_key").focus();
				
				return false;
			}
			
			if(seq.val() == "0" || seq.val() == ""){
				//insert
				/* if(validationInst() == false) return false; */
				form.attr("action", goUrlInst).submit();
				/* form action을 goUrlInst로 바꾸고 "/codeGroup/codeGroupInst"로 submit 하겠다. */
				/* 바꿀수 있는 조건이 seq값이 들어왔느냐 안들어왔느냐로 구별한다. */ /* --> 판별하는 프로세스인 var seq = hidden */
			} else {
				//update
				/* keyName.val(atob(keyName.val())); */
				/* if(validationUpdt() == false) return false; */
				form.attr("action", goUrlUpdt).submit();
			}
		});
		
		
	
	
		</script>
		
		
		
		
	</body>
</html>


