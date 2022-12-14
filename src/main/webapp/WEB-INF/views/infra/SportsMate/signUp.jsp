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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
	<link rel="icon" href="/resources/images/images/favicon.ico">
</head>

<body class="is-preload">
	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="/resources/include/header.jsp"%>

		<!-- Main -->
		<article id="main">
			<header>
				<h2>sports Mate 회원가입</h2>
				<p>멤버가 되어 sports mate가 제공하는 다양한 정보와 친구들을 만나보세요.</p>
			</header>
			<section class="wrapper style5">
				<div class="inner" style="width: 50%;">
					<section>
						<!-- <h2>회원가입</h2> -->
						<form name="signUpForm" enctype="multipart/form-data" method="post">
							<input type="hidden" name="seq" id="seq" value="${sessSeq}">
							<input type="hidden" name="delNY">
							
							<div class="row gtr-uniform">
							
								<div id="ifmmUploadedImage1View" class="col-12 justify-content-center" class="filebox" style="text-align: center;">
									<img id="imgProfile" src="/resources/uploaded/member/noprofil.jpg" alt="이미지" style="width:150px; height:150px; border-radius: 50%;"><br>
									<input id="imgFile" name="multipartFile" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);" style="width: 101px;">
 								</div>
 								
								 
								<div class="col-6 col-4-medium">
									<label for="id">ID</label>
									<c:choose>
										<c:when test="${sessSeq eq null }">
											<input type="text" name="id" id="id" placeholder="영문,숫자 5~10자" />
										</c:when>
										<c:otherwise>
											<input type="text" name="id" id="id" value="${one.id }" readonly />
										</c:otherwise>
									</c:choose>
									<span id="id_check"></span>
									<input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="password">PASSWORD</label>
									<input type="password" name="password" id="password" placeholder="숫자,영문,특수문자 조합 최소 8자" <c:if test="${sessSeq ne null}">disabled</c:if>/>
									<input type="password" name="passwordRe" id="passwordRe" placeholder="비밀번호 재입력" style="margin-top: 10px;" <c:if test="${sessSeq ne null}">disabled</c:if>/>
									<span id="pwCheck"></span>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="name">이름</label>
									<input type="text" name="name" id="name" value="${one.name }" autocomplete="off" placeholder="" />
								</div>
								<div class="col-6">
									<label for="gender">성별</label>
									<select name="gender" id="gender" value="${one.gender}">
										<option value="">- 선택 -</option>
										<option value="1" <c:if test="${one.gender eq  1}">selected</c:if>>남성</option>
										<option value="2" <c:if test="${one.gender eq  2}">selected</c:if>>여성</option>
										<option value="3" <c:if test="${one.gender eq  3}">selected</c:if>>기타</option>
									</select>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="job">직업</label>
									<input type="text" name="job" id="job" value="${one.job }" autocomplete="off" placeholder="" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="dob">생년월일</label>     <!-- datepicker로 바꿔주기 -->
									<!-- <input type="text" name="dob" id="dob" value="" placeholder="ex)19951027(년도월일)" /> -->
									<input value="${one.dob }" autocomplete="off" class="form-control me-1" name="dob" type="text" placeholder="" id="datepicker">
								</div>
								<c:choose>
									<c:when test="${sessSeq eq null}">
										<div class="col-2">
											<label for="telecom">통신사</label>
											<select name="telecom" id="telecom" value="${one.telecom }">
												<option value="">- 선택 -</option>
												<option value="1" <c:if test="${one.telecom eq  1}">selected</c:if>>SKT</option>
												<option value="2" <c:if test="${one.telecom eq  2}">selected</c:if>>KT</option>
												<option value="3" <c:if test="${one.telecom eq  3}">selected</c:if>>LG</option>
											</select>
										</div>
										<div class="col-5 col-12-xsmall">
											<label for="phone">휴대전화</label>
											<input type="text" name="phoneNumber" id="phoneNumber" value="${one.phoneNumber }" placeholder="'-'없이 번호만 입력해주세요." />
											<input type="hidden" id="phonecheckcode">
											<input id="checkPhone" type="button" class="primary" value="인증번호 전송" style="margin-top: 10px;" />
										</div>
										<div class="col-5 col-12-xsmall">
											<label for="phCerti">휴대전화 인증</label>
											<input type="text" name="phCerti" id="phCerti" placeholder="인증번호를 입력해주세요." />
											<span id="phone_check"></span>
											<input type="button" class="primary" id="authNumb" value="확인" style="margin-top: 10px;" />
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-2">
											<label for="telecom">통신사</label>
											<select name="telecom" id="telecom" value="${one.telecom }">
												<option value="">- 선택 -</option>
												<option value="1" <c:if test="${one.telecom eq  1}">selected</c:if>>SKT</option>
												<option value="2" <c:if test="${one.telecom eq  2}">selected</c:if>>KT</option>
												<option value="3" <c:if test="${one.telecom eq  3}">selected</c:if>>LG</option>
											</select>
										</div>
										<div class="col-5 col-12-xsmall">
											<label for="phone">휴대전화</label>
											<input type="text" name="phoneNumber" id="phoneNumber" value="${one.phoneNumber }" placeholder="'-'없이 번호만 입력해주세요." />
											<input type="hidden" id="phonecheckcode">
										</div>
										<div class="col-5"></div> 
									</c:otherwise>
								</c:choose>
								
								<div class="col-4 col-12-xsmall">
									<label for="zipcode">Zip Code</label>
									<input type="text" name="zipcode" id="zipcode" value="${one.zipcode }" placeholder="우편번호" />
									<input type="button" onclick="searchAddress()" class="primary" value="주소 검색" style="margin-top: 10px;" />
								</div> 
								<div class="col-8 col-12-xsmall">
									<label for="address">주소</label>
									<input type="text" name="address" id="address" value="${one.address }" placeholder="주소" />
									<input type="text" name="address_detail" id="address_detail" value="${one.address_detail }" placeholder="상세주소" style="margin-top: 10px;" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="email">Email</label>
									<input type="text" name="email" id="email" value="${one.email }" placeholder="Email@example.com" />
									<span>계정 분실 시 본인인증 정보로 활용됩니다.</span>
								</div>
								<div class="col-6">
									<label for="way_to_regist">가입경로</label>
									<select name="way_to_regist" id="way_to_regist" value="${one.way_to_regist }">
										<option value="">- 선택 -</option>
										<option value="1" <c:if test="${one.way_to_regist eq  1}">selected</c:if>>지인추천</option>
										<option value="2" <c:if test="${one.way_to_regist eq  2}">selected</c:if>>인터넷 광고</option>
										<option value="3" <c:if test="${one.way_to_regist eq  3}">selected</c:if>>유튜브</option>
										<option value="4" <c:if test="${one.way_to_regist eq  4}">selected</c:if>>블로그</option>
									</select>
								</div>
								
								<c:choose>
									<c:when test="${sessSeq eq null}">
										<div class="col-3"></div>
										<div class="col-6">
											<ul class="actions fit" style="padding-top: 60px;">
												<li><a id="signUp" class="button primary">회원가입</a></li>
												<li><input type="button" id="cancle" value="취소"></li>
											</ul>
										</div>
										<div class="col-3"></div>
									</c:when>
									<c:otherwise>
										<div class="col-3"></div>
										<div class="col-6">
											<ul class="actions fit" style="padding-top: 60px;">
												<li><a id="signUp" class="button primary">정보수정</a></li>
												<li><input type="button" id="cancle" value="취소"></li>
											</ul>
										</div>
										<div class="col-3"></div> 
									</c:otherwise>
								</c:choose>
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72452dcf97f9180781a4d13ee6bef707&libraries=services,clusterer,drawing"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- user function -->
	<script src="/resources/xdmin/js/validationXdmin.js"></script>
	
	<script type="text/javascript">
	
		var goUrlInst = "/signUpInst";    /* # -> */
		var goUrlUpdt = "/memberUserUpdt";
		var goUrlMyPage = "/myPagePostList";
		
		var form = $("form[name=signUpForm]");
		var seq = $("input:hidden[name=seq]");
	
		
		
		/* validationInst = function() {
			if(!checkId('id', 2, 0, "영대소문자,숫자,특수문자(-_.),4~20자리만 입력 가능합니다")) return false;
			if(!checkPassword('password', 2, 0, "영대소문자,숫자,특수문자(!@#$%^&*),8~20자리 조합만 입력 가능합니다")) return false;
			if(!checkPasswordAndRe('password', 2, "패스워드가 일치하지 않습니다")) return false;
		} */
		
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
			
	 		if($("#seq").val() != null) {
				return false;
				
	 		} else { 
				$.ajax({
					url: "/member/checkId",
					type: "post",
					dataType:"json",
					data : { 
						id : $("#id").val()
						} 
					,success: function(response) {
						
						if(response.rt == "success") {
							/* $("#id").classList.add('is-valid');
							$("#idFeedback").classList.remove('invalid-feedback')
							$("#idFeedback").classList.add('valid-feedback');
							$("#idFeedback").innerText = "사용가능한 아이디입니다."; */
							/* $('#idAllowedNy').value = 1; */
							
							$("#id_check").text("사용가능한 아이디입니다.");
							$("#id_check").css("color", "lightgreen");
							
						} else if(response.rt == "fail") {
							/* $("#id").classList.add('is-valid');
							$('#idFeedback').classList.remove('valid-feedback');
							$("#idFeedback").classList.add('invalid-feedback');
							$('#idFeedback').innerText = "이미 사용중인 아이디입니다."; */
							/* $("#idAllowedNy").value = 0; */
							
							$("#id").val("");
							$("#id_check").text("이미 사용중인 아이디입니다.");
							$("#id_check").css("color", "red");
							$("#id").focus();
							
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
			
			if (seq.val() == "0" || seq.val() == ""){
		   		// insert
		   		/* if (validationInst() == false) return false; */
	 			/* setCheckboxValue($("#ifmmEmailConsent"), $("#ifmmEmailConsentNy"));
				setCheckboxValue($("#ifmmSmsConsent"), $("#ifmmSmsConsentNy")); */
		   		form.attr("action", goUrlInst).submit();
		   	} else {
		   		// update
		   		/* keyName.val(atob(keyName.val())); */
		   		// seq.remove();	html 에서 seq 보여지지 않으면 이 구문은 필요치 않다.
		   		/* if (validationUpdt() == false) return false; */
		   		form.attr("action", goUrlUpdt).submit();
		   	}
			
			Swal.fire({
				  title: 'SportsMate의 회원이 되신것을 축하합니다!',
				  showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
				})
		});
		
		$("#cancle").on("click", function() {
			if(seq.val() == "0" || seq.val() == "") {
				form.attr("action","/signIn").submit();
			} else {
				form.attr("action",goUrlMyPage).submit();
			}
		});
		
		
		/* 휴대전화 인증 s */
		
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
		
		/* 휴대전화 인증 e */
    	
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
	
	<script>
	    function searchAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
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
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                } 
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address_detail").focus();
	            }
	        }).open();
	    }
	</script>
	
	</body>

</html>