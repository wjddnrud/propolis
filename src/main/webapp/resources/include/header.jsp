<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    
<!-- ***** Header Area Start ***** -->

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
							<li><a href="/myPage">MyPage</a></li>
							<li><a href="/chat/">Message</a></li>
							<li><a href="/logout">LOG-OUT</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>
	</nav>
</header>

	
<%-- <header id="header">
	<c:choose>
		<c:when test="${sessAdminNY eq 1 }">
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
									<li><a href="#">Administor</a></li>
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
		</c:when>
		<c:otherwise>
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
									<li><a href="/chat/">Message</a></li>
									<li><a href="javascript:logout()">LOG-OUT</a></li>
								</c:if>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>
</header> --%>
		

<!-- ***** Header Area End ***** -->