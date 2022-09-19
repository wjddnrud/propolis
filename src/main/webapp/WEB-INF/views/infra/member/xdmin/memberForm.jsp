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
	<title>Admin_MemberForm</title>
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
					<h2>회원 등록</h2>
				</header>
				<section class="wrapper style5">
					<div class="inner">
						<form name="forma">
							<center>
								<input name="seq" style="width:300px; margin-bottom: 10px; color: black;" type="" value="<c:out value="${one.seq}"/>">
								<input name="name" style="width:300px; margin-bottom: 10px;" type="text" id="name" value="<c:out value="${one.name}"/>" placeholder="회원 이름">
								<input name="id" placeholder="아이디" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.id}"/>">
								<input name="password" placeholder="패스워드" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.password}"/>">
								<input name="dob" placeholder="생년월일" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.dob}"/>">
								<input name="gender" placeholder="성별" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.gender}"/>">
								<input name="job" placeholder="직업" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.job}"/>">
								<input name="zipcode" placeholder="우편번호" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.zipcode}"/>"> 
								<input name="address" placeholder="주소" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.address}"/>">
								<input name="address_detail" placeholder="상세주소" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.address_detail}"/>">
								<input name="telecom" placeholder="통신사" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.telecom}"/>">
								<input name="phoneNumber" placeholder="전화번호" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.phoneNumber}"/>">
								<input name="way_to_regist" placeholder="가입경로" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.way_to_regist}"/>">
								<input name="createDate" placeholder="등록일" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.createDate}"/>">
								<input name="lastLoginDate" placeholder="최근접속일" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.lastLoginDate}"/>">
								<input name="delNY" placeholder="삭제여부" style="width:300px; margin-bottom: 10px; color: black;" type="text" value="<c:out value="${one.delNY}"/>">
								
								
								<!-- <button id="btnSave" type="button">등록</button> -->
								<a  id="btnSave" class="button primary">등록</a>
								<a href="/member/memberList" class="button">취소</a>
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
	
	var form = $("form[name=forma]");
	
	$("#btnSave").on("click", function() {
		
		if(document.getElementById('name').value == "") {
			alert("회원 이름을 작성해주세요.");
			
			document.getElementById("name").value="";
			document.getElementById("name").focus();
			
			return false;
		}
		
		if(document.getElementById('id').value == "") {
			alert("아이디를 확인해주세요.");
			
			document.getElementById("id").value="";
			document.getElementById("id").focus();
			
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
	
	/* validationInst=function() {
		if(validationUpdt() == false) return false;
	} */
	
	
	
</script>