<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) { userID = (String) session.getAttribute("userID");
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) { bbsID = Integer.parseInt(request.getParameter("bbsID"));
}
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />

<title>JSP 게시판</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a>
				</li>
				<li class="nav-item"><a class="nav-link active" href="bbs.jsp">게시판
						<span class="sr-only">(current)</span>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">접속하기</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
							if (userID == null) {
						%>
						<a class="dropdown-item" href="login.jsp"> 로그인</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="join.jsp">회원가입</a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>

						<%
							}
						%>
					</div></li>
			</ul>
		</div>
	</nav>
	<%
		if(bbsID == 0) {
			out.println("<script>");
			out.println("alert<'유효하지 않은 글입니다.')");
			out.println("location.href = 'bbs.jsp'");
			out.println("</script>");
		}
		BbsDAO bbsDAO = new BbsDAO();
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(bbs == null) {
			out.println("<script>");
			out.println("alert<'작성되지 않은 글입니다.')");
			out.println("location.href = 'bbs.jsp'");
			out.println("</script>");
		}
	%>

	<!-- JUMBOTRON -->
	<div class="container pt-3">
		<table class="table table-striped table-bordered text-center">
			<thead class="thead-light">
				<tr>
					<th colspan="3">게시판 글보기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:20%;">글 제목</td>
					<td colspan="2"><%=bbs.getBbsTitle()%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%=bbs.getUserID()%></td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2"><%=bbs.getBbsDate()%></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height:200px; text-align:left;"><%=bbs.getBbsContent()%></td>
				</tr>
			</tbody>
		</table>
<%
	String opt="";
	if(userID == null || !userID.equals(bbs.getUserID())) {
		opt = " disabled";
	}
	bbsDAO
%>
		<a href="bbs.jsp" class="btn btn-success float-left">목록</a>
		<a href="" class="btn btn- float-"></a>
		<a href="" class="btn btn- float-"></a>
	</div>

	<!-- Optional JavaScript-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<!--
 	String id = (String)session.getAttribute("userID");
 	if(id != null) {
 		response.sendRedirect("main.jsp");
 	}
<%-- %> --%>
<!-- <!doctype html> -->
<!-- <head> -->
<!-- <!-- Required meta tags --> 
<!-- <meta charset="utf-8" /> -->
<!-- <meta name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1, shrink-to-fit=no" /> -->

<!-- <!-- Bootstrap CSS --> 
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" /> -->

<!-- <title>JSP 게시판</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<nav class="navbar navbar-expand-sm navbar-light bg-light"> -->
<!-- 		<a class="navbar-brand" href="main.jsp">JSP 게시판</a> -->
<!-- 		<button class="navbar-toggler" type="button" data-toggle="collapse" -->
<!-- 			data-target="#navbarSupportedContent" -->
<!-- 			aria-controls="navbarSupportedContent" aria-expanded="false" -->
<!-- 			aria-label="Toggle navigation"> -->
<!-- 			<span class="navbar-toggler-icon"></span> -->
<!-- 		</button> -->
<!-- 		<!-- 햄버거 버튼 --> 
<!-- 		<div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!-- 			<ul class="navbar-nav"> -->
<!-- 				<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a> -->
<!-- 				</li> -->
<!-- 				<li class="nav-item"><a class="nav-link active" href="bbs.jsp">게시판<span class="sr-only">(current)</span></a> -->
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 			<ul class="navbar-nav ml-auto"> -->
<!-- 				<li class="nav-item dropdown"><a -->
<!-- 					class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
<!-- 					role="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 					aria-expanded="false">접속하기</a> -->
<!-- 					<div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--
 	if (id == null) {
<%-- %> --%>
<!-- 						<a class="dropdown-item" href="login.jsp"> 로그인 </a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="join.jsp">회원가입</a> -->
<!--
 	} else {
<%-- %> --%>
<!-- 						<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a> -->
<!-- 
 	}
<%-- %> --%>
<!-- 					</div></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</nav> -->
<!-- 	<div class="container pt-3"> -->
<!-- 		<div class="row"> -->
<!-- 			<form method="post" action="writeAction.jsp"> -->
<!-- 				<table class="table table-striped text-center"> -->
<!-- 					<thead class="thead-light"> -->
<!-- 						<tr> -->
<!-- 							<th colspan="2">게시판 글쓰기</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" -->
<!-- 							maxlength="2048" style="height:350px; resize:none;"></textarea></td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 				</table> -->
<!-- 				<a href="bbs.jsp" class="btn btn-success float-left">목록</a> -->
<!-- 				<button type="submit" class="btn btn-primary float-right">글쓰기</button> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<!-- Optional JavaScript --> 
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script> -->
<!-- </body> -->
<!-- </html> -->