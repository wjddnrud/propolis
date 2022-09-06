<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

codegroup

<form action="/code/codeInst">
	<input name="cc_name" type="text" placeholder="code_name"><br>
	<input name="cc_key" type="text" placeholder="code_key"><br>
	<input name="useNY" type="text" placeholder="useNY"><br>
	<input name="ccg_seq" type="text" placeholder="codegroup_seq"><br>
	<button type="submit">등록</button>
</form>
