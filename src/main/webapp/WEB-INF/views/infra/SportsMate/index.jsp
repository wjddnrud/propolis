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
		<title>Sports Mate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- CSS only -->
		<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<style type="text/css">
		div {
			display: block;	
		}
		.container {
			 margin-top: 120px;
			 margin-left: auto;
			 margin-right: auto;
			 text-align: center;
		}
		.xdmin {
			width: 480px;
			height: 700px;
			background-color:rgba(0, 0, 0, 0.8);
			border-radius: 15px;
			margin: 0px 50px 0px 10px;
		}
		.user {
			width: 480px;
			height: 700px;
			background-color:rgba(0, 0, 0, 0.8);
			border-radius: 15px;
			margin: 0px 10px 0px 50px;
		}
		.xdmintitle{
			font-size: 50px;
			margin: 50px 0px 50px 0px;
			color: white;
		}
		.usertitle {
			font-size: 50px;
			margin: 50px 0px 50px 0px;
			color: white;
		}
		img {
			max-width: 100%; 
			height: auto;
		}
		.rmf {
			margin-top: 40px;
			margin-bottom: 50px;
			font-size: 25px;
			color: white;
		}
		.btn {
			background-color: orange;
			color: white;
			border: 2px solid transparent;
			font-weight: bold;
			padding: 20px 50px;
			border-radius: 20px;
			transition: transform .4s;
		}
		.btn:hover {
			background-color: transparent;
			border: 2px solid #FAB150;
			cursor: pointer;
			color: #FAB150;
		}
	</style>
	</head>
	<body style="background-image: url('/resources/images/images/러닝2.jpg'); background-size: cover;">
		<div class="container">
			<div class="row">
				<div class="col user">
					<div class="row">
						<div class="col usertitle">사용자</div>
					</div>
					<div class="row">
						<div class="col">
							<img alt="" src="/resources/images/images/user화면.jpg">
						</div>
					</div>
					<div class="row">
						<div class="col rmf">홈/게시판/메이트 매칭</div>
					</div>
					<div class="row">
						<div class="col">
							<button type="button" class="btn" id="goHome" onclick="userBtn()">들어가기</button>
						</div>
					</div>
				</div>
				
				<div class="col xdmin">
					<div class="row">
						<div class="col xdmintitle">관리자</div>
					</div>
					<div class="row">
						<div class="col">
							<img alt="" src="/resources/images/images/admin화면.jpg">
						</div>
					</div>
					<div class="row">
						<div class="col rmf">회원관리/코드관리/코드그룹관리</div>
					</div>
					<div class="row">
						<div class="col">
							<button type="button" class="btn" id="goXdmin" onclick="adminBtn()">들어가기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
			
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		adminBtn = function() {
			location.href = "/signIn";
		} 
		
		userBtn = function() {
			location.href = "/signIn";
		} 
	</script>
	</body>
</html>