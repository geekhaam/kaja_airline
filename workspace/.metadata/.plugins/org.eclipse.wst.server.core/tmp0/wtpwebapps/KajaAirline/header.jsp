<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
html, body {
	padding: 0px;
	border: 0px;
	margin: 0px;
}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	input {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: initial;
	}

header {
	width : 100%;
	padding: 0px;
	top : 0;
	position: fixed;
	background-color : white;
	height: auto;
	z-index: 90;
}

section{
	min-height:450px;
	margin: 2%;
    margin-top: 13%;
}


footer {
	position : relative;
	width: 100%;
	height: 20%;
	z-index: 90;
}
.menuBar {
	border: 0;
	padding: 0;
	margin: 0;
	height: 10%;
	width: 100%;
	background-color: #93b3ef;
	color: white;
	align-self: center;
	font-size: 20px;
	font-weight: bold;
	font-style: italic;
	position: relative;
	display: inline-block;
}

/* Slideshow container */
.slideshow-container {
 	width: 77%;
    height: auto;
    position: relative;
    
    z-index: 50;  
} 

.imgSlides {display: none; position: relative; left: 0;}
img {vertical-align: middle;}


/* 헤더 공지사항 관련 */
.notice-container {
	width: 100%;
	height: 30px;
	background-color: #a3d1e7;
	color: white;
	font-weight: bold;
	font-size: 20px;
	padding: 5px;
	/* cookie */
	display: block;
}

.noticeSlides {
	display: none;
	position: relative;
}

.cook {
	position: absolute;
	right: 40px;
	text-align: right;
	font-size: 12px;
	font-style: italic;
	top: 6%;
}

.cookDot {
	right: 0.5%;
	top: 6%;
	position: absolute;
	height: 20px;
	width: 20px;
	border-radius: 50%;
	background-color: #c4c3bb;
	color: black;
	font-size: 14px;
	text-align: center;
	display: inline-block;
	z-index: 100;
}

/* header menu & drop */
.dropbtn {
	background-color: #93b3ef;
	color: white;
	padding: 16px;
	font-size: 25px;
	border: none;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 99;
	text-align: left;
	font-size: 14pt;
}

.dropdown-content a {
	color: #6e6b58;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	left: inherit;
}
/* css 가상가상클래스 hover Element위에 마우스가 올라올때를 말함 */
.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown {
	font-size: 15pt;
	vertical-align: bottom;
	display: inline-block;
}
.dropbtn:hover  .dropbtn{
	background-color: #232326;
}
.dropbtn:hover  .dropdown-content {
	display: block;
}
.dropbtnAdmin:hover  .dropdown-content {
	display: block;
}

.login {
	position: absolute;
	margin: auto auto;
	width: 33%;
	height: 480px;
	left: 30%;
	top: 90%;
	font-size: 25pt;
	font-weight: bold;
	text-align: center;
	background-color: #dfe4e8;
	z-index: 100;
	display: none;
}

.loginInput {
	width: 40%;
	height: 100%;
	text-align: left;
	padding: 3px;
	border: 1px solid;
	font-size: 20pt;
	margin-top: 15px;
	margin-bottom: 15px;
}

.loginButton {
	width: 23%;
	height: 10%;
	text-align: center;
	padding: 3px;
	border: 0.5pxs;
	font-size: 20pt;
	margin-bottom: 1%;
}
/* Caption text */
.text {
  /* color: #000000; */
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 80px;
  width: 100%;
  text-align: center;
}
/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.8s;
  animation-name: fade;
  animation-duration: 1.8s;
}

@-webkit-keyframes fade {
  from {opacity: .1} 
  to {opacity: 1}
} 
@keyframes fade {
  from {opacity: .1} 
  to {opacity: 1}
}
/* 유진씨 버튼 */
.button {
	font-size: 12pt;
	padding : 3px;
	width: 10%;
}
.buttonUpdate {
	font-size: 13pt;
	padding : 8px;
	width: 10%;
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>

</head>
<body>
	<%@ page import="com.kaja_air.index.DAO.KajaDAO" %>
	<%request.setCharacterEncoding("EUC-KR"); 
	response.setCharacterEncoding("EUC-KR");
	KajaDAO da=new KajaDAO();
	String[] result=new String[3]; 
	result=da.getNoticeHeader();
	
	%>
	<!-- 공지사항부분  쿠키 사용하여 하루창안보기등...셋팅해야됨. 체크박스도-->
	<div class="notice-container">
		<table style="width: 100%">
			<tr>
				<td style="width: 70%;">
					<div class="noticeSlides fade">
						<%=result[0] %> <a href="AdminNotice.jsp"
							style="font-size: 12px; text-decoration: none; color: white;">>>자세히
							보기</a>
					</div>
					<div class="noticeSlides fade">
						<%=result[1] %> <a href="AdminNotice.jsp"
							style="font-size: 12px; text-decoration: none; color: white;">>>자세히
							보기</a>
					</div>
					<div class="noticeSlides fade">
						<%=result[2] %> <a href="AdminNotice.jsp"
							style="font-size: 12px; text-decoration: none; color: white;">>>자세히
							보기</a>
					</div>
				</td>
				<td style="width: 30%;"><span class="cook"> <input
						type="checkbox" name="cook">오늘 하루 보지 않기
				</span> <a href="javascript:void(0)" onclick="setCookie()"><span
						class="cookDot">X</span></a></td>
		</table>
	</div>

	<div class="login">
		<!-- login 창 부분 -->
		<div style="text-align: right; width: 100%; height: 5%;">
			<a style="text-decoration: none; font-size: 15pt; color: black;"
				href="javascript:void(0)" onclick="popupLogin2()">x&nbsp;</a>
		</div>
		<hr>
		<table style="width: 100%;">
			<tr>
				<td style="font-size: 35pt;">로그인
					<hr>
				</td>
			</tr>
			<tr>
				<td><input type="text" class="loginInput" id="clientId"
					value="아이디 입력" onfocus="this.select()"></td>
			</tr>
			<tr>
				<td><input type="text" class="loginInput" id="clientPw"
					value="비밀번호 입력" onfocus="changePw(this.id)"></td>
			</tr>
		</table>
		<!-- <div
			style="left: 30%; position: relative; text-align: left; width: 40%; font-weight: lighter;">
			<input type="checkbox" name="confirmPw"><span
				style="font-size: 10pt;">비밀번호 확인하기</span> -->
			<hr>
		<!-- </div> -->

		<input type="button" class="loginButton" value="로 그 인"
			onclick="login()"> <input type="button" class="loginButton"
			value="회원가입" onclick="location.replace('Signup.jsp')">
		<hr>
	</div>

	<!--로고와 사이트명 메뉴 바/로그인 아웃 -->
	<div class="menuBar">
		<a href="index.jsp"> <img src="./imgs/mainIcon4.jpg"
			style="width: 20%;"></a>
		<!-- 드랍메뉴들의 주 메뉴들 -->

		<div class="dropdown">
			//
			<div class="dropbtn">
				Introduce
				<div class="dropdown-content">
					<a href="introduce.jsp">회사 이력</a> <a href="location.jsp">찾아 오시는 길</a>
				</div>
			</div>
			//
			<div class="dropbtn">
				Reservation
				<div class="dropdown-content">
					<a href="reservation_main.rsv">예매 하기</a>
				</div>
			</div>
			//
			<div class="dropbtn">
				Support
				<div class="dropdown-content">
					<a href="AdminNotice.jsp">공지 사항</a> 
					<a href="javascript:void(0)" onclick="mypage(3)">1:1 문의 하기</a> 
					<a href="AllFAQ.jsp">FAQ</a>
				</div>
			</div>
			//
			<div class="dropbtn">
				MyPage
				<div class="dropdown-content">
					<a href="javascript:void(0)" onclick="mypage(1)">정보 수정</a> 
					<a href="javascript:void(0)" onclick="mypage(2)">나의 예매/취소 내역</a>
				</div>
			</div>
			<div style="display: none;" id="admin">
			//
				<div class="dropbtn">
				Admin
				<div class="dropdown-content">
					<a href="getAllSchedule.jsp">스케쥴 관리</a> <a href="AdminNotice.jsp">공지사항 작성</a> 
					<a href="#">1:1문의 답변</a>
				</div>
			</div>
			//
			</div>
		</div>

		<a href="index.jsp"
			style="text-decoration: none; position: absolute; right: 20px; color: white;">
			<span style="color: white;">Kaja Airline</span><br>
		</a> 
		<a href="javascript:void(0)" onclick="popupLogin()" id="login"
			style="position: absolute; right: 20px; bottom: 10px; text-decoration: none; color: white;">
		로그인</a>
		<span id="logout" style="position: absolute; right: 20px; bottom: 10px;display: none;">
		<span style="font-style: italic;font-size: 12px;color: 586693;">
			<%=session.getAttribute("id") %>님 환영합니다.:D<br>
		</span>
		 <a href="javascript:void(0)" onclick="logout()"
			style="text-decoration: none; color: white; ">
		로그아웃</a>
		</span>
	</div>
	<script src="./js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
	var slideIndex = 0;
	var noticeIndex =0;

 
	
	function showSlides() {
		/* css로 선언된 클래스 명에 대한 element를 가져와서 컨트롤 해줌.
		img 슬라이드쇼 부분 헤더의 공지사항 슬라이드부분까지도 함꼐 구현*/
		var i;
		var slides = document.getElementsByClassName("imgSlides");
		var dots = document.getElementsByClassName("dot");
		if(slides.length!=0){
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			if(dots.length!=0){
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className.replace(" active", "");
				}
				dots[slideIndex - 1].className += " active";
				
			}
			slides[slideIndex - 1].style.display = "block";
			
		}
		/* notice */
		var notices = document.getElementsByClassName("noticeSlides");
		for (i = 0; i < notices.length; i++) {
			notices[i].style.display = "none";
		}
		noticeIndex++;
		if (noticeIndex > notices.length) {
			noticeIndex = 1
		}
		notices[noticeIndex - 1].style.display = "block";		
		setTimeout(showSlides, 3000); // 3초마다 다시 호출해서 계속 바뀌는 구성
		checkCookie();
	}

		
	function checkCookie(){
		/* 쿠키가 있는지 확인후  section 높이조절 및 공지안보이게 */
		var sectionId=document.getElementById("sectionId");
		var dis=document.getElementsByClassName("notice-container");
		/* var hMenu=document.getElementsByClassName("menu"); */
		if(document.cookie=="kajaAirline=done"){
			var sectionId=document.getElementById("sectionId");
			sectionId.style.marginTop="11%";
			dis[0].style.display="none";
			/* hMenu[0].style.top="19.1%"; */
		}else{
			sectionId.style.marginTop="13%";
		}
		/*onload가 하나만 돌아가므로 여기서 로그인 로그아웃 보이는 부분까지 처리  */
		if("<%=(String)session.getAttribute("id")%>"!="null"){
			/* 로그인이 되있는 상태면 */
			
			
			var login=document.getElementById("login");
			var logout=document.getElementById("logout");
			
			login.style.display="none";
			logout.style.display="block";
			
			if("<%=(String)session.getAttribute("id")%>"=="admin"){
				var adminMenu=document.getElementById("admin");
				
				if(adminMenu.style.display=="none")
					adminMenu.style.display="inline-block";
			}
		}
		/* 이 헤더 onload후 돌아갈 include 해준 jsp의 onload function call */
		
		
	}
	

	function setCookie() {
		/*공지사항 부분 x표시를 누를때 콜되는 함수 체크 박스체크 여부까지 확인후 쿠키셋팅  */
		var chk=document.getElementsByName("cook");
		var hMenu=document.getElementsByClassName("menu");
		if(chk[0].checked){
			var todayDate = new Date();
		    todayDate.setDate(todayDate.getDate() + 1);
		    document.cookie = "kajaAirline=done; path=/; expires=" + todayDate.toGMTString() + ";"
		}
	    var dis=document.getElementsByClassName("notice-container");
	    var sectionId=document.getElementById("sectionId");
	    dis[0].style.display="none";
	    sectionId.style.marginTop="11%";
	    hMenu[0].style.top="19.1%";
	    
	}
	/* 로그인 체크 함수/회원가입 가는 함수*/
	
	function popupLogin2(){
		//하나로 통합되었다가..오류로 인해서 나눠짐. 로그인 박스 안의 x 표 클릭시 실행
		var popup = document.getElementsByClassName("login");
		var header = document.getElementsByTagName("header");
		var nav = document.getElementsByTagName("nav");
		var section = document.getElementsByTagName("section");
		var footer = document.getElementsByTagName("footer");
		popup[0].style.display = "none";
		nav[0].style.opacity = "1"; 
		section[0].style.opacity = "1";
		footer[0].style.opacity = "1";
	}
	
	function popupLogin(){
	/* 로그인 버튼시 팝업모양으로 로그인창이 보여짐. */
	/* 로그인 후의 다시 열릴때도 불려지므로 조건문으로 경우들 처리*/
	
		
			//로그인이 안되어서 id가 없다 페이지 열릴때마다 체크하니....
			var popup = document.getElementsByClassName("login");
			var header = document.getElementsByTagName("header");
			var nav = document.getElementsByTagName("nav");
			var section = document.getElementsByTagName("section");
			var footer = document.getElementsByTagName("footer");
			
			if (popup[0].style.display == "none" || "<%=(String)session.getAttribute("result")%>"=="id"
					|| "<%=(String)session.getAttribute("result")%>"=="pw" || popup[0].style.display == "") {
				popup[0].style.display = "block";
				/* nav[0].style.opacity = "0.3"; */
				section[0].style.opacity = "0.3";
				footer[0].style.opacity = "0.3";
				popup[0].style.opacity = "1";
			} else{
				popup[0].style.display = "none";
				/* nav[0].style.opacity = "1";  */
				section[0].style.opacity = "1";
				footer[0].style.opacity = "1";
			}
		
	}

	function login() {
		/* 회원체크 */
		$.ajax({
			types: "post",
			url : "checkLogin.indexdo",
			data : {
				id : $("#clientId").val(),
				pw : $("#clientPw").val()
			},
			dataType : "text",
			success : function(re) {
				alert(re);
				if(location.href=="http://localhost:8081/KajaAirline/Signup.jsp")
					location.href="index.jsp";
				else
					location.reload();	
			},
			error: function(re){
				alert("에러발생!")
			}
		});
	}
	
	function logout(){
		/* 세션을 여기서 자바코드로 지우면 실행 순서로 인해서 바로 삭제되서 로그아웃 함수를 만듬 */
		$.ajax({
			types: "post",
			url : "checkLogin.indexdo",
			dataType : "text",
			success : function(re) {
				location.replace("index.jsp");
			},
			error: function(re){
				alert("에러발생!")
			}
		});
	}
	
	function changePw(x){
		document.getElementById(x).type="password";
		document.getElementById(x).value="";
	}
	
	function mypage(num){
		if("<%=session.getAttribute("id")%>"!="null"){
			if(num==1)
				location.href="selectClients.mypage";
			else if(num==2)
				location.href="reservation.mypage";
			else if(num==3)
				location.href="write_Inquire.jsp";
			
		}else{
			alert("로그인을 먼저 해주세요~!");
		}
		
	}
	</script>
</body>
</html>