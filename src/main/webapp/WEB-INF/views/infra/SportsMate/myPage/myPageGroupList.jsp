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
											<li><a href="/findMate">Find Mate</a></li>
											<li><a href="/community">Community</a></li>
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
						<h2>My page</h2>
						<h4>마이페이지에서 내 정보를 수정하거나 게시했던 글들을 확인할 수 있습니다.</h4>
					</header>
					<section class="wrapper style5">
						<div class="inner">
							<section>
								<div class="row">
									<div class="col-6" style="font-weight: bold; text-align: right; vertical-align: middel;">
										<img id="imgProfile" src="${img.path}${img.uuidName}" alt="이미지" style="width:150px; height:150px; border: 5px solid black; border-radius: 50%;">
									</div>
									<div class="col-6" style="text-align: left; vertical-align: middle;">
										<b>[회원 정보]</b><br/><br/>
										<b>이름: </b><c:out value="${sessName }"/><br>
										<b>ID: </b><c:out value="${sessId }"/><br>
										<b>게시글 수: </b><c:out value="${sessId }"/><br>
										<b>참여 그룹 수: </b><c:out value="${sessId }"/><br>
										<b>안읽은 메세지: </b><c:out value="${sessId }"/><br>
									</div>
								</div>
								<hr>
								<div>
									<ul class="nav nav-tabs">
										<li class="nav-item">
											<a class="nav-link" href="#"><i class="fa-solid fa-house-chimney"></i></a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/myPageCommunityList">게시글 관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link active" href="/myPageGroupList">그룹 관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/myPageMessegeList">메세지</a>
										</li>
									</ul>
								</div>
								<br>
								
								<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
								<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
									
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
												<th>
													<input type="checkbox">
													<label for="demo-human" style="color: white;">선택</label>
												</th>
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
												<tr value ="${list.seq }">
													<td><input type="checkbox" id="checkbox${status.count }" name="checkbox" value="${list.seq }">
														<label for="checkbox${status.count }"></label>
													</td>
													<td style="text-align: center;"><a href="javascript:viewForm(${list.seq})"><c:out value="${list.seq }"/></a></td>
													<td style="text-align: center;">
														<c:forEach items="${listCodeSports}" var="listSports" varStatus="statusSports">
															<c:if test="${list.sports eq listSports.cc_key}"><c:out value="${listSports.cc_name }"/></c:if>
														</c:forEach>
													</td>
													<%-- <td><c:out value="${list.category }"></c:out></td> --%>
													<td><c:out value="${list.group_name }"></c:out></td>
													<td style="text-align: center;"><c:out value="${list.creator }"></c:out></td>
													<td style="text-align: center;"><c:out value="${list.people_number }"></c:out></td>
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
									<%@include file="../../codegroup/xdmin/pagination.jsp"%>
									<!-- pagination e -->
									
									<button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
									<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button>
									<button type="button" class="btn btn-primary" style="float: right;" onclick="regist();"><i class="fa-solid fa-plus"></i></button>
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
				$( function() {
				  	$( "#datepicker1, #datepicker2" ).datepicker({
				  		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					    changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
					    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
					    yearRange: 'c-50:c+20', // 현재 연도를 기준으로 +N 년 -N 년 표시
					    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // [요일] 한글화
					    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // [월] 한글화
				  		closeText: '닫기',
				  		showButtonPanel: true, // 달력 하단에 버튼 표시
				  		currentText: '오늘 날짜', // 오늘 날짜 클릭 시 클릭 시 오늘 날짜로 이동
				    	showAnim: "slide", // 달력에 애니메이션 적용
				    	minDate: '-50y', // 현재 날짜로부터 N 년까지 표시
				    	nextText: '다음 달', // next 아이콘 툴팁
				    	prevText: '이전 달' // prev 아이콘 툴팁
				  	});
				} );
					
				
				function regist() {
						location.href = "/codegroup/codeGroupForm";
					}
					
				
				   
				
				
				var form = $("form[name=formList]"); // name으로 된거 사용
				// var form = $("#formList");  // id로 된거 사용
				
				var editSeq = $("input:hidden[name=shSeq]");
				/* name이 seq인 hidden type의 input을 editSeq로 정해준다. */
				
				var goUrlList = "/codegroup/codeGroupList";    /* # -> */
				var goUrlInst = "/codegroup/codeGroupInst";    /* # -> */
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
			</script>



</body>
</html>