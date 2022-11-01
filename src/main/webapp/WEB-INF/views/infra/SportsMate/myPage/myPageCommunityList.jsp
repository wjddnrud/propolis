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
	<title>MyPage</title>
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
											<li><a href="/myPageCommunityList">MyPage</a></li>
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
						<h2>회원 정보</h2>
					</header>
					<section class="wrapper style5">
						<div class="inner">
							<section>
								<div class="row pb-5">
									<div class="col-6" style="font-weight: bold; text-align: right; vertical-align: middel;">
										<img id="imgProfile" src="${img.path}${img.uuidName}" alt="이미지 없음" style="overflow: hidden; width:150px; height:150px; text-align: center; vertical-align: middle; border: 5px solid black; border-radius: 50%;">
									</div>
									<div class="col-6" style="text-align: left; vertical-align: middle;">
										<b>[회원 정보]</b><br/><br/>
										<b>이름: </b><c:out value="${one.name }"/><br>
										<b>ID: </b><c:out value="${one.id }"/><br>
										<b>성별: </b><c:out value="${one.gender }"/><br>
										<b>직업: </b><c:out value="${one.job }"/><br>
										<b>생년월일: </b><c:out value="${one.dob }"/><br> 
										<b>주소: </b><c:out value="${one.address }"/><br>
										<%-- <b>게시글 수: </b><c:out value="${cmlist[0].MyCommunityCount }"/><br> --%>
										<!-- fn:length(리스트) 불러온 리스트의 크기를 알려준다. -->
										<b>게시글 수: </b><c:out value="${fn:length(cmlist) }"/><br>
										<b>참여 그룹 수: </b><c:out value="${fn:length(grlist) }"/><br>
									</div>
								</div>
								<div>
									<ul class="nav nav-tabs">
										<!-- <li class="nav-item">
											<a class="nav-link" href="#"><i class="fa-solid fa-house-chimney"></i></a>
										</li> -->
										<li class="nav-item">
											<a class="nav-link active" href="/myPageCommunityList">게시글 관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/myPageGroupList">그룹 관리</a>
										</li>
										<!-- <li class="nav-item">
											<a class="nav-link" href="/myPageMessegeList">메세지</a>
										</li> -->
									</ul>
								</div>
								<br>
								
								<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
								<c:set var="listCodeCategory" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
								
								<form action="http://localhost:8080/codegroup/codeGroupSearch" name="formList" id="formList" method="post">
									
									<!-- 가져온값 뒷단에 담아주는곳 hidddn -->
									<!-- <input type="hidden" name="mainKey"> -->
									<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
									<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
									<!-- <input type="hidden" name="checkboxSeqArray"> -->
									<!-- <form class="d-flex" role="search"> -->
									<input type="hidden" name="shSeq">
									
									
								<div class="table-wrapper">
								
									<table class="alt">
										<thead>
											<tr>
												<!-- <th>
													<input type="checkbox">
													<label for="demo-human" style="color: white;">선택</label>
												</th> -->
												<th>No</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
												<th>작성일자</th>
											</tr>
										</thead>
										<tbody style="color: black;">
											<c:choose>
												<c:when test="${fn:length(cmlist) eq 0}">
													<tr>
														<td class="text-center" colspan="8">There is no data!</td>
													</tr>
												</c:when>
											</c:choose>
											
											
											<c:forEach items="${cmlist}" var="list" varStatus="statusList">
													<tr onclick="viewForm('${list.seq}')">
														<%-- <td><input type="checkbox" id="checkbox${status.count }" name="checkbox" value="${list.seq }">
															<label for="checkbox${status.count }"></label>
														</td> --%>
														<td style="text-align: center;"><c:out value="${list.seq }"/></td>
														<td style="text-align: center;">
															<c:forEach items="${listCodeCategory}" var="listCategory" varStatus="statusCategory">
																<c:if test="${list.category eq listCategory.cc_key}"><c:out value="${listCategory.cc_name }"/></c:if>
															</c:forEach>
														</td>
														<%-- <td><c:out value="${list.category }"></c:out></td> --%>
														<td><c:out value="${list.title }"></c:out></td>
														<td style="text-align: center;"><c:out value="${list.writer }"></c:out></td>
														<td style="text-align: center;"><c:out value="${list.viewCount }"></c:out></td>
														<td style="text-align: center;"><c:out value="${list.createDate }"></c:out></td>
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
									
									<button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
									<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button>
									<button type="button" class="btn btn-success me-1" style="float: right;"><i class="fa-solid fa-file-excel"></i></button>
									
								</div>
								</form> 
							</section>
							</div>
						</section>
					</article>
					
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">삭제 여부 재확인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								정말로 삭제를 원하십니까?
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" onclick="remove();">Delete</button>
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

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
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
			<script type="text/javascript">
			
				var form = $("form[name=formList]"); // name으로 된거 사용
				// var form = $("#formList");  // id로 된거 사용
				
				var editSeq = $("input:hidden[name=shSeq]");
				/* name이 seq인 hidden type의 input을 editSeq로 정해준다. */
				
				var goUrlList = "/codegroup/codeGroupList";    /* # -> */
				var goUrlUpdt = "/codegroup/codeGroupUpdt";    /* # -> */
				var goUrlUele = "/codegroup/codeGroupUele";    /* # -> */
				var goUrlDele = "/codegroup/codeGroupDele";    /* # -> */	
				
				goList = function(thisPage) {
					$("input:hidden[name=thisPage]").val(thisPage);
					form.attr("action", goUrlList).submit();
				}
				// 버튼을 submit 처리해서 action이 없어도 goUrlList로 submit 되게 해주는 기능 
				
				editForm = function(seq) {
					editSeq.attr("value", seq);
					form.attr("action", "/codegroup/codeGroupForm").submit();
				}
				
				var viewSeq = $("input:hidden[name=shSeq]")
				
				viewForm = function(seq) {
					viewSeq.attr("value", seq);
					form.attr("action", "/community/communityView").submit();
				}
			</script>



</body>
</html>