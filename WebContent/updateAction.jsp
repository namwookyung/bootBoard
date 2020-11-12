<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="javax.naming.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 데이터 처리</title>
</head>
<body>
<%
	String userID = (String) session.getAttribute("userID");
	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
	bbsDAO.connClose();
	if (result == -1) {
		out.println("<script>");
		out.println("alert('글쓰기에 실패하였습니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("location.href='bbs.jsp'");
		out.println("</script>");
	}
%>
</body>
</html>