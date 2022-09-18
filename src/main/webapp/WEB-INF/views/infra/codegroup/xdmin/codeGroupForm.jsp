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
	<title>Admin_CodeGroupForm</title>
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
						<c:when test="${seq eq 0}"><h2>코드그룹 등록</h2></c:when>
						<%-- <c:when test="${vo.seq ne 0}"><h2>코드그룹 수정</h2></c:when> --%>
					</c:choose>
				</header>
				<section class="wrapper style5">
					<div class="inner">
						<form name="forma">
							<center>
								<input name="shUseNY" value="${vo.shUseNY }" style="width:300px; margin-bottom: 10px; color: black;">
								<input name="shDelNY" value="${vo.shDelNY }" style="width:300px; margin-bottom: 10px; color: black;">
								<input name="shDate" value="${vo.shDate }" style="width:300px; margin-bottom: 10px; color: black;">
								<input name="shStartDate" value="${vo.shStartDate }" style="width:300px; margin-bottom: 10px; color: black;">
								<input name="shEndDate" value="${vo.shEndDate }" style="width:300px; margin-bottom: 10px; color: black;">
								<input name="shOption" value="${vo.shOption }" style="width:300px; margin-bottom: 10px; color: black;">
								<input name="shValue" value="${vo.shValue }" style="width:300px; margin-bottom: 10px; color: black;">
								<input value="${one.seq }" type="" style="width:300px; margin-bottom: 10px; color: black;">
								
								<%-- <select name="shUseNY" class="form-select form-control me-1 text-center" aria-label="Default selet example">
										<option value="">사용여부</option>
										<option value="0" <c:if test="${one.useNY eq 0}">selected</c:if>>N</option>
										<option value="1" <c:if test="${one.useNY eq 1}">selected</c:if>>Y</option>
										
										<c:choose>
											<c:when test="${list.useNY eq 0}">N</c:when>
											<c:when test="${list.useNY eq 1}">Y</c:when>
										</c:choose>
										
									</select>
									<select name="shDelNY" class="form-select form-control me-1 text-center" aria-label="Default selet example">
										<option value="">삭제여부</option>
										<option value="0" <c:if test="${vo.shDelNY eq 0}">selected</c:if>>N</option>
										<option value="1" <c:if test="${vo.shDelNY eq 1}">selected</c:if>>Y</option>
									</select>
									<select name="shDate" class="form-select form-control me-1 text-center" aria-label="Default selet example">
										<option value="">날짜 구분</option>
										<option value="0" <c:if test="${vo.shDate eq 0}">selected</c:if>>등록일</option>
										<option value="1" <c:if test="${vo.shDate eq 1}">selected</c:if>>수정일</option>
									</select>
									
									<p>Date: <input value="${vo.shStartDate}" autocomplete="off" class="form-control me-1" name="shStartDate" type="text" placeholder="시작일" id="datepicker1"></p>
										
									<p>Date: <input value="${vo.shEndDate}" autocomplete="off" class="form-control me-1" name="shEndDate" type="text" placeholder="종료일" id="datepicker2"></p>
									
									<select id="shOption" name="shOption" class="form-select form-select-sm">
										<option value="" <c:if test="${empty vo.shOption }">selected</c:if>>검색 구분</option>
										<option value="0" <c:if test="${vo.shOption eq 0 }">selected</c:if>>코드그룹 이름</option>
										<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>사용여부</option>
									</select>
									<input autocomplete="off" value="${vo.shValue }" id="<c:out value="${vo.shValue }"/>" name="shValue"  class="form-control me-1" type="text" placeholder="검색어"> --%>
								
								
								<input name="ccg_name" style="width:300px; margin-bottom: 10px;" type="text" id="ccg_name" value="${one.ccg_name}" placeholder="코드그룹명">
								<input name="useNY" style="width:300px; margin-bottom: 10px;" type="text" id="useNY" value="<c:out value="${one.useNY }"/>" placeholder="사용여부 0=N or 1=Y">
								<!-- <button id="btnSave" type="button">등록</button> -->
								<a  id="btnSave" class="button primary">등록</a>
								<a href="javascript:back()" class="button">취소</a>
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
	</body>
</html>





<br>

<script type="text/javascript">
	/* function test() {
		
		if(document.getElementById('ccg_name').value == "") {
			alert("그룹코드 이름을 작성해주세요.");
			
			document.getElementById("ccg_name").value="";
			document.getElementById("ccg_name").focus();
			
			return false;
		}
		
		if(document.getElementById('useNY').value == "") {
			alert("사용여부를 확인해주세요.");
			
			document.getElementById("useNY").value="";
			document.getElementById("useNY").focus();
			
			return false;
		}
		
		alert("코드그룹이 정상적으로 등록되었습니다.");
		
		alert("코드그룹 이름 : " + document.getElementById('ccg_name').value);
		
		alert("사용여부 : " + document.getElementById('useNY').value);
		
		
		
		
		alert(document.getElementById('telecom').options[document.getElementById('telecom').selectedIndex].value);
		
		alert(document.querySelector("input[name='gender']:checked").value);
		
		return false;
	} */
	
	
	var goUrlList = "/codegroup/codeGroupList";    /* # -> */
	var goUrlInst = "/codegroup/codeGroupInst";    /* # -> */
	var goUrlUpdt = "/codegroup/codeGroupUpdt";    /* # -> */
	var goUrlUele = "/codegroup/codeGroupUele";    /* # -> */
	var goUrlDele = "/codegroup/codeGroupDele";    /* # -> */
	
	var seq = $("input:hidden[name=seq]");     /* # -> */
	
	var form = $("form[name=forma]");
	var formVo = $("form[name=formVo]");
	
	$("#btnSave").on("click", function() {
		
		if(document.getElementById('ccg_name').value == "") {
			alert("그룹코드 이름을 작성해주세요.");
			
			document.getElementById("ccg_name").value="";
			document.getElementById("ccg_name").focus();
			
			return false;
		}
		
		if(document.getElementById('useNY').value == "") {
			alert("사용여부를 확인해주세요.");
			
			document.getElementById("useNY").value="";
			document.getElementById("useNY").focus();
			
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
	
	back = function() {
		alert("hello");
		form.attr("action","/codegroup/codeGroupList").submit();
		
	}
	
	
	/* validationInst=function() {
		if(validationUpdt() == false) return false;
	} */
	
	
	
</script>