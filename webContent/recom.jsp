<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<a class="navbar-brand" href="#">자전거(가칭)</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				style="float: right;">
				<ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item i1"><a class="nav-link disabled"
						aria-current="page" aria-disabled="true" tabindex="-1">recommendation</a>
					</li>
					<li class="nav-item i2"><a class="nav-link" href="search.jsp"
						style="color: black;">search</a></li>
					<li class="nav-item i3"><a class="nav-link"
						href="community.jsp" style="color: black;">community</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section id="body">
		<div id="carouselExampleControls" class="carousel slide"
			 data-bs-touch="false" data-bs-interval="false">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="car-text">
						<h1>1위 </h2> <br>
						<p>alksdjf ;sdk sdafkjsdhkjsda fkjsda wekjaf hiasdu fhiaw fhijzxdhf wekjhalkjfahl kjfhzsiue fhkjszhdf iuw fhkjsdhf</p>
					</div>
					<img src="..." class="d-block w-100 car-pic" alt="...">
				</div>
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