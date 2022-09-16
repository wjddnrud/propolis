<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>



	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
	<c:if test="${vo.startPage gt vo.pageNumToShow}">
			<li class="page-item">
			<a class="page-link" href="javascript:goList(${vo.startPage - 1})" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
			</li>
	</c:if>
	<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
		<c:choose>
			<c:when test="${i.index eq vo.thisPage}">
	                <li class="page-item active"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
			</c:when>
			<c:otherwise>             
	                <%-- <li class="page-item"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li> --%>
	                <li class="page-item"><a class="page-link" href="/codegroup/codeGroupList?thisPage=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>                
	<c:if test="${vo.endPage ne vo.totalPages}">
		<li class="page-item"><a class="page-link" href="javascript:goList(${vo.endPage + 1})" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:if>
		</ul>
	</nav>
