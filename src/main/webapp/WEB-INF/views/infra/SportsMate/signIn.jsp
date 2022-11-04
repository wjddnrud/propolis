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
		<title>SingIn</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
    	<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/"> -->
	</head>
	<body class="sign is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header 상단 고정 네비바 -->
				<!-- <header id="header" class="alt">
					<h1><a href="/signIn">Sports Mate</a></h1>
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
				</header> -->

				<!-- Banner 메인화면 처음 모션부분 -->
				<!-- <section id="banner"> -->
				<form name="signIn">
				
				<form name="form">
					<input type="hidden" name="name"/>
					<input type="hidden" name="email"/>
					<input type="hidden" name="gender"/>
					<input type="hidden" name="dob"/>
				</form>
					<section id="banner">
						<div class="inner">
							<h2>Sports Mate</h2>
							<p>만나서 반갑습니다!<br /></p>
							<section class="wrapper style6">
								<div class="inner">
									<section>
										<div class="row gtr-uniform">
											<div class="col-12">
												<h1 class="mb-1 fw-normal"><b>Please sign in</b></h1>
											</div>
											<div class="col-12 col-12-xsmall">
												<center>
													<input name="id" id="id" type="text" placeholder="ID" onkeyup="enterKey()" style="width: 300px;">
												</center>
											</div>
											<div class="col-12 col-12-xsmall">
												<center>
													<input name="password" id="password" type="password" onkeyup="enterKey()" placeholder="PASSWORD" style="width: 300px;">
												</center>
											</div>
											<!-- <div class="col-6 col-12">
												<input type="checkbox" id="checkbox" name="checkbox">
												<label for="checkbox">Remember</label>
											</div> -->
											<div class="col-12">
												<ul class="actions stacked">
													<li><input type="button" value="Sign-in" class="button primary small" id="signIn" onclick="signIn()"></li>
													<li><input type="button" class="button small" value="Sign-up" id="signUp" onclick="location.href='/signUp'" style="background-color: aliceblue;"></li>
												</ul>
											</div>
											<div class="d-grid gap-2 mt-3">
												<ul class="actions stacked">
													<li><a class="button primary small" id="naverBtn">Naver</a></li>
													<li><a class="button small" id="kakaoBtn">Kakao</a></li>
												</ul>
											</div>
										</div>
									</section>
								</div>
							</section>
						</div>
					</section>
				</form>

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
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    <!-- alert창 꾸미기 -->
			<script type="text/javascript">
			
				var goUrlMain = "/main";
				var form = $("form[name=signIn]");
			
				/* === singInCheck === */
				$("#signIn").on("click", function(){ 
					
					if(document.getElementById('id').value == '' || document.getElementById('id').value == null) {
						alert("아이디를 입력해주세요.");
						
						document.getElementById("id").value="";
						document.getElementById("id").focus();
						
						return false;
					}
					
					if(document.getElementById('password').value == '' || document.getElementById('password').value == null) {
						alert("비밀번호를 입력해주세요.");
						
						document.getElementById("password").value="";
						document.getElementById("password").focus();
						
						return false;
					}
					
					$.ajax({
						async: true 
						,cache: false
						,type: "post"
						,dataType:"json"
						,url: "/signInCheck"
						/* ,data : $("#formLogin").serialize() */
						,data : { "id" : $("#id").val(), "password" : $("#password").val() }
						,success: function(response) {
							if(response.rt == "success") {
								swal("로그인 성공!", response.name + " 회원님 로그인되었습니다.", "success")
								.then(function() {
									if(response.adminNY == 1) {
										location.href="/main";  //일반 사용자
									} else {
										location.href="/classify";   //관리자
									}
								});
							} else {
								swal("로그인 실패!", "계정이 존재하지 않습니다. 다시 확인해 주세요.", "error");
								return false;
							}
						}
						,error : function(){
							alert("error");
						} 
					});
				});
				
				enterKey = function() {
					
					var keycode = event.keyCode;
					
					if(keycode == 13) {
						if(document.getElementById('id').value == '' || document.getElementById('id').value == null) {
							alert("아이디를 입력해주세요.");
							
							document.getElementById("id").value="";
							document.getElementById("id").focus();
							
							return false;
						}
						
						if(document.getElementById('password').value == '' || document.getElementById('password').value == null) {
							alert("비밀번호를 입력해주세요.");
							
							document.getElementById("password").value="";
							document.getElementById("password").focus();
							
							return false;
						}
						
						$.ajax({
							async: true 
							,cache: false
							,type: "post"
							,dataType:"json"
							,url: "/signInCheck"
							/* ,data : $("#formLogin").serialize() */
							,data : { 
								"id" : $("#id").val(), 
								"password" : $("#password").val() 
							}
							,success: function(response) {
								if(response.rt == "success") {
									swal("로그인 성공!", response.name + " 회원님 로그인되었습니다.", "success")
									.then(function() {
										if(response.adminNY == 1) {
											location.href="/main";  //일반 사용자
										} else {
											location.href="/codegroup/codeGroupList";   //관리자
										}
									});
								} else {
									swal("로그인 실패!", "계정이 존재하지 않습니다. 다시 확인해 주세요.", "error");
									return false;
								}
							}
							,error : function(){
								alert("error");
							} 
						});
					}
				}
			</script>
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				/* 카카오 로그인 s */
				
				Kakao.init('72452dcf97f9180781a4d13ee6bef707'); // test 용
		    	console.log(Kakao.isInitialized());
		/*     	Kakao.init('ec2655da82c3779d622f0aff959060e6');
		    	console.log(Kakao.isInitialized()); */
		    	
		    	$("#kakaoBtn").on("click", function() {
		    		/* Kakao.Auth.authorize({
		   		      redirectUri: 'http://localhost:8080/member/kakaoCallback',
		   		    }); */
		    		
		    		Kakao.Auth.login({
		   		      success: function (response) {
		   		        Kakao.API.request({
		   		          url: '/v2/user/me',
		   		          success: function (response) {
		   		        	  
		   		        	  var accessToken = Kakao.Auth.getAccessToken();
		   		        	  Kakao.Auth.setAccessToken(accessToken);
	
		   		        	  var account = response.kakao_account;
		   		        	  
		   		        	  console.log(response)
		   		        	  console.log("email : " + account.email);
		   		        	  console.log("nickname : " + account.profile.nickname);
		   		        	  console.log("picture : " + account.profile.thumbnail_image_url);
		   		        	  console.log("picture : " + account.gender);
		   		        	  console.log("picture : " + account.birthday);
		   		        	  console.log("picture : " + account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length));
		  	        	  
			  	        	 /*  $("form[name=form]").attr("action", "/member/kakaoLoginProc").submit(); */
			  	        	 
			  	        	  $.ajax({
								async: true
								,cache: false
								,type:"POST"
								,url: "/kakaoLoginProc"
								,data: {
									id : account.email
									,name : account.profile.nickname
									,dob : account.birthday
									,gender : account.gender == 'male'? 1 : 2
									,email : account.email
								}
								,success : function(response) {
									if (response.rt == "fail") {
										alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
										return false;
									} else {
										location.href = "/main";
									}
								},
								error : function() {
									alert("ajax error");
								}
							});
		   		          },
		   		          fail: function (error) {
		   		            console.log(error)
		   		          },
		   		        })
		   		      },
		   		      fail: function (error) {
		   		        console.log(error)
		   		      },
		   		    })
				});
		    	
		    	/* 카카오 로그인 e */
			</script>
	</body>
</html>