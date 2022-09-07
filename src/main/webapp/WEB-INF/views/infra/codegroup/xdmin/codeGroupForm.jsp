<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

codegroup


<form action="/codegroup/codeGroupInst">
	<input name="ccg_name" type="text" id="ccg_name">
	<input name="useNY" type="text" id="useNY">
	<button type="submit" onclick="test();">등록</button>
</form>

<br>

<script type="text/javascript">
	function test() {
		
		if(document.getElementById('ccg_name').value == "") {
			alert("빈칸이 있습니다. 내용을 입력해주세요.");
			
			document.getElementById("ccg_name").value="";
			document.getElementById("ccg_name").focus();
			
			return false;
		}
		
		if(document.getElementById('useNY').value == "") {
			alert("빈칸이 있습니다. 내용을 입력해주세요.");
			
			document.getElementById("useNY").value="";
			document.getElementById("useNY").focus();
			
			return false;
		}
		
		alert("코드그룹이 정상적으로 등록되었습니다.");
		
		alert("코드그룹 이름 : " + document.getElementById('ccg_name').value);
		
		alert("사용여부 : " + document.getElementById('useNY').value);
		
		
		
		
		alert(document.getElementById('telecom').options[document.getElementById('telecom').selectedIndex].value);
		
		alert(document.querySelector("input[name='gender']:checked").value);
		
		return false;
	}
</script>