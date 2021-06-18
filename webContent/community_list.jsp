<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>    
<%@ page import = "community.CommunityDao" %>
<%@ page import = "community.Community" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_list</title>
</head>
<body>
<div>
		<div>
			<table style="text-align: center;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<% 
						CommunityDao communityDao = new CommunityDao();
						ArrayList<Community> list = communityDao.getList();
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getID() %></td>
						<td><a href="write_view.jsp?ID=<%=list.get(i).getID()%>"><%= list.get(i).getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll("\n","<br>")%></a></td>
						<td><%= list.get(i).getDate()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			
			<input type="button" value="글쓰기" onClick="location.href='community_write.jsp'">
		</div>
	</div>

</body>
</html>