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
	<link rel="icon" href="/resources/images/images/favicon.ico">
	<title>Admin_CodeGroupForm</title>
</head>
	<body class="is-preload">
		<!-- Page Wrapper -->
		<div id="page-wrapper">

			<!-- Header -->
			<%@include file="/resources/include/adminHeader.jsp" %>

			<!-- Main -->
			<article id="main">
				<header>
					<c:choose>
						<c:when test="${one.seq eq null}"><h2>코드그룹 등록</h2></c:when>
						<c:when test="${one.seq ne null}"><h2>코드그룹 수정</h2></c:when>
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
								
								<input type="hidden" name="seq" value="${one.seq }" style="width:300px; margin-bottom: 10px; color: black;">
								<span>코드그룹명</span>
								<input name="ccg_name" style="width:200px; margin-bottom: 10px;" type="text" id="ccg_name" value="${one.ccg_name}" autocomplete="off">
								<c:choose>
									<c:when test="${one.seq eq null }">
										<input type="hidden" name="delNY" style="width:300px; margin-bottom: 10px; color: black;" placeholder="default=N">
									</c:when>
									<c:otherwise>
										<span>삭제여부</span>
										<select name="delNY" id="delNY" style="width:150px; margin-bottom: 10px; text-align: center;">
											<option value="0">선택</option>
											<option value="1" <c:if test="${one.delNY eq 1}">selected</c:if>>N</option>
											<option value="2" <c:if test="${one.delNY eq 2}">selected</c:if>>Y</option>
										</select>
									</c:otherwise>
								</c:choose>
								<span>사용여부</span>
								<select name="useNY" id="useNY" style="width:150px; margin-bottom: 50px; text-align: center;">
									<option value="0">선택</option>
									<option value="1" <c:if test="${one.useNY  eq 1}">selected</c:if>>N</option>
									<option value="2" <c:if test="${one.useNY  eq 2}">selected</c:if>>Y</option>
								</select>
								<%-- <input name="useNY" style="width:300px; margin-bottom: 10px;" type="text" id="useNY" value="<c:out value="${one.useNY }"/>" placeholder="1=N or 2=Y"> --%>
								<!-- <button id="btnSave" type="button">등록</button> -->
								<a  id="btnSave" class="button primary">등록</a>
								<a href="/codegroup/codeGroupList" class="button">취소</a>
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
	</body>
</html>





<br>

<script type="text/javascript">
	var goUrlList = "/codegroup/codeGroupList";    /* # -> */
	var goUrlInst = "/codegroup/codeGroupInst";    /* # -> */
	var goUrlUpdt = "/codegroup/codeGroupUpdt";    /* # -> */
	var goUrlUele = "/codegroup/codeGroupUele";    /* # -> */
	var goUrlDele = "/codegroup/codeGroupDele";    /* # -> */
	
	var form = $("form[name=forma]");
	var seq = $("input:hidden[name=seq]");
	
	$("#btnSave").on("click", function() {
		
		if(document.getElementById('ccg_name').value == "") {
			alert("코드그룹 이름을 작성해주세요.");
			
			document.getElementById("ccg_name").value="";
			document.getElementById("ccg_name").focus();
			
			return false;
		}
		
		if(document.getElementById('useNY').value == 0) {
			alert("사용여부를 확인해주세요.");
			
			document.getElementById("useNY").value=0;
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
</script>