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
<link rel="stylesheet" href="./styles/info.css" />
<link rel="stylesheet" href="./styles/com.css" />
</head>
<body>
<header class="info-header">
      <h2 class="info-name">자전거</h2>
      <nav class="info-navbar">
        <ul class="info-menus">
          <li class="info-menu"><a href="recom.jsp">recommendation</a></li>
          <li class="info-menu"><a href="search.jsp">search</a></li>
          <li class="info-menu"><a href="community.jsp">community</a></li>
        </ul>
      </nav>
    </header>
<div>
	<section class="com-block">
		<img
			src="./styles/images/community.png"
			alt="com"
			width="100px"
			height="100px"
			class="com-image"
		/>
		<h3>다른 사람들과 후기를 공유하세요!</h3>
	</section>
		<section class="com-review">
			<table class="com-table">
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
			
			<input class="com-button" type="button" value="글쓰기" onClick="location.href='community_write.jsp'">
		</section>
	</div>

</body>
</html>