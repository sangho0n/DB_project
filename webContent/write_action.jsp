<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>    
<%@ page import = "community.CommunityDao" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="community" class="community.Community" scope="page" />
<jsp:setProperty name="community" property="title" />  
<jsp:setProperty name="community" property="content" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_action</title>
</head>
<body>
	<%
	
		if (community.getTitle() == null || community.getContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				CommunityDao cdao = new CommunityDao();
				int result = cdao.write(community.getTitle(), community.getContent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {

				%>
				<script>location.href = 'community_list.jsp'</script> 
				<% 
				
				}
			}
		
	%>
</body>
</html>