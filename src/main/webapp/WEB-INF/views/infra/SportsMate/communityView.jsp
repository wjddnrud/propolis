<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.woo.infra.modules.code.CodeServiceImpl"/>
<% pageContext.setAttribute("br", "\n"); %>


<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>CommunityView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<link rel="icon" href="/resources/images/images/favicon.ico">
		
		<style type="text/css">
			.profile-user-img{
			  	/* background: red; */
			    width: 40px;
			    height: 40px;
			    border-radius: 70%;
			    overflow: hidden;
			    text-align: center; 
			  }
			
			  .profile-user-img-img{
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			  }
		</style>
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
							<h2>Community</h2>
							<p>관련 정보들을 멤버들과 공유해보세요.</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">

								
								<section>
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeCategory" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
									
									<form name="formList">
									
										<input type="hidden"id="post_seq" name="post_seq" value="${one.seq }">
										<input type="hidden"id="writer" name="writer" value="${sessSeq}">
										
										<div class="table-wrapper">
											<table class="alt" style="pointer-events: none;">
												<thead>
													<tr>
														<th>카테고리</th>
														<th>작성자</th>
														<th style="width: 600px;">제목</th>
														<th>작성일자</th>
														<th>추천수</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="text-align: center;">
														<c:forEach items="${listCodeCategory}" var="listCategory" varStatus="statusCategory">
															<c:if test="${one.category eq listCategory.cc_key }"><c:out value="${listCategory.cc_name }"/></c:if>
														</c:forEach>
														</td>
														<td style="text-align: center;"><c:out value="${one.writer }"/></td>
														<td style="text-align: center;"><c:out value="${one.title}"/></td>
														<td style="text-align: center;"><c:out value="${one.createDate }"/></td>
														<td style="text-align: center;"><c:out value="${one.viewCount }"/></td>
													</tr>
													<tr style="height: 500px;">
														<td colspan="5" style="text-align: start; vertical-align: middle; padding-left: 30px;">
															<div style="width: 300px; height: 230px; background: lightgray;">
															
															
																<%-- <c:if test="${sessSeq eq null}">   <!-- 로그인전 -->
												                	<li><a href="/signUp">SIGN UP</a></li>
																	<li><a href="/signIn">SIGN IN</a></li>
													        	</c:if>
													            <c:if test="${ ne null}">   <!-- 로그인후 -->
													                <img name="" alt="" src="${img.path}${img.uuidName}" style="width: 300px; height: 250px;">
																</c:if>
															
																<c:if test="${img.path eq null}${img.uuidName eq null }">""</c:if> --%>
													        	
													        	
														        <img name="" alt="첨부파일 없음" src="${img.path}${img.uuidName}" style="max-width: 100%; max-height: 100%;">
														    </div>
														    <br/>
															<c:out value="${fn:replace(one.contents, br, '<br/>')}"/>
														</td>
													</tr>
												</tbody>
											</table>
											
											<center style="margin-left: 12%; margin-bottom: 30px;">
												<a href="#" class="button">💪추천</a>
												<a href="/community/communityList" class="button"><i class="fa-solid fa-arrow-left"></i>&nbsp;back</a>
												<!-- <a href="/communityNotify" class="button" style="float: right;">🚨신고</a> -->
											</center>
											<hr>
											
											
											<!-- 댓글 comment 부분 -->
											
											<div class="row" style="width:100%;">
												<div class="col-10">
													<input class="form-control-sm mb-3" style="margin-left: 20px;" type="text"id="contents" name="contents" placeholder="댓글을 입력해 주세요">
												</div>
												<div class="col-2">
													<button type="button" class="button button primary" id="comment_input">댓글달기</button>
												</div>
											</div>
											<!-- 댓글을 담는 부분을 div로 한번 감싸세요  -->
											<div id="comment_area">
												<!-- prepend -->
												
												<c:forEach items="${comments}" var="comments" varStatus="statusComments">
													<div style="width: 50%;">
														<div class="profile-user-img"> 
															<img src="${comments.path}${comments.uuidName}" class="profile-user-img-img">
														</div> 
														<span><b><c:out value="${comments.writer }"/></b></span>
														<span><c:out value="${comments.create_date }"/></span>
														<input class="form-control-sm mb-4" type="text" name="comments_contents" value="${comments.contents }" disabled readonly>
													</div>
												</c:forEach>
												
												<!-- append -->
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
			<script src="https://kit.fontawesome.com/f92c8dde3d.js" crossorigin="anonymous"></script>
			
			<script type="text/javascript">
				var goUrlInst = "/comment/commentInst";    /* # -> */
				var seq = $("input:hidden[name=post_seq]");
				var form = $("form[name=formList]");
			
				$("#comment_input").on("click", function() {

					//form.attr("action", goUrlInst).submit();
					
					$.ajax({
						url: goUrlInst,
						type: 'POST',
						dataType: 'json',
						data: {
							writer : $("#writer").val(),
							contents :$("#contents").val(),
							post_seq :$("#post_seq").val()
						},
						success:function(result){
							
							//댓글을 입력하면 입력창에 글자 지우기
							$("#contents").val("");
							
							var txt ="";
							
							txt += '<div>';
							txt += '<div class="profile-user-img"> ';
							txt += '<img src="'+ result.img +'" class="profile-user-img-img">';
							txt += '</div> ';
							txt +='<span><b>'+ result.writer +'</b></span>';
							txt +='<span> 방금전</span>';
							txt +='<input style="width: 50%;" class="form-control-sm mb-4" type="text" name="comments_contents" value="'+ result.contents +'" disabled readonly>';
							txt += '</div>';
							
							$("#comment_area").prepend(txt);
							
							form
						},
						error:function(){
							alert("ajax.. error..");
						}
						
					});
					
					
				});

			</script>
	</body>
</html>