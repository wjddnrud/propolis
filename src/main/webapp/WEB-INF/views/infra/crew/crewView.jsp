<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.woo.infra.modules.code.CodeServiceImpl"/>

<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>CrewView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<link rel="icon" href="/resources/images/images/favicon.ico">
		
		<style type="text/css">
			.modal-close {
			    color: #999;
			    position: absolute;
			    right: 15px;
			    top: 10px;
			    text-decoration-line: none;
			}
			
			.modal-content {
			    background-color: #fff;
			    width: 350px;
			    position: absolute;
			    top: 50%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    border-radius: 10px;
			    box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
			    text-align: center; 
			    padding: 10px;
			}
			
			.modal {
			    background-color: rgba(0, 0, 0, 0.4);
			    position: fixed;
			    top: 0;
			    left: 0;
			    height: 100vh;
			    width: 100%;
			    /* display: none; */
			} 
			
			.modal.active {
			    display: block;
			}
			
			.modal-body {
			    /* background-color: rgb(224, 224, 224); */ 
			    width: 100%;
			    height: 300px;
			    border-radius: 5px;
			    overflow-y: auto;
			}
			
			.modal-body::-webkit-scrollbar { 
			    display: none; /* Chrome, Safari, Opera*/
			}
			
			.modal-block{ 
			    width: 100%;
			    height: 40px;
			    display: flex;
			    align-items: center;
			    border-bottom: 1px solid #e0e0e0;
				margin-bottom: 10px;
				padding: 0px 0px 10px 0px;
			}
			
			.modal-block img{
				object-fit:auto;
				width: 30px; 
				height: 30px;
			}
			
			.modal_overlay {
			  position: fixed;
			  top:0;
			  left:0;
			  z-index: 100;
			  width: 100%;
			  height: 100%;
			  background-color: rgba(0,0,0,0.3);
			  backdrop-filter: blur(10px);
			  transition: all 0.3s;
			}
		</style>
		<style type="text/css">
			@font-face {
			    font-family: 'GmarketSansMedium';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			.container{
				font-family: 'GmarketSansMedium';
			}
			
			#partName:hover {
				background: black;
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
						<h2>findMate</h2>
						<p>????????? ????????? join ????????????!</p>
					</header>
					<section class="wrapper style5">
						<div class="inner" style="width: 90%;">
							<!-- ????????? ??????????????? jsp?????? ???????????? -->
							<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
							<form name="crewForm">
							 
								<input type="hidden" id="cuMember" name="cuMember" value="${one.creator }">
								<input type="hidden" id="seq" name="seq" value="${one.seq }">
								<input type="hidden" id="crLeaderNy" name="crLeaderNy" value="0">
								<input type="hidden" id="mmSeq" name="mmSeq" value="${sessSeq }">
								<input type="hidden" id="poAddress" name="poAddress" value="${one.location }">
								<input type="hidden" id="crmmCount" name="crmmCount" value="${one.crmmCount}">
								<input type="hidden" id="crewMemberNum" name="crewMemberNum" value="${one.crewMemberNum }">
								
								<!-- view??? ???????????? ??????????????????????????? list?????? ?????????????????? ???????????? ??? -->
										<input type="hidden" id="fromMyPage" name="fromMyPage" value="${dto.fromMyPage}">

								
								<center>
								<div class="container mb-5" style="width: 70%;">
									<div class="row" style="text-align: center; width: 100%;">
										<!-- ?????? ?????? -->
										<div class="col-6">
											<div id="map" style="width: 100%; height: 100%;"></div>
										</div>
										<!-- ????????? ?????? -->
										<div class="col-6" style="padding-left: 100px;">
											<div class="row justify-content-center mb-3">
												<div class="col">
													<h3 class="mb-2 text-center"><b style="color: #6b33ed;"><c:out value="${one.crewName }"/></b></h3>
												</div>
											</div>
											<div class="row justify-content-center mb-5">
												<img src="${one.path}${one.uuidName}" style="width: 100px; height: 100px; border-radius: 50%; padding: 0;"> 
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span onclick="crMember(${one.creator})" style="cursor: pointer; color: gold;"><c:out value="${one.id }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span>
													<c:forEach items="${listCodeSports}" var="list" varStatus="statusSports">
														<c:if test="${one.sports eq list.cc_key }"><c:out value="${list.cc_name }"/></c:if>
													</c:forEach>
													</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.crewMemberNum }"/>???</span> 
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<c:choose>
														<c:when test="${one.crmmCount eq one.crewMemberNum}">
															<span style="color: #FAB150;">????????????!</span>
														</c:when>
														<c:otherwise>
															<span><c:out value="${one.crmmCount }"/>???</span>
														</c:otherwise>
													</c:choose> 
													<a type="button" style="padding-left:5px; padding-right:5px; border: 3px solid black; border-radius: 10px;" onclick="crMemberList()">????????????</a> 
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.location }"/></span>
													<span><c:out value="${one.locationDetail }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>?????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.playDate }"/></span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.startTime }"/>???</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.endTime }"/>???</span>
												</div>
											</div>
											<div class="row justify-content-between mb-2">
												<div class="col-4 text-start">
													<span><b>????????????</b></span>
												</div>
												<div class="col-8 text-start">
													<span><c:out value="${one.detail }"/></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								</center>
								<center>
									<c:if test="${joinCheck eq 0}">
										<a id="join" class="button primary" <c:if test="${one.creator eq sessSeq}">hidden</c:if>>????JOIN</a>	
									</c:if>  
									<c:if test="${joinCheck ne 0}">
										<a id="joinDel" class="button primary">????CANCLE</a>	
									</c:if>
									<a id="back" href="/crew/crewList" class="button"><i class="fa-solid fa-arrow-left"></i>back</a>
									<a href="javascript:message()" class="button" <c:if test="${one.creator eq sessSeq}">hidden</c:if>><i class="fa-regular fa-envelope"></i>message</a>
									<!-- <a href="/findMateNotify" class="button primary" style="float: right;">??????????</a> -->
								</center>
								
								<!-- ????????? ?????? ??? -->
								<div class="modal"  id="modal-notice">
									<div class="modal-content">
										<a href="javascript:closeModal('modal-notice')" class="modal-close">x</a>
										<span id="followTitle" style="font-weight:bold; font-size: 13pt; margin-bottom:5px;">???????????? ?????????</span>
										<div id="modaldata" class="modal-body">
										
										<!-- ????????? ?????? ???????????? ???  -->
										            
										</div>
									</div>	
								</div>
								
							</form>
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
			
			<!-- ????????? ?????? script ??????????????? -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries=services,clusterer,drawing"></script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    <!-- alert??? ????????? -->
			<script>
				var form = $("form[name=crewForm]");
				
				
				
				// seq ??? ????????? ???????????? name id ???????????????
				/* $("#back").on("click", function() {
					
					if($("fromMyPage").val() == "0") {
						form.attr("action", "/crew/crewList").submit();
					} else {
						form.attr("action", "/crew/crewList").submit();
					}
				}); */
				
			
				$("#join").on("click", function() {
					
					if($("#crmmCount").val() == $("#crewMemberNum").val()) {
						
						swal ( "?????? ????????? ?????????????????????!" , "" , "error" );
					} else {
						swal("Join ??????!", "????????????????????? join ????????? ???????????????.", "success")
						.then(function() {
							form.attr("action", "/crew/crewMemberInst").submit();	
						});
					}
				});
				
				$("#joinDel").on("click", function() {
					
					swal({
						  title: "JOIN??? ??????????????????????",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
						    swal("JOIN ????????? ?????????????????????!", {
						      icon: "success",
						    })
						    .then(function() {
								form.attr("action", "/crew/joinDel").submit();
						    });
						  } else {
						    swal("???????????? ????????????");
						  }
						});
					
				});
			
				
				message = function(){
					form.attr("action", "/chat/").submit();
				}
				
				crMember = function(seq) {
					$("#seq").val(seq);
					form.attr("action", "/myPagePostList").submit();
				}
				
			</script>
			<script>
				/* ????????? ?????? */ 
				var mapContainer = document.getElementById('map'), // ????????? ????????? div  
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ????????? ????????????
				        level: 4 // ????????? ?????? ??????
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????
				
				// ?????? ???????????? ????????? ???????????????
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    // ?????? ???????????? ????????? ?????? ?????????
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // ?????? ???????????? ???????????????    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);  
				
				var address = $("#poAddress").val();
				
				// ??????-?????? ?????? ????????? ???????????????
				var geocoder = new kakao.maps.services.Geocoder();
				
				geocoder.addressSearch(address, function(result, status) {
					
				    // ??????????????? ????????? ??????????????? 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
				        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
				        map.setCenter(coords);
				    } 
				    
				     var marker = new kakao.maps.Marker({
					        map: map, // ????????? ????????? ??????
					        position: coords, // ????????? ????????? ??????
					        image : markerImage // ?????? ????????? 
					    });
				});
				
				
				crMemberList = function() {
					
					$('#modaldata').html('');
					
					$.ajax({
						
						url: '/crew/crMemberList',
						type: 'POST',
						datatype: 'json',
						data: {
							seq : $("#seq").val()
						},
						success:function(result) {
							if(result.rt == "success") {
								var txt = "";
								
								for(var i = 0; i < result.list.length; i++) {
									
									var imgSrc = "/resources/uploaded/member/noprofil.jpg";
									
									if(result.list[i].path != null)
										imgSrc = result.list[i].path + result.list[i].uuidName;
									
									txt += '<div class="row modal-block">'
									txt += '<div class="col-2">'
									txt += '<img src="'+ imgSrc +'" alt="" width="100%" height="100%" style="border-radius:50%;">'
									txt += '</div>'
									txt += '<div class="col-6 text-start" style="cursor:pointer; font-size:10pt;" onclick="runForm(' + result.list[i].seq +')">'+result.list[i].name+'</div>'
									txt += '<div class="col-3 text-end"></div>'
									txt += '</div>'
								}
								
								$('#modaldata').html(txt); 
							}
						},
						error:function(){
							alert("ajax error..!");
						}
						
					});
					
					$("#modal-notice").addClass('active');
						
				};
				
				//?????? ??????
				closeModal = function(modal) {
					$("#"+modal).removeClass('active');
				};
				
				runForm = function(seq) {
					$("#seq").val(seq);
					form.attr("action", "/myPagePostList").submit();
				}
			</script>
	</body>
</html>