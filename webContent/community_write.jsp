<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_write</title>
</head>
<body>
<div>
			<form method="post" action="write_action.jsp">
				<table style="text-align: center;">
						<tr>
							<th><input type="text" placeholder="제목을 입력하세요" name="title" maxlength="50"></th>
						</tr>
						<tr>
						<!-- 장문의 글 작성 -->
							<td><textarea placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
				</table>
				<input type="submit" value="작성완료" >
				
			</form>
				<input type="button" value="나가기" onClick="history.back()">
			
		</div>
</body>
</html>