<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE HTML>
<!--
	Spectral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
	<title>SignUp</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
	<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="is-preload">
	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1><a href="/signIn">sports mate</a></h1>
			<nav id="nav">
				<ul>
					<li class="special">
						<a href="#menu" class="menuToggle"><span>Menu</span></a>
						<div id="menu">
							<ul>
			                	<li><a href="/signUp">SIGN UP</a></li>
								<li><a href="/signIn">SIGN IN</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<article id="main">
			<header>
				<h2>sports Mate 회원가입</h2>
				<p>멤버가 되어 sports mate가 제공하는 다양한 정보와 친구들을 만나보세요.</p>
			</header>
			<section class="wrapper style5" >
				<div class="inner" style="width: 50%;">
					<section>
						<!-- <h2>회원가입</h2> -->
						<form name="signUpForm" enctype="multipart/form-data" method="post">
							<input type="hidden" name="shSeq">
							<input type="hidden" name="delNY">
							<div class="row gtr-uniform">
							
								<div id="ifmmUploadedImage1View" class="col-12 justify-content-center" class="filebox" style="text-align: center;">
									<img id="imgProfile" src="/resources/images/images/noprofil.jpg" alt="이미지" style="width:150px; height:150px; border-radius: 50%;"><br>
									<input id="imgFile" name="multipartFile" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);" style="margin-left: 50%;">
 								</div>
 								
								 
								<div class="col-6 col-4-medium">
									<label for="id_input">ID</label>
									<input type="text" name="id" id="id_input" placeholder="영문,숫자 5~10자" />
									<span id="idCheck_span"></span>
									<input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="password">PASSWORD</label>
									<input type="password" name="password" id="password" placeholder="숫자,영문,특수문자 조합 최소 8자" />
									<input type="password" name="passwordRe" id="passwordRe" placeholder="비밀번호 재입력" style="margin-top: 10px;" />
									<span id="pwCheck"></span>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="name">이름</label>
									<input type="text" name="name" id="name" value="" autocomplete="off" placeholder="" />
								</div>
								<div class="col-6">
									<label for="gender">성별</label>
									<select name="gender" id="gender" value="">
										<option value="">- 선택 -</option>
										<option value="1">남성</option>
										<option value="2">여성</option>
										<option value="3">기타</option>
									</select>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="job">직업</label>
									<input type="text" name="job" id="job" value="" autocomplete="off" placeholder="" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="dob">생년월일</label>     <!-- datepicker로 바꿔주기 -->
									<!-- <input type="text" name="dob" id="dob" value="" placeholder="ex)19951027(년도월일)" /> -->
									<input value="" autocomplete="off" class="form-control me-1" name="dob" type="text" placeholder="" id="datepicker">
								</div>
								<div class="col-2">
									<label for="telecom">통신사</label>
									<select name="telecom" id="telecom" value="">
										<option value="">- 선택 -</option>
										<option value="1">SKT</option>
										<option value="2">KT</option>
										<option value="3">LG</option>
									</select>
								</div>
								<div class="col-5 col-12-xsmall">
									<label for="phone">휴대전화</label>
									<input type="text" name="phoneNumber" id="phoneNumber" value="" placeholder="'-'없이 번호만 입력해주세요." />
									<input type="hidden" id="phonecheckcode">
									<input id="checkPhone" type="button" class="primary" value="인증번호 전송" style="margin-top: 10px;" />
								</div>
								<div class="col-5 col-12-xsmall">
									<label for="phCerti">휴대전화 인증</label>
									<input type="text" name="phCerti" id="phCerti" placeholder="인증번호를 입력해주세요." />
									<span id="phone_check"></span>
									<input type="button" class="primary" id="authNumb" value="확인" style="margin-top: 10px;" />
									
								</div>
								
								<div class="col-4 col-12-xsmall">
									<label for="zipcode">Zip Code</label>
									<input type="text" name="zipcode" id="zipcode" value="" placeholder="우편번호" />
									<input type="button" onclick="searchAddress()" class="primary" value="주소 검색" style="margin-top: 10px;" />
								</div>
								<div class="col-8 col-12-xsmall">
									<label for="address">주소</label>
									<input type="text" name="address" id="address" value="" placeholder="주소" />
									<input type="text" name="address_detail" id="address_detail" value="" placeholder="상세주소" style="margin-top: 10px;" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="email">Email</label>
									<input type="text" name="email" id="email" value="" placeholder="Email@example.com" />
									<span>계정 분실 시 본인인증 정보로 활용됩니다.</span>
								</div>
								<div class="col-6">
									<label for="way_to_regist">가입경로</label>
									<select name="way_to_regist" id="way_to_regist" value="">
										<option value="">- 선택 -</option>
										<option value="1">지인추천</option>
										<option value="1">인터넷 광고</option>
										<option value="1">유튜브</option>
										<option value="1">블로그</option>
									</select>
								</div>
								<!-- <div class="col-12 col-12-small" style="padding-top: 80px;">
									<input type="checkbox" id="allAgree" name="allAgree" onclick="selectAll(this)">
									<label for="allAgree">약관 전체 동의하기</label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="agree1" name="agree">
									<label for="agree1">[필수] 개인정보 수집 및 이용 동의&nbsp;<a href="#" target="_blank">자세히</a></label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="agree2" name="agree">
									<label for="agree2">[필수] SPORTS MATE 이용 약관 동의&nbsp;<a href="#" target="_blank">자세히</a></label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="agree3" name="agree">
									<label for="agree3">[필수] 만 14세 미만 가입 제한</label>
								</div>
								<div class="col-12 col-12-small">
									<input type="checkbox" id="agree4" name="agree">
									<label for="agree4">[선택] 마케팅 활용 및 광고성 정보 수신 동의&nbsp;<a href="#" target="_blank">자세히</a></label>
								</div> -->
								<div class="col-12">
									<ul class="actions fit" style="padding-top: 60px;">
										<li><input type="reset" value="Reset" /></li>
										<!-- <li><input type="submit" value="Sign-up" class="primary" /></li> -->
										<li><a id="signUp" class="button primary">sign-up</a></li>
										<li><input type="button" value="cancle" onclick="location.href='/signIn'" /></li>
									</ul>
								</div>
							</div>
							<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
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
		</footer><div id="footers"></div>

	</div>

	<!-- Scripts -->
	<script src="/resources/images/assets/js/jquery.min.js"></script>
	<script src="/resources/images/assets/js/jquery.scrollex.min.js"></script>
	<script src="/resources/images/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/images/assets/js/browser.min.js"></script>
	<script src="/resources/images/assets/js/breakpoints.min.js"></script>
	<script src="/resources/images/assets/js/util.js"></script>
	<script src="/resources/images/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries=services"></script>
	<!-- user function -->
	<script src="/resources/xdmin/js/validationXdmin.js"></script>
	<script type="text/javascript">
	
		var goUrlInst = "/signUpInst";    /* # -> */
		
		var form = $("form[name=signUpForm]");
		var seq = $("input:hidden[name=shSeq]");
	
		
		
		validationInst = function() {
			if(!checkId('id', 2, 0, "영대소문자,숫자,특수문자(-_.),4~20자리만 입력 가능합니다")) return false;
			if(!checkPassword('password', 2, 0, "영대소문자,숫자,특수문자(!@#$%^&*),8~20자리 조합만 입력 가능합니다")) return false;
			if(!checkPasswordAndRe('password', 2, "패스워드가 일치하지 않습니다")) return false;
		}
		
		/* 프로필 이미지 */
		/* id 가 imgFile인것이 내용이 바뀌면 filename 은 imgfile 의 값이 들어가고
		   id 가 .upload-name 인것의 val값이 filename으로 들어간다*/
		$("#imgFile").on('change',function(){
			var fileName = $("#imgFile").val();
			$(".upload-name").val(fileName);
		});
		
		
		
		/* datepicker */
		$( function() {
		  	$( "#datepicker" ).datepicker({
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
		    	prevText: '이전 달', // prev 아이콘 툴팁
		    	autoSize: true
		  	});
		} );
		
		
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
	    
		function selectAll(selectAll)  {
			const checkboxes 
				= document.getElementsByName("agree");
			
			checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
			})
		};
		
		
		$("#passwordRe").on("focusout", function(){
			if($('#password').val() == $('#passwordRe').val()) {
				$("#pwCheck").text("패스워드가 일치합니다.");
				$("#pwCheck").css("color", "lightgreen");	
			} else {
				$("#pwCheck").text("패스워드가 일치하지 않습니다.");
				$("#pwCheck").css("color", "red");
				$('#passwordRe').val(""); 
				$('#password').focus(); 
				return false;
			}
		});
		
		
		
		
		
		
		
		/* $("#passwordRe").on("focusout", function(){
			$("#pwCheck").text("패스워드가 일치합니다. OuO");
			$("#pwCheck").css("color", "lightgreen");
		} else {
			$("#pwCheck").text("패스워드가 일치하지 않습니다. XnX");
			$("#pwCheck").css("color", "red");
			$('#password').val(""); 
			$('#passwordRe').val(""); 
			$('#password').focus(); 
			return false;
		}); */
		
		/* === checkId === */
		$("#id").on("focusout", function(){ 
			
			validationTest
			
			if(!checkId('id', 2, 0, "영대소문자, 숫자, 특수문자(-_.), 4~10자리만 입력 가능합니다")) {
				return false;
			} else {
				$.ajax({
					url: "/member/checkId",
					type: "post",
					dataType:"json",
					data : { id : $("#id").val()}
					,success: function(response) {
						if(response.rt == "success") {
							$("#id").classList.add('is-valid');
							$("#idFeedback").classList.remove('invalid-feedback')
							$("#idFeedback").classList.add('valid-feedback');
							$("#idFeedback").innerText = "사용가능한 아이디입니다.";
							/* $('#idAllowedNy').value = 1; */
							
							/* $("#id_check").text("사용가능한 아이디입니다.");
							$("#id_check").css("color", "lightgreen"); */
						} else if(response.rt == "fail") {
							$("#id").classList.add('is-valid');
							$('#idFeedback').classList.remove('valid-feedback');
							$("#idFeedback").classList.add('invalid-feedback');
							$('#idFeedback').innerText = "이미 사용중인 아이디입니다.";
							/* $("#idAllowedNy").value = 0; */
							
							/* $("#id").val("");
							$("#id_check").text("이미 사용중인 아이디입니다.");
							$("#id_check").css("color", "red");
							$("#id").focus(); */
						}
					}
					,error : function(){
						alert("ajax error....");
					} 
				});
			}
		});
		
		
	
		
		
		$('#signUp').on("click", function () {
			
			var valName = $('#name').val();
			var valId = $('#id').val();
			var valPassword = $('#password').val();
			var valPasswordRe = $('#passwordRe').val();
			var valEmail = $('#email').val();
			var idCheck = $('#id_check').attr('id_check');
			var valGender = $('#gender').val();
			var valJob = $('#job').val();
			var valDob = $('#datepicker').val();
			var valTelecom = $('#telecom').val();
			var valPhoneNumber = $('#phoneNumber').val();
			var valZipcode = $('#zipcode').val();
			var valAddress = $('#address').val();
			var valAddress_detail = $('#address_detail').val();
			var valEmail = $('#email').val();
			var valWay_to_regist = $('#way_to_regist').val();
			
			
			if(valId == null || valId == undefined || valId == ""){ 
				alert('아이디를 입력해주세요.'); 
				$('#id').focus();  
				return false;
				}
			if(idCheck == "" || idCheck == "N"){
				alert('아이디 중복확인를 해주세요');
				$('#idCheck').focus(); 
				return false;
				}
			if(valPassword == null || valPassword == undefined || valPassword == ""){ 
				alert('패스워드을 입력해주세요.'); 
				$('#password').focus(); 
				return false;
				} 
			if(valPasswordRe == null || valPasswordRe == undefined || valPasswordRe == ""){ 
				alert('패스워드 확인을 입력해주세요.'); 
				$('#passwordRe').focus(); 
				return false;
				} 
			if(valPassword != valPasswordRe){ 
				alert('패스워드와 패스워드 확인이 같지 않습니다.');
				$('#passwordRe').val(""); 
				$('#passwordRe').focus(); 
				return false;
				}
			if(valName == null || valName == undefined || valName == ""){ 
				alert('이름을 입력해주세요.'); 
				$('#name').focus(); 
				return false;
				} 
			if(valGender == null || valGender == undefined || valGender == "") {
				alert('성별을 선택해주세요.')
				$('#gender').focus();
				return false;
			}
			if(valJob == null || valJob == undefined || valJob == "") {
				alert('직업을 입력해주세요.')
				$('#job').focus();
				return false;
			}
			if(valDob == null || valDob == undefined || valDob == "") {
				alert('생년월일을 입력해주세요.')
				$('#dob').focus();
				return false;
			}
			if(valTelecom == null || valTelecom == undefined || valTelecom == "") {
				alert('통신사를 선택해주세요.')
				$('#telecom').focus();
				return false;
			}
			if(valPhoneNumber == null || valPhoneNumber == undefined || valPhoneNumber == ""){
				alert('휴대전화 번호를 입력해주세요.')
				$('#phoneNumber').focus();
				return false;
			}
			if(valZipcode == null || valZipcode == undefined || valZipcode == "") {
				alert('우편번호를 입력해주세요.')
				$('#zipcode').focus();
				return false;
			}
			if(valAddress == null || valAddress == undefined || valAddress == "") {
				alert('주소를 입력해주세요.')
				$('#address').focus();
				return false;
			}
			if(valAddress_detail == null || valAddress_detail == undefined || valAddress_detail == "") {
				alert('상세주소를 입력해주세요.')
				$('#address_detail').focus();
				return false;
			}
			if(valEmail == null || valEmail == undefined || valEmail == ""){ 
				alert('이메일을 입력해주세요.'); 
				$('#email').focus(); 
				return false;
			}
			if(valWay_to_regist == null || valWay_to_regist == undefined || valWay_to_regist == ""){ 
				alert('가입경로를 선택해주세요.'); 
				$('#way_to_regist').focus(); 
				return false;
			}
			
			form.attr("action", goUrlInst).submit();

			alert("SportsMate 회원가입을 축하합니다!");
		});
		
		
		
		
		
		$("#checkPhone").on("click", function() {
			
			$.ajax({
				url:"/member/checkPhone"
				,type:"post"
				,dataType:"json"
				,data: {
					phoneNumber : $("#phoneNumber").val()
				}
				,success : function(result) {
					$("#phonecheckcode").val(result.code);
				}
				,error : function(){
					alert("ajax error...");
				}
				
			});
		});
		
		$("#authNumb").on("click", function(){
			if($('#phCerti').val() == $('#phonecheckcode').val()) {
				$("#phone_check").text("인증번호가 일치합니다.");
				$("#phone_check").css("color", "lightgreen");	
			} else {
				$("#phone_check").text("인증번호가 일치하지 않습니다.");
				$("#phone_check").css("color", "red");
				$('#phCerti').val(""); 
				$('#phCerti').focus(); 
				return false; 
			}
		});
	</script>
	
	<script>
		upload = function (objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
			
			var totalFileSize = 0;
			var obj = $("#" + objName)[0].files;
			var fileCount = obj.length;
			
			if (uiType == 3) {
				
				var fileReader = new FileReader();
				fileReader.readAsDataURL($("#" + objName)[0].files[0]);
				
				fileReader.onload = function() {
					$("#imgProfile").attr("src", fileReader.result);
				}
			} return false;
		}
	</script>
</body>

</html>