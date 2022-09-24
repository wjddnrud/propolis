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
			<section class="wrapper style5">
				<div class="inner">
					<section>
						<!-- <h2>회원가입</h2> -->
						<form method="post" action="#">
							<div class="row gtr-uniform">
								<div class="col-6 col-4-medium">
									<label for="id">ID</label>
									<input type="text" name="id" id="id" value="" placeholder="영문,숫자 5~10자" />
									<span id="id_check"></span>
									<!-- <input type="button" class="primary" value="중복확인" style="margin-top: 10px;" /> -->
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="password">PASSWORD</label>
									<input type="password" name="password" id="password" value="" placeholder="숫자,영문,특수문자 조합 최소 8자" />
									<input type="password" name="passwordRe" id="passwordRe" value="" placeholder="비밀번호 재입력" style="margin-top: 10px;" />
									<span id="pwCheck"></span>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="name">이름</label>
									<input type="text" name="name" id="name" value="" placeholder="" />
								</div>
								<div class="col-6">
									<label for="gender">성별</label>
									<select name="gender" id="gender">
										<option value="">- 선택 -</option>
										<option value="1">남성</option>
										<option value="2">여성</option>
										<option value="3">기타</option>
									</select>
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="job">직업</label>
									<input type="text" name="job" id="job" value="" placeholder="" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="dob">생년월일</label>
									<input type="text" name="dob" id="dob" value="" placeholder="ex)19951027(년도월일)" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="phone">휴대전화</label>
									<input type="text" name="phone" id="phone" value="" placeholder="'-'없이 번호만 입력해주세요." />
									<input type="button" class="primary" value="인증번호 전송" style="margin-top: 10px;" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="name">휴대전화 인증</label>
									<input type="text" name="name" id="name" value="" placeholder="인증번호를 입력해주세요." />
									<input type="button" class="primary" value="확인" style="margin-top: 10px;" />
								</div>
								
								<div class="col-8 col-12-xsmall">
									<label for="address">주소</label>
									<input type="text" name="address" id="address" value="" placeholder="주소" />
									<input type="text" name="address" id="address" value="" placeholder="상세주소" style="margin-top: 10px;" />
								</div>
								<div class="col-4 col-12-xsmall">
									<label for="address">Zip Code</label>
									<input type="text" name="address" id="address" value="" placeholder="우편번호" />
									<input type="button" class="primary" value="주소 검색" style="margin-top: 10px;" />
								</div>
								<div class="col-6 col-12-xsmall">
									<label for="email">Email</label>
									<input type="text" name="email" id="email" value="" placeholder="Email@example.com" />
									<span>계정 분실 시 본인인증 정보로 활용됩니다.</span>
								</div>
								<div class="col-6">
									<label for="name">가입경로</label>
									<select name="route" id="route">
										<option value="">- 선택 -</option>
										<option value="1">지인추천</option>
										<option value="1">인터넷 광고</option>
										<option value="1">유튜브</option>
										<option value="1">블로그</option>
									</select>
								</div>
								<div class="col-12 col-12-small" style="padding-top: 80px;">
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
								</div>
								<div class="col-12">
									<ul class="actions fit" style="padding-top: 60px;">
										<li><input type="reset" value="Reset" /></li>
										<!-- <li><input type="submit" value="Sign-up" class="primary" /></li> -->
										<li><a id="signUp" class="button primary" href="/signIn" onclick="signUp()">sign-up</a></li>
										<li><input type="button" value="cancle" onclick="location.href='/signIn'" /></li>
									</ul>
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
	<script>
		function selectAll(selectAll)  {
			const checkboxes 
				= document.getElementsByName("agree");
			
			checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
			})
		};
		
		
		$("#passwordRe").on("focusout", function(){
			if($('#password').val() == $('#passwordRe').val()) {
				$("#pwCheck").text("패스워드가 일치합니다. OuO");
				$("#pwCheck").css("color", "lightgreen");	
			} else {
				$("#pwCheck").text("패스워드가 일치하지 않습니다. XnX");
				$("#pwCheck").css("color", "red");
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
		/* keyup : 한자씩 검사 */
		$("#id").on("focusout", function(){ 
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/member/checkId"
				/* ,data : $("#formLogin").serialize() */
				,data : { "id" : $("#id").val() }
				,dataType : 'json'
				,success: function(response) {
					if(response.rt == "success") {
						$("#id_check").text("사용가능한 아이디입니다. OuO");
						$("#id_check").css("color", "lightgreen");
					} else {
						$("#id_check").text("이미 사용중인 아이디입니다. XnX");
						$("#id_check").css("color", "red");
					}
				}
			});
		});
		
		$('#signUp').on("click", function() {
			alert("SportsMate 회원가입을 축하합니다!");
			
			var valName = $('#name').val();
			var valId = $('#id').val();
			var valPassword = $('#password').val();
			var valPasswordRe = $('#passwordRe').val();
			var valEmail = $('#email').val();
			var idCheck = $('#id_check').attr('id_check');
			var valGender = $('#gender').val();
			var valJob = $('#job').val();
			var valDob = $('#dob').val();
			var valPhoneNumber = $('#phoneNumber').val();
			var valAddress = $('#address_detail').val();
			var valWayRed = $('#wayReg').val();
			
			
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
				alert('성명을 입력해주세요.'); 
				$('#name').focus(); 
				return false;
				} 
			if(valEmail == null || valEmail == undefined || valEmail == ""){ 
				alert('이메일을 입력해주세요.'); 
				$('#email').focus(); 
				return false;
				}
			/* if(!$('.gender').prop('checked')){ alert('성별을 체크해주세요.'); $('.gender')[0].focus(); return false;} */
			/* $('#login').submit(); */
			
		});
	</script>
</body>

</html>