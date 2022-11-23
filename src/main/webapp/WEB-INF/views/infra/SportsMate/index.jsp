<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE HTML>
<html>
<head>
	<title>Sports Mate</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="icon" href="/resources/images/images/favicon.ico">
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
		<form id="indexForm">
		
			<!-- adminNY로 user와 admin 구분하는 값을 받아감 -->
			<input type="hidden" id="adminNY" name="adminNY">
			
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
								<button type="button" class="btn" id="goHome" onclick="goLogin(0)">들어가기</button>
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
								<button type="button" class="btn" id="goXdmin" onclick="goLogin(1)">들어가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
			
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script>
		goLogin = function(adminNY) {
			$("#adminNY").val(adminNY);
			$("#indexForm").attr("action", "/signIn").submit();
		}
		
		/* classify = function (seq) { 
			return function(event) {
				
				var divImage = "";
				divImage += '<div id="imgDiv_'+type+'_'+ sort +'" style="display: inline-block; height: 95px;">';
				divImage += '	<img src="'+ imageFile.result +'" class="rounded" width= "85px" height="85px">';
				divImage += '	<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv(0,' + type +','+ sort +')">X</span></div>';
				divImage += '</div> ';
				
				filePreview.append(divImage);
		    };
		} */
	</script>
	</body>
</html>