<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
    
<!-- ***** Header Area Start ***** -->

<!-- 가져온 캐시코드로 jsp단에 보여주기 -->
<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
<c:set var="listCodeCategory" value="${CodeServiceImpl.selectListCachedCode('3')}"/>


<form action="http://localhost:8080/codegroup/codeGroupSearch" name="formList" id="formList" method="post">
	
	<!-- 가져온값 뒷단에 담아주는곳 hidddn -->
	<!-- <input type="hidden" name="mainKey"> -->
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
	<!-- <input type="hidden" name="checkboxSeqArray"> -->
	<!-- <form class="d-flex" role="search"> -->
	<input type="hidden" name="shSeq">
	<input type="hidden" id="seq" name="seq" value="">
	
	
<div class="table-wrapper">
	<table class="alt">
		<thead>
			<tr>
				<!-- <th>
					<input type="checkbox">
					<label for="demo-human" style="color: white;">선택</label>
				</th> -->
				<th>No</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody style="color: black;">
			<c:choose>
				<c:when test="${fn:length(cmlist) eq 0}">
					<tr>
						<td class="text-center" colspan="8">There is no data!</td>
					</tr>
				</c:when>
			</c:choose>
			<c:forEach items="${cmlist}" var="list" varStatus="statusList">
				<tr onclick="viewForm('${list.seq}')">
					<%-- <td><input type="checkbox" id="checkbox${status.count }" name="checkbox" value="${list.seq }">
						<label for="checkbox${status.count }"></label>
					</td> --%>
					<td style="text-align: center;"><c:out value="${list.seq }"/></td>
					<td style="text-align: center;">
						<c:forEach items="${listCodeCategory}" var="listCategory" varStatus="statusCategory">
							<c:if test="${list.category eq listCategory.cc_key}"><c:out value="${listCategory.cc_name }"/></c:if>
						</c:forEach>
					</td>
					<%-- <td><c:out value="${list.category }"></c:out></td> --%>
					<td><c:out value="${list.title }"></c:out></td>
					<td style="text-align: center;"><c:out value="${list.writer }"></c:out></td>
					<td style="text-align: center;"><c:out value="${list.viewCount }"></c:out></td>
					<td style="text-align: center;"><c:out value="${list.createDate }"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
			마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
		</tfoot>
	</table>
	
	<!-- pagination s -->
	<%@include file="/resources/include/pagination.jsp"%>
	<!-- pagination e -->
	
	<button type="button" class="btn btn-danger" da ta-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="fa-solid fa-eraser"></i></button>
	<button type="button" class="btn btn-danger" onclick=""><i class="fa-solid fa-trash-can"></i></button>
	<button type="button" class="btn btn-success me-1" style="float: right;"><i class="fa-solid fa-file-excel"></i></button>
	
</div>
</form> 

<!-- ***** Header Area End ***** -->