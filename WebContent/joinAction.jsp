<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="javax.naming.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="*" />
<%-- <jsp:setProperty name="user" property="userID" /> --%>
<%-- <jsp:setProperty name="user" property="userPassword" /> --%>
<%-- <jsp:setProperty name="user" property="userName" /> --%>
<%-- <jsp:setProperty name="user" property="userGender" /> --%>
<%-- <jsp:setProperty name="user" property="userEmail" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 데이터 처리</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	userDAO.connClose();
	if (result == -1) {
		out.println("<script>");
		out.println("alert('이미 존재하는 아이디입니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else {
		session.setAttribute("userID", user.getUserID());
		out.println("<script>");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>