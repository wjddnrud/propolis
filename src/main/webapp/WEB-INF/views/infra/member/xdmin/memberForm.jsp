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
			<%@include file="/resources/include/adminHeader.jsp" %>

			<!-- Main -->
			<article id="main">
				<header>
					<c:choose>
						<c:when test="${one.seq ne null }"><h2>회원정보 수정</h2></c:when>
					</c:choose>
				</header>
				<section class="wrapper style5">
					<div class="inner">
						<form name="forma">
							<!-- 가져온값 뒷단에 담아주는곳 hidddn -->
							<input type="hidden" name="shSeq">
							<center>
								<div style="width:300px; color: black; text-align: center;">
									<input name="seq"  type="hidden" value="${one.seq}" style=" margin-bottom: 10px; text-align: center;">
									<span>이름</span>
									<input name="name" type="text" id="name" value="${one.name}" style=" margin-bottom: 10px; text-align: center;">
									<span>ID</span>
									<input name="id" id="id" type="text" value="${one.id}" style=" margin-bottom: 10px; text-align: center;">
									<span>PASSWORD</span>
									<input name="password" type="text" value="${one.password}" style=" margin-bottom: 10px; text-align: center;">
									<span>생년월일</span>
									<input name="dob" type="text" value="${one.dob}" style=" margin-bottom: 10px; text-align: center;">
									<span>성별</span>
									<input name="gender" placeholder="N=1 / Y=2" type="text" value="${one.gender}" style=" margin-bottom: 10px; text-align: center;">
									<span>직업</span>
									<input name="job" type="text" value="${one.job}" style=" margin-bottom: 10px; text-align: center;">
									<span>통신사</span>
									<input name="telecom" placeholder="SKT=1 / KT=2 / LG=3" type="text" value="${one.telecom}" style=" margin-bottom: 10px; text-align: center;">
									<span>전화번호</span>
									<input name="phoneNumber" type="text" value="${one.phoneNumber}" style=" margin-bottom: 10px; text-align: center;">
									<span>가입경로</span>
									<input name="way_to_regist" placeholder="지인추천=1 / 인터넷=2 / 유튜브=3 / 기타=4" type="text" value="${one.way_to_regist}" style=" text-align: center; margin-bottom: 10px;">
									<span>삭제여부</span>
									<input name="delNY" placeholder="N=1 / Y=2" type="text" value="${one.delNY}" style=" margin-bottom: 10px; text-align: center;">
									<hr>
									<input type="button" onclick="searchAddress()" value="우편번호 찾기" style=" margin-bottom: 10px; text-align: center;"><br>
									<span>우편번호</span>
									<input name="zipcode" id="zipcode"  value="${one.zipcode}" type="text" style=" margin-bottom: 10px; text-align: center;">
									<span>주소</span>
									<input name="address" id="address" value="${one.address}" type="text" style=" margin-bottom: 10px; text-align: center;">
									<span>상세주소</span>
									<input name="address_detail" id="address_detail" value="${one.address_detail}" type="text" style=" margin-bottom: 50px; text-align: center;">
									
									<!-- <input name="reference"id="reference" type="text" placeholder="주소 참고항목" style=" margin-bottom: 10px; text-align: center;">
									<input id="test1" type="text" placeholder="위도" style=" margin-bottom: 10px; text-align: center;">
									<input id="test2" type="text" placeholder="경도" style=" margin-bottom: 10px; text-align: center;">
									<hr> -->
									
									<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
									<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
								</div>

								
								<!-- <button id="btnSave" type="button">등록</button> -->
								<a  id="btnSave" class="button primary">수정</a>
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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries=services"></script>
		<script type="text/javascript">
		
		    // 우편번호 찾기 화면을 넣을 element
		    var element_layer = document.getElementById('layer');
		
		    function closeDaumPostcode() {
		        // iframe을 넣은 element를 안보이게 한다.
		        element_layer.style.display = 'none';
		    }
		    function searchAddress() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                /* if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("reference").value = extraAddr;
		                
			                } else {
			                    document.getElementById("reference").value = '';
			                } */
		                
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('zipcode').value = data.zonecode;
			                document.getElementById("address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("address_detail").focus();
			                
			                var geocoder = new kakao.maps.services.Geocoder();
			    			
			                geocoder.addressSearch(data.roadAddress, function(result, status) {
				      		    if (status === kakao.maps.services.Status.OK) {
				      		    	console.log(result[0]); 
				      		     	/* $("test1").attr("value",result[0].x);
				      		  	 	$("test2").attr("value",result[0].y);  */
				      		  	 	
					      		  	document.getElementById('test1').value = result[0].x;
					                document.getElementById('test2').value = result[0].y; 
				      		    }
				    		   
				      		});
			                
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_layer.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_layer.style.display = 'block';
		
		        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		        initLayerPosition();
		    }
		
		    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		    function initLayerPosition(){
		        var width = 300; //우편번호서비스가 들어갈 element의 width
		        var height = 400; //우편번호서비스가 들어갈 element의 height
		        var borderWidth = 2; //샘플에서 사용하는 border의 두께
		
		        // 위에서 선언한 값들을 실제 element에 넣는다.
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		    
		    
	
		
			var goUrlList = "/member/memberList";    /* # -> */
			var goUrlInst = "/member/memberInst";    /* # -> */
			var goUrlUpdt = "/member/memberAdminUpdt";    /* # -> */
			var goUrlUele = "/member/memberUele";    /* # -> */
			var goUrlDele = "/member/memberDele";    /* # -> */
			
			var form = $("form[name=forma]");
		
			$("#btnSave").on("click", function() {
				form.attr("action", goUrlUpdt).submit();
			});
			
		</script>
	</body>
</html>


