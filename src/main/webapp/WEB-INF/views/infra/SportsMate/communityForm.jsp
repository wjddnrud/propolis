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
		<title>CommunityForm</title>
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
							<p>공유할 정보나 궁금한것들을 글로 작성해보세요.</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">


								<section>
									<!-- enctype이 있어야 multipartfile 데이터를 바인딩 할수 있따!! 중요중요 -->
									<form name="communityForm" enctype="multipart/form-data" method="post">
										<div class="row gtr-uniform">
											<div class="col-4 col-12-xsmall">
												<select id="category" name="category">
													<option value="">카테고리</option>
													<option value="1">Diet</option>
													<option value="2">Weight</option>
													<option value="3">Food</option>
												</select>
											</div>
											<!-- hidden input -->
											<input type="hidden" id="writer" name="writer" value="${sessSeq}">
											<input type="hidden" id="seq" name="seq" value="${one.seq}">
											<div class="col-8 col-12-xsmall">
												<input id="title" name="title" type="text" placeholder="제목을 입력해주세요.">
											</div>
											
											<div id="ifmmUploadedImage1View" class="col-8 col-12-xsmall filebox">
												<input class="upload-name" placeholder="첨부파일">
												<label for="imgFile" style="margin: 0; padding-top: 5px; background-color: rgb(240, 240, 240); color: rgb(100, 100, 100);  ">파일찾기</label>
												<input id="imgFile" name="multipartFile" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);">
											</div>
											<div class="col-4">
												<img id="imgProfile" src="" alt="이미지" style="padding-top: 10px; width:100px; height:100px; border-color: solid black 2px;">
											</div>
											
											<div class="col-12">
												<textarea id="contents" name="contents" placeholder="여기에 내용을 입력해주세요." rows="15"></textarea>
											</div>
											<div class="col-12">
												<ul class="actions" style="justify-content: center;">
													<li><input type="reset" value="Reset"></li>
													<li><a id="btnSave" class="button primary">Sign-up</a></li>
													<!-- <li><button type="submit" class="button primary">Sign-up(제출)</button></li> -->
													<li><a href="/community/communityList" class="button">Cancle</a></li>
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

			<script type="text/javascript">
				var goUrlList = "/community/communityList";    /* # -> */
				var goUrlInst = "/community/communityInst";    /* # -> */
				var goUrlUpdt = "/community/communityUpdt";    /* # -> */
				var goUrlUele = "/community/communityUele";    /* # -> */
				var goUrlDele = "/community/communityDele";    /* # -> */
				
				var form = $("form[name=communityForm]");
			
			
				$("#imgFile").on('change',function(){
					var fileName = $("#imgFile").val();
					$(".upload-name").val(fileName);
				});
				
				/* 등록 버튼 */
				$("#btnSave").on("click", function() {
					
					if(document.getElementById('category').value == "") {
						alert("카테고리를 선택해주세요.");
						
						document.getElementById("category").value="";
						document.getElementById("category").focus();
						
						return false;
					}
					
					if($('#title').val() == 0) {
						alert("글 제목을 입력해주세요.");
						
						$("#title").val()=0;
						$("#title").focus();
						
						return false;
					}
					
					if(document.getElementById('contents').value == "") {
						alert("글 내용을 입력해주세요.");
						
						document.getElementById("contents").value="";
						document.getElementById("contents").focus();
						
						return false;
					}
					form.attr("action", goUrlInst).submit();
					
					var seq = $("input:hidden[name=seq]");
					
					/* seq값에 따른 등록 or 수정 */
					if(seq.val() == "0" || seq.val() == ""){
						//insert
						/* if(validationInst() == false) return false; */
						form.attr("action", goUrlInst).submit();
					} else {
						//update
						/* keyName.val(atob(keyName.val())); */
						/* if(validationUpdt() == false) return false; */
						form.attr("action", goUrlUpdt).submit();
					}
					
				});
				
			</script>
				
				
			<script>
				upload = function (objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
			        //		objName 과 seq 는 jsp 내에서 유일 하여야 함.
			        //		memberProfileImage: 1
			        //		memberImage: 2
			        //		memberFile : 3

			        var totalFileSize = 0;
			        var obj = $("#" + objName + "")[0].files;
			        var fileCount = obj.length;
			        
			        if (uiType == 1) {
			            /* 			
			                        $("#ulFile" + seq).children().remove();
			                    	
			                        for (var i = 0 ; i < fileCount ; i++) {
			                            addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
			                        }
			             */
			            for (var i = 0; i < fileCount; i++) {

			                var divImage = "";
			                divImage += '<div style="display: inline-block; height: 95px;">';
			                /*divImage += '	<img src="' + obj[i] + '" class="rounded" width= "85px" height="85px">';*/
			                divImage += '<img id="aaa' + i + '" src="" class="rounded" width= "85px" height="85px">';
			                divImage += '<div style="position: relative; top:-85px; left:5px"><span style="color: red;">X</span></div>';
			                divImage += '</div> ';

			                $("#ifmmUploadedImage1View").append(divImage);

			                var fileReader = new FileReader();
			                fileReader.readAsDataURL($("#" + objName + "")[0].files[i]);
			                //alert($("#" + objName + "")[0].files[i]);
			                fileReader.onload = function () {
			                    /* alert(i + " : " + fileReader.result); */
			                    //alert($("#aaa" + i + ""));

			                    if (i == 0) {
			                        $("#aaa0").attr("src", fileReader.result);		/* #-> */
			                    } else if (i == 1) {
			                        $("#aaa0").attr("src", fileReader.result);		/* #-> */
			                    } else {

			                    }
			                    /* $("#aaa"+i+"").attr("src", fileReader.result);		/* #-> */
			                    /* $("#aaa1").attr("src", fileReader.result);		/* #-> */
			                }
			            }

			        } else if (uiType == 2) {
			            $("#ulFile" + seq).children().remove();

			            for (var i = 0; i < fileCount; i++) {
			                addUploadLi(seq, i, $("#" + objName + "")[0].files[i].name);
			            }
			        } else if (uiType == 3) {
			            var fileReader = new FileReader();
			            fileReader.readAsDataURL($("#" + objName + "")[0].files[0]);

			            fileReader.onload = function () {
			                $("#imgProfile").attr("src", fileReader.result);		/* #-> */
			            }
			        } else {
			            return false;
			        }
			        return false;
			    }
			</script>
	</body>
</html>