<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3001/db_proj?allowPublicKeyRetrieval=true&useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con= null;
PreparedStatement pstmt = null;
ResultSet rs = null;

con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

String sql = "select * from gross_lengths natural join safe_facility order by `전용도로연장` desc, safty_label desc";

pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
int i = 1;
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles/master.css">
<title>추천</title>
</head>
<body>
	<nav class="navbar fixed-top navbar-expand-lg navbar-light"
		style="background-color: white; opacity: 0.95;">
		<div class="container-fluid d-flex">
			<a class="navbar-brand" href="info.html">자전거(가칭)</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				style="float: right;">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item i1"><a class="nav-link disabled"
						aria-current="page" aria-disabled="true" tabindex="-1">recommendation</a>
					</li>
					<li class="nav-item i2"><a class="nav-link" href="search.jsp"
						style="color: black;">search</a></li>
					<li class="nav-item i3"><a class="nav-link" href="community.jsp" 
						style="color: black;">community</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section id="body">
		<div id="carouselExampleControls" class="carousel slide"
			 data-bs-touch="false" data-bs-interval="false">
			<div class="carousel-inner">
				<%while(rs.next()){
					
				%>
				
				<div class="carousel-item <% if(i == 1){ %>active<%}%>">
					<div class="car-text">
						<h1><%=i %>위 <%=rs.getString("district_name") %></h2> <br>
						<p><%=rs.getString("district_name") %>은(는) 총 연장 <%=rs.getString("전용도로연장") %>km의 자전거 전용도로를 보유하고 있습니다.</p>
						<p>이뿐만 아니라 <%=rs.getString("safty_label") %>개의 안전표지판과 <%=rs.getString("crosswalk") %>개의 횡단보도를 보유하고 있어 안전하게 라이딩을 즐길 수 있습니다.</p>
					</div>
					<img src="styles/images/recom_<%=rs.getString("district_name") %>.png" class="car-pic" alt="<%=rs.getString("district_name")%> 이미지">
				</div>
				
				<%
				i++;
				}
				%>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous" type="text/javascript"></script>
</body>
</html>
<%

rs.close();
pstmt.close();
con.close();
%>	
