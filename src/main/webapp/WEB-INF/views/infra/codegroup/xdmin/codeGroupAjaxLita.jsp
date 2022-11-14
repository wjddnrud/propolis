<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<div class="table-wrapper">
	<table class="alt">
		<thead>
			<tr>
				<!-- <th>
					<input type="checkbox">
					<label for="demo-human" style="color: white;">선택</label>
				</th> -->
				<th>No</th>
				<th>코드그룹 이름(한글)</th>
				<th>코드갯수</th>
				<th>사용여부</th>
				<th>삭제여부</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody style="color: black;">
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<tr>
						<td class="text-center" colspan="8">There is no data!</td>
					</tr>
				</c:when>
			</c:choose>
			<c:forEach items="${list}" var="list" varStatus="statusList">
			<tr style="color: black; text-align: center;" onclick="editForm('${list.seq}')" class="on">
				<!-- <td><input type="checkbox" id="demo-human" name="demo-human"><label></label></td> -->
				<%-- <td><c:out value="${list.seq }"/></td> --%> <!-- seq 데이터 보여주기만 -->
				<td><c:out value="${list.seq}"/>
				</a></td>
				<td><c:out value="${list.ccg_name }"/></td>
				<td><c:out value="${list.xCodeCount }"/></td>
				<td>
					<c:choose>
						<c:when test="${list.useNY eq 1}">N</c:when>
						<c:when test="${list.useNY eq 2}">Y</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${list.delNY eq 1}">N</c:when>
						<c:when test="${list.delNY eq 2}">Y</c:when>
					</c:choose>
				</td>
				<td><c:out value="${list.createDate }"/></td>
				<td><c:out value="${list.modiDate }"/></td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<!-- 글 삭제 -> 글 삭제 페이지 이동 -> 리스트 체크 후 삭제
			마이페이지 -> 내 글 삭제 -> 리스트 체크 후 삭제 -->
		</tfoot>
	</table>
	
	<!-- pagination -->
	<%@include file="pagination.jsp"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	
	var form = $("form[name=formList]"); // name으로 된거 사용
	// var form = $("#formList");  // id로 된거 사용
	
	var editSeq = $("input:hidden[name=shSeq]");
	/* name이 seq인 hidden type의 input을 editSeq로 정해준다. */
	
	var goUrlList = "/codegroup/codeGroupList";    /* # -> */
	var goUrlInst = "/codegroup/codeGroupInst";    /* # -> */
	var goUrlUpdt = "/codegroup/codeGroupUpdt";    /* # -> */
	var goUrlUele = "/codegroup/codeGroupUele";    /* # -> */
	var goUrlDele = "/codegroup/codeGroupDele";    /* # -> */	
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	// 버튼을 submit 처리해서 action이 없어도 goUrlList로 submit 되게 해주는 기능 
	
	editForm = function(seq) {
		editSeq.attr("value", seq);
		form.attr("action", "/codegroup/codeGroupForm").submit();
	}
</script>