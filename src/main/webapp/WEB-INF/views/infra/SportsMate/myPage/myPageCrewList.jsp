<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.woo.infra.modules.code.CodeServiceImpl"/>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/assets/css/noscript.css" /></noscript>
	<!-- datepicker jquery script import -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="icon" href="/resources/images/images/favicon.ico">
	<title>MyPage</title>
	
	<style type="text/css">
		.on:hover {
				cursor: pointer;
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
						<h2>My page</h2>
						<h4>마이페이지에서 내 정보를 수정하거나 게시했던 글들을 확인할 수 있습니다.</h4>
					</header>
					<section class="wrapper style5">
						<div class="inner" style="width: 50%;">
							<section>
								<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
								<div class="row pb-3">
									<div class="col-6 pt-3" style="font-weight: bold; text-align: right;">
										<img id="imgProfile" src="${img.path}${img.uuidName}" alt="이미지 없음" style="overflow: hidden; width:150px; height:150px; border: 5px solid black; border-radius: 50%;"><br/>
										<c:choose>
											<c:when test="${one.seq eq sessSeq}">
												<a href="/member/memberUserForm" class="button small mt-3">정보 수정</a>
											</c:when>
										</c:choose>
									</div>
									<div class="col-6" style="text-align: left; padding-top: 45px;">
										<b>[회원 정보]</b><br/><br/>
										<%-- <b>이름: </b><c:out value="${one.name }"/><br> --%>
										<b>ID: </b><c:out value="${one.id }"/><br>
										<%-- <c:forEach items="${listCodeGender }" var="listGender" varStatus="statusGender">
											<b>성별: </b><c:if test="${one.gender eq listGender.cc_key }"><c:out value="${listGender.cc_name }"/></c:if><br>
										</c:forEach> --%>
										<%-- <b>직업: </b><c:out value="${one.job }"/><br> --%>
										<%-- <b>생년월일: </b><c:out value="${one.dob }"/><br> --%> 
										<%-- <b>주소: </b><c:out value="${one.address }"/><br> --%>
										<%-- <b>게시글 수: </b><c:out value="${cmlist[0].MyCommunityCount }"/><br> --%>
										<!-- fn:length(리스트) 불러온 리스트의 크기를 알려준다. -->
										<b>게시글 수: </b><c:out value="${fn:length(cmlist) }"/><br>
										<b>참여 그룹 수: </b><c:out value="${fn:length(grlist) }"/><br>
									</div>
								</div>
								<div class="mt-3">
									<ul class="nav nav-tabs">
										<!-- <li class="nav-item">
											<a class="nav-link" href="#"><i class="fa-solid fa-house-chimney"></i></a>
										</li> -->
										<li class="nav-item">
											<a class="nav-link" href="javascript:goList('cm')">게시글</a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" href="javascript:goList('gr')">운동크루</a>
										</li>
										<!-- <li class="nav-item">
											<a class="nav-link" href="/myPageMessegeList">메세지</a>
										</li> -->
									</ul>
								</div>
								<br>
								
								<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
								<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
									
								<form name="formList" id="formList" method="post">
									
									<!-- 가져온값 뒷단에 담아주는곳 hidddn -->
									<!-- <input type="hidden" name="mainKey"> -->
									<!-- <input type="hidden" name="checkboxSeqArray"> -->
									<!-- <form class="d-flex" role="search"> -->
									
									<!-- 마이페이지의 데이터를 가져올 사람의 seq -->
									<!-- crewview로 가는 where문에 seq를 써야해서 이름을 바꿈 -->
									<input type="hidden" id="mSeq" name="mSeq" value="${one.seq }">
									
									<input type="hidden" id="seq" name="seq">
									
									<!-- view로 가져갈때 마이페이지에서인지 list에서 들어가는건지 구분하는 값 -->
									<input type="hidden" id="fromMyPage" name="fromMyPage" value="1">
									
									
									
								
								<div class="table-wrapper">
									<table class="alt">
										<thead>
											<tr>
												<!-- <th>
													<input type="checkbox">
													<label for="demo-human" style="color: white;">선택</label>
												</th> -->
												<th>No</th>
												<th>운동종목</th>
												<th>그룸이름</th>
												<th>그룹리더</th>
												<th>모집인원</th>
												<th>장소</th>
											</tr>
										</thead>
										<tbody style="color: black;">
											<c:choose>
												<c:when test="${fn:length(grlist) eq 0}">
													<tr>
														<td class="text-center" colspan="8">There is no data!</td>
													</tr>
												</c:when>
											</c:choose>
											
											<c:forEach items="${grlist}" var="list" varStatus="statusList">
												<tr onclick="viewForm('${list.seq}')" class="on">
													<%-- <td><input type="checkbox" id="checkbox${status.count }" name="checkbox" value="${list.seq }">
														<label for="checkbox${status.count }"></label>
													</td> --%>
													<td style="text-align: center;"><c:out value="${list.seq }"/></td>
													<td style="text-align: center;">
														<c:forEach items="${listCodeSports}" var="listSports" varStatus="statusSports">
															<c:if test="${list.sports eq listSports.cc_key}"><c:out value="${listSports.cc_name }"/></c:if>
														</c:forEach>
													</td>
													<%-- <td><c:out value="${list.category }"></c:out></td> --%>
													<td><c:out value="${list.crewName }"></c:out></td>
													<td style="text-align: center;"><c:out value="${list.creator }"></c:out></td>
													<td style="text-align: center;"><c:out value="${list.crewMemberNum }"></c:out></td>
													<td style="text-align: center;"><c:out value="${list.location }"></c:out></td>
												</tr>
											</c:forEach>
											
											
											
										</tbody>
										<tfoot>
											<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
											마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
										</tfoot>
									</table>
									
									<!-- pagination s -->
									<%-- <%@include file="../../codegroup/xdmin/pagination.jsp"%> --%>
									<!-- pagination e -->
									
									<!-- <button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
									<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button>
									<button type="button" class="btn btn-success me-1" style="float: right;"><i class="fa-solid fa-file-excel"></i></button> -->
									
								</div>
								</form> 
							</section>
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
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
			<script type="text/javascript">
				
				var form = $("form[name=formList]"); // name으로 된거 사용
				// var form = $("#formList");  // id로 된거 사용

				
				var viewSeq = $("input:hidden[name=seq]")
				

				viewForm = function(seq) {
					
					alert("죄송합니다. 기능 개선중에 있습니다.");
					/* viewSeq.attr("value", seq);
					form.attr("action", "/crew/crewView").submit(); */
				}
				
				
				goList = function(key) {
					
					var url = "";
					switch (key) {
					case 'pr':
					{
						url = "";					
					break;
					}
					case 'cm':
						{
						url = "/myPagePostList";
						
						form.attr("action", url).submit();
						break;
						}
					case 'gr':
					{
						url = "/myPageCrewList";
						
						form.attr("action", url).submit();
					break;
					}
					case 'dm':
					{
						url = "";					
					break;
					}
					default:
						break;
					}
					
					form.attr("action", url).submit();
				}
				
			</script>



</body>
</html>