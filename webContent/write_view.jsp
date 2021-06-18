<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>    
<%@ page import = "community.CommunityDao" %>
<%@ page import = "community.Community" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_write</title>
</head>
<body>
<% 
		int ID = 0;
		if (request.getParameter("ID") != null) {
			ID = Integer.parseInt(request.getParameter("ID"));
		}
		if (ID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류-id값 제대로 안넘어옴.')");
			script.println("location.href = 'community_list.jsp'");
			script.println("</script>");
		}
		Community community = new CommunityDao().getCommunity(ID);
		
	%>
		<div>
			<table class="table table-striped" style="text-align: center;">
					<tr>
						<td style="background-color: #eeeeee; width: 20%;">글 제목</td>
						<td colspan="2"><%=community.getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll("\n","<br>")%></td>
					</tr>
					<tr>
						<td style="background-color: #eeeeee;">작성일자</td>
						<td colspan="2"><%= community.getDate() %></td>
					</tr>
					<tr>
						<td style="background-color: #eeeeee;">내용</td>
						<td colspan="2" style="text-align: left;"><%=community.getContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll("\n","<br>") %></td>
					</tr>

			</table>
			<input type="button" value="목록" onClick="location.href='community_list.jsp'">
			
		</div>
</body>
</html>