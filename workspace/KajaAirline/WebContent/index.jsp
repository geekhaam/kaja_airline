<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Kaja~가자 Airline</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>


/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
  
}

.active {
  background-color: #717171;
}

/* menu set */
.menu{
	width: 22%;
	position: fixed;
	top: 22.1%;
	right: 0;
	background-color:white;
	display: block;
	z-index: 80;
}

.menuB{
	font-size: 20pt;
	display: none;
	position: fixed; 
	top : 23%;
	right: 0;
	width: 5%;
	z-index: 95;
}
.menuDot{
	right : 5px;
	position :absolute;
	height: 20px;
 	width: 20px;
	border-radius: 50%; 
	background-color:#c4c3bb;
	color: black;
	font-size: 14px;
	text-align: center;
	margin : 6px;
	display: inline-block;
	z-index: 98;
}
.menuText{
	font-size: 13pt;
	color: black;
}

.way{
	display: none;
}


</style>

</head>
<body>
	<%request.setCharacterEncoding("EUC-KR"); 
	response.setCharacterEncoding("EUC-KR");%>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
		<a href="#"><img class="menuB" src="./imgs/menu.jpg" onclick="showMenu()"><br></a>
	</header>
	<!-- <nav>
		숨겨지는 탭메뉴 간단 예매부분 
	</nav> -->
	<nav class="menu">
		
		<form action="reservation_result.rsv" method="post">
			
			<div class="menuText">
				<h2>Kaja Airline 간편 조회<a href="#">
				<span class="menuDot" onclick="showMenu()">X</span>
				</a></h2>
				<hr>
				<input type="radio" value="편도" name="tripType" checked="checked" onchange="findWay()">편도&nbsp; 
				<input type="radio" value="왕복" name="tripType" onchange="findWay()">왕복 
				<br><hr>
				출발지<br>
				<input type="text" onfocus="this.select()" name="depAirport">
				<br><br> 
				도착지<br><input type="text" onfocus="this.select()" name="arrAirport">
				<br><br> 
				가는날<br>
				<input type="date" name="goDate"><br><br> 
				<div class="way">
					오는날 <br>
					<input type="date" name="comeDate"><br> <br>
				</div>
				<input type="hidden" name="adultCount" value="1">
				<input type="hidden" name="childCount" value="0">
				<input type="hidden" name="babyCount" value="0"> 
				<hr>
				<div style="text-align: center;">
				<input type="submit" value="예매하기" style="height: 40px; width: 150px; font-weight: bold;">
				<br></div>
			</div>
		</form>
	</nav>

	<!-- <section> indexPage 이미지슬라이드 -->
	<section id="sectionId">
		<div class="slideshow-container">

			<div class="imgSlides fade" style="display: block;">
				<img src="./imgs/index1.jpg" style="width: 100%;">
				<div class="text"></div>
			</div>

			<div class="imgSlides fade">
				<img src=./imgs/index2.jpg style="width: 100%;">
				<div class="text"></div>
			</div>

			<div class="imgSlides fade">
				<img src="./imgs/index3.jpg" style="width: 100%;">
				<div class="text"></div>
			</div>

			<div class="imgSlides fade">
				<img src="./imgs/index4.jpg" style="width: 100%;">
				<div class="text"></div>
			</div>
			<br>
			<div style="text-align: center">
				<span class="dot"></span> <span class="dot"></span> 
				<span class="dot"></span> <span class="dot"></span>
				<!--dot들에 클릭시 바뀌는 것까지 추가해야함  -->
			</div>
		</div>

	</section>
	<!-- </section> -->
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
<script src="./js/jquery-3.1.1.js"></script>
<script type="text/javascript">

showSlides();
function showMenu(){
	/* 숨겨지는 탭 구현을 위한 함수 */
	var menu=document.getElementsByClassName("menu");
	var menuB=document.getElementsByClassName("menuB");
	var container=document.getElementsByClassName("slideshow-container");
	if(menu[0].style.display=="block"){
		menu[0].style.display="none";
		menuB[0].style.display="block";
		container[0].style.width="100%";
	}
	else{
		menu[0].style.display="block";
		menuB[0].style.display="none";
		container[0].style.width="77%";
	} 
}

function findWay(){
	/* 간편 예매조회 부분 편도 왕복에 따른 2번째 출발지 display 조정 */
	var way=document.getElementsByName("tripType");
	var twoWay=document.getElementsByClassName("way");
	if(twoWay[0].style.display=="block")
		twoWay[0].style.display="none";
	else
		twoWay[0].style.display="block";
	
}

</script>
</body>
</html>