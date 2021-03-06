<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>home</title>
    <link rel="stylesheet" href="./styles/info.css"/>
  </head>
  <body><header class="info-header">
      <h2 class="info-name"><a href="info.jsp">자전거</a></h2>
      <nav class="info-navbar">
        <ul class="info-menus">
          <li class="info-menu"><a href="recom.jsp">recommendation</a></li>
          <li class="info-menu"><a href="search.jsp">search</a></li>
          <li class="info-menu"><a href="community.jsp">community</a></li>
        </ul>
      </nav>
    </header>
    <div class="info-main">
      <section class="info-content">
        <div class="info-overview">
          <p class="info-description">
            <h3>인천 자전거 도로를 추천받아보세요.</h3>
            <br>
            <br>
            자전거 서비스는 지금까지 경험해보지 못했던 새로운 자전거도로 검색
            서비스를 제공합니다.
            <br>
            <br>
            도로를 추천받고, 검색하고, 다른 유저들과 이를 공유해보세요!
          </p>
          <div class="info-buttons">
            <a href="recom.jsp" class="info-button">추천받기</a>
            <a href="search.jsp" class="info-button">검색하기</a>
            <a href="community.jsp" class="info-button">커뮤니티</a>
          </div>
        </div>
      </section>
      <section class="info-content">
        <div class="info-description">
          <div class="info-title">
            <h3 class="info-kor-title">추천받기</h3>
            <p class="info-eng-title">recommendation</p>
          </div>
          <p>
            자전거 도로의 수, 자전거 거치소의 수,
            <br>
            안전표지판의 수 등을 이용해
            <br>
            자전거 타기에 적합한 구를 추천해줍니다.
          </p>
        </div>
        <img src="./styles/images/info_추천사진.jpg" width="250px" height="200px" alt="recommendation" class="info-image" />
      </section>
      <section class="info-content">
        <img src="./styles/images/info_검색사진.png" width="250px" height="200px" alt="search" class="info-image" />
        <div class="info-description">
          <div class="info-title">
            <h3 class="info-kor-title">검색하기</h3>
            <p class="info-eng-title">search</p>
          </div>
          <p >
            모든 도로를 지도 위에 표시하고, 거리에 따라 필터링 합니다.
          </p>
        </div>
      </section>
      <section class="info-content">
        <div class="info-description">
          <div class="info-title">
            <h3 class="info-kor-title">익명 커뮤니티</h3>
            <p class="info-eng-title">community</p>
          </div>
          <p>
            자전거 관련 지식을 공유할 수 있는 익명 커뮤니티입니다.
          </p>
        </div>
        <img src="./styles/images/info_커뮤니티사진.jpg" alt="community" width="250px" height="200px" class="info-image" />
      </section>
    </div>
    <footer class="info-footer">
      All right reserved to DB team 15, 2021-1
    </footer>
  </body>
</html>
