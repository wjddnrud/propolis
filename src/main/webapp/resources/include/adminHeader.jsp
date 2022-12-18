<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
    
<!-- ***** Header Area Start ***** -->

<header id="header">
	<h1><a href="/member/memberList">sports mate</a></h1>
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
						<c:if test="${sessAdminNY eq 2}">
							<li><a href="/codegroup/codeGroupList">CodeGroupList</a></li>
							<li><a href="/code/codeList">CodeList</a></li>
							<li><a href="/member/memberList">MemberList</a></li>
							<li><a href="/logout">LOG-OUT</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>
	</nav>
</header>

<!-- ***** Header Area End ***** -->