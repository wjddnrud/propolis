<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

codegroup


<form action="/codegroup/codeGroupInst">
	<input name="ccg_name" type="text">
	<input name="useNY" type="text">
	<button type="submit">저장</button>
</form>

<br>
<%-- 
<c:forEach items="${list}" var="list" varStatus="status">
	<c:out value="${list.ifcgSeq }"/> / <c:out value="${list.ifcgName }"/>
	<br>		
</c:forEach> --%>