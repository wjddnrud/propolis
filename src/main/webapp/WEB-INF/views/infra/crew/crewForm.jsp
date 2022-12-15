<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE HTML>
<html>
	<head>
		<title>CrewForm</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/images/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/resources/images/assets/css/noscript.css" /></noscript>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
							<h2>findMate</h2>
							<p>새로운 크루를 만들어 mate를 모집하세요.</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">

								

								<section>
									<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
									<c:set var="listCodeSports" value="${CodeServiceImpl.selectListCachedCode('6')}"/>
								
									<form name="crewForm" enctype="multipart/form-data" method="post">
										
										<!-- 그룹 생성자 (그룹장) -->
										<input type="hidden" value="${sessSeq}" name="mmSeq" id="mmSeq">
										<input type="hidden" name="crLeaderNy" value="1">
										<!-- crew seq를 받는지 확인하는 input 작성으로 들어오면 null view에서 수정으로 들어오면 게시물 seq값이 들어옴 -->
										<input type="hidden" name="seq" id="seq">
										
										<div class="row gtr-uniform">
											<center>
												<div class="col-4">
													<div class="col-4">
														<img id="imgProfile" src="" alt="프로필 이미지" style="padding-top: 10px; width:300px; height:300px; border-color: solid black 2px;">
													</div>
													<div id="ifmmUploadedImage1View" class="col-8 col-12-xsmall filebox">
														<input class="upload-name" placeholder="첨부파일">
														<label for="imgFile" style="margin: 0; padding-top: 5px; background-color: rgb(240, 240, 240); color: rgb(100, 100, 100);  ">파일찾기</label>
														<input id="imgFile" name="multipartFile" type="file" onChange="upload('imgFile', 0, 1, 1, 0, 0, 3);">
													</div>
												</div> 
											</center>
											<div class="col-4 col-12-xsmall">
												<%-- <select name="sports" id="sports">
													<c:forEach items="${sports}" var="sports" varStatus="statusSports">
														<option value="${sports.seq}" <c:if test="${one.sports eq sports.cc_key }">selected</c:if>><c:out value="${sports.cc_name }"/></option>
													</c:forEach>												
												</select> --%>
												<select name="sports" id="sports">
													<option value="0">운동종목</option>
													<option value="1" <c:if test="${one.sports eq 2 }" >selected</c:if>>축구</option>
													<option value="2" <c:if test="${one.sports eq 2 }" >selected</c:if>>농구</option>
													<option value="3" <c:if test="${one.sports eq 3 }" >selected</c:if>>야구</option>
													<option value="4" <c:if test="${one.sports eq 4 }" >selected</c:if>>족구</option>
													<option value="5" <c:if test="${one.sports eq 5 }" >selected</c:if>>배드민턴</option>
													<option value="6" <c:if test="${one.sports eq 6 }" >selected</c:if>>런닝</option>
													<option value="7" <c:if test="${one.sports eq 7 }" >selected</c:if>>사이클</option>
													<option value="8" <c:if test="${one.sports eq 8 }" >selected</c:if>>테니스</option>
													<option value="9" <c:if test="${one.sports eq 9 }" >selected</c:if>>골프</option>
												</select>
											</div>
											<div class="col-8 col-12-xsmall">
												<input type="text" name="crewName" id="crewName" value=""${one.crewName } placeholder="크루명을 입력해주세요." >
											</div>
											
											
											<div class="col-5 col-12-xsmall">
												<!-- <label for="address">주소</label> -->
												<input type="text" name="address" id="address" value="" placeholder="도로명주소" />
												<input type="text" name="address_detail" id="address_detail" value="" placeholder="상세주소" style="margin-top: 10px;" />
											</div>
											<div class="col-5 col-12-xsmall">
												<!-- <label for="address">주소</label> -->
												<input type="text" name="jibunAddress" id="jibunAddress" value="" placeholder="지번주소" />
												<input type="text" name="location" id="location" value="${one.location }" placeholder="참고주소" style="margin-top: 10px;" />
											</div>
											<div class="col-2 col-12-xsmall">
												<!-- <label for="zipcode">Zip Code</label> -->
												<input type="text" name="zipcode" id="zipcode" value="" placeholder="우편번호" />
												<input type="button" onclick="searchAddress()" class="primary" value="주소 검색" style="margin-top: 10px;" />
											</div>
											
											<div class="col-3 col-12-xsmall">
												<input name="playDate" id="playDate" type="text" value="${one.playDate }" placeholder="모임날짜">
											</div>	
											<div class="col-3 col-12-xsmall">
												<input type="text" name="startTime" id="startTime" value="${one.startTime }" placeholder="시작시간 ex) 13" />
											</div>
											<div class="col-3 col-12-xsmall">
												<input type="text" name="endTime" id="endTime" value=""${one.endTime } placeholder="종료시간 ex) 15" />
											</div>
											<div class="col-3 col-12-xsmall">
												<input type="text" name="crewMemberNum" id="crewMemberNum" value="${one.crewMemberNum }" placeholder="인원 (명)" />
											</div>
											
											<div class="col-12">
												<textarea name="detail" id="detail" value="${one.detail }" placeholder="여기에 그룹의 자세한 내용을 입력해주세요." rows="15"></textarea>
											</div>
											<div class="col-12">
												<ul class="actions" style="justify-content: center;">
													<li><input type="reset" value="Reset"></li>
													<li><a id="btnSave" class="button primary">Sign-up</a></li>
													<!-- <li><button type="submit" class="button primary">Sign-up(제출)</button></li> -->
													<li><a href="/crew/crewList" class="button">Cancle</a></li>
												</ul>
											</div>
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
			<!-- 카카오 주소검색 -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
			<script type="text/javascript">
			
				var goUrlList = "/crew/crewList";    /* # -> */
				var goUrlInst = "/crew/crewInst";    /* # -> */
				var goUrlUpdt = "/crew/crewUpdt";    /* # -> */
				var goUrlUele = "/crew/crewUele";    /* # -> */
				var goUrlDele = "/crew/crewDele";    /* # -> */		
				
				var form = $("form[name=crewForm]");
				var seq = $("input:hidden[name=seq]");
				
				/* 파일 첨부시 input 글씨 변경 */
				$("#imgFile").on('change',function(){
					var fileName = $("#imgFile").val();
					$(".upload-name").val(fileName);
				});
				
				/* datepicker */
				$( function() {
				  	$("#playDate").datepicker({
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
				    	prevText: '이전 달' // prev 아이콘 툴팁
				  	});
				} );
				
			
				/* 등록 버튼 */
				$("#btnSave").on("click", function() {
					
					if(document.getElementById('sports').value == "") {
						alert("운동종목을 선택해주세요.");
						
						document.getElementById("sports").value="";
						document.getElementById("sports").focus();

						return false;
					}
					
					if($('#crewName').val() == "") {
						alert("크루 이름을 입력해주세요.");
						
						$("#crewName").val()="";
						$("#crewName").focus();
						
						return false;
					}
					
					if(document.getElementById('location').value == "") {
						alert("운동 장소를 입력해주세요.");
						
						document.getElementById("location").value="";
						document.getElementById("location").focus();
						
						return false;
					}
					
					if(document.getElementById('playDate').value == "") {
						alert("운동 날짜를 입력해주세요.");
						
						document.getElementById("playDate").value="";
						document.getElementById("playDate").focus();
						
						return false;
					}
					
					if(document.getElementById('startTime').value == "") {
						alert("운동 시작시간을 입력해주세요.");
						
						document.getElementById("startTime").value="";
						document.getElementById("startTime").focus();
						
						return false;
					}
					
					if(document.getElementById('endTime').value == "") {
						alert("운동 종료시간을 입력해주세요.");
						
						document.getElementById("endTime").value="";
						document.getElementById("endTime").focus();
						
						return false;
					}
					
					if(document.getElementById('crewMemberNum').value == "") {
						alert("모집 인원을 입력해주세요.");
						
						document.getElementById("crewMemberNum").value="";
						document.getElementById("crewMemberNum").focus();
						
						return false;
					}
					
					if(document.getElementById('detail').value == "") {
						alert("크루에 대한 세부 내용을 입력해주세요.");
						
						document.getElementById("detail").value="";
						document.getElementById("detail").focus();
						
						return false;
					}
					
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
			                divImage += '	<img id="aaa' + i + '" src="" class="rounded" width= "85px" height="85px">';
			                divImage += '	<div style="position: relative; top:-85px; left:5px"><span style="color: red;">X</span></div>';
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
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function searchAddress() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zipcode').value = data.zonecode;
		                document.getElementById("address").value = roadAddr;
		                document.getElementById("jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("location").value = extraRoadAddr;
		                } else {
		                    document.getElementById("location").value = '';
		                }
		                
		             	// 커서를 상세주소 필드로 이동한다.
		                document.getElementById("address_detail").focus();
		            }
		        }).open();
		    }
		</script>
	</body>
</html>