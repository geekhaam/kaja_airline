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


/* ��� �������� ���� */
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
/* css ���󰡻�Ŭ���� hover Element���� ���콺�� �ö�ö��� ���� */
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
/* ������ ��ư */
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
	<!-- �������׺κ�  ��Ű ����Ͽ� �Ϸ�â�Ⱥ����...�����ؾߵ�. üũ�ڽ���-->
	<div class="notice-container">
		<table style="width: 100%">
			<tr>
				<td style="width: 70%;">
					<div class="noticeSlides fade">
						<%=result[0] %> <a href="AdminNotice.jsp"
							style="font-size: 12px; text-decoration: none; color: white;">>>�ڼ���
							����</a>
					</div>
					<div class="noticeSlides fade">
						<%=result[1] %> <a href="AdminNotice.jsp"
							style="font-size: 12px; text-decoration: none; color: white;">>>�ڼ���
							����</a>
					</div>
					<div class="noticeSlides fade">
						<%=result[2] %> <a href="AdminNotice.jsp"
							style="font-size: 12px; text-decoration: none; color: white;">>>�ڼ���
							����</a>
					</div>
				</td>
				<td style="width: 30%;"><span class="cook"> <input
						type="checkbox" name="cook">���� �Ϸ� ���� �ʱ�
				</span> <a href="javascript:void(0)" onclick="setCookie()"><span
						class="cookDot">X</span></a></td>
		</table>
	</div>

	<div class="login">
		<!-- login â �κ� -->
		<div style="text-align: right; width: 100%; height: 5%;">
			<a style="text-decoration: none; font-size: 15pt; color: black;"
				href="javascript:void(0)" onclick="popupLogin2()">x&nbsp;</a>
		</div>
		<hr>
		<table style="width: 100%;">
			<tr>
				<td style="font-size: 35pt;">�α���
					<hr>
				</td>
			</tr>
			<tr>
				<td><input type="text" class="loginInput" id="clientId"
					value="���̵� �Է�" onfocus="this.select()"></td>
			</tr>
			<tr>
				<td><input type="text" class="loginInput" id="clientPw"
					value="��й�ȣ �Է�" onfocus="changePw(this.id)"></td>
			</tr>
		</table>
		<!-- <div
			style="left: 30%; position: relative; text-align: left; width: 40%; font-weight: lighter;">
			<input type="checkbox" name="confirmPw"><span
				style="font-size: 10pt;">��й�ȣ Ȯ���ϱ�</span> -->
			<hr>
		<!-- </div> -->

		<input type="button" class="loginButton" value="�� �� ��"
			onclick="login()"> <input type="button" class="loginButton"
			value="ȸ������" onclick="location.replace('Signup.jsp')">
		<hr>
	</div>

	<!--�ΰ�� ����Ʈ�� �޴� ��/�α��� �ƿ� -->
	<div class="menuBar">
		<a href="index.jsp"> <img src="./imgs/mainIcon4.jpg"
			style="width: 20%;"></a>
		<!-- ����޴����� �� �޴��� -->

		<div class="dropdown">
			//
			<div class="dropbtn">
				Introduce
				<div class="dropdown-content">
					<a href="introduce.jsp">ȸ�� �̷�</a> <a href="location.jsp">ã�� ���ô� ��</a>
				</div>
			</div>
			//
			<div class="dropbtn">
				Reservation
				<div class="dropdown-content">
					<a href="reservation_main.rsv">���� �ϱ�</a>
				</div>
			</div>
			//
			<div class="dropbtn">
				Support
				<div class="dropdown-content">
					<a href="AdminNotice.jsp">���� ����</a> 
					<a href="javascript:void(0)" onclick="mypage(3)">1:1 ���� �ϱ�</a> 
					<a href="AllFAQ.jsp">FAQ</a>
				</div>
			</div>
			//
			<div class="dropbtn">
				MyPage
				<div class="dropdown-content">
					<a href="javascript:void(0)" onclick="mypage(1)">���� ����</a> 
					<a href="javascript:void(0)" onclick="mypage(2)">���� ����/��� ����</a>
				</div>
			</div>
			<div style="display: none;" id="admin">
			//
				<div class="dropbtn">
				Admin
				<div class="dropdown-content">
					<a href="getAllSchedule.jsp">������ ����</a> <a href="AdminNotice.jsp">�������� �ۼ�</a> 
					<a href="#">1:1���� �亯</a>
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
		�α���</a>
		<span id="logout" style="position: absolute; right: 20px; bottom: 10px;display: none;">
		<span style="font-style: italic;font-size: 12px;color: 586693;">
			<%=session.getAttribute("id") %>�� ȯ���մϴ�.:D<br>
		</span>
		 <a href="javascript:void(0)" onclick="logout()"
			style="text-decoration: none; color: white; ">
		�α׾ƿ�</a>
		</span>
	</div>
	<script src="./js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
	var slideIndex = 0;
	var noticeIndex =0;

 
	
	function showSlides() {
		/* css�� ����� Ŭ���� �� ���� element�� �����ͼ� ��Ʈ�� ����.
		img �����̵�� �κ� ����� �������� �����̵�κб����� �Բ� ����*/
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
		setTimeout(showSlides, 3000); // 3�ʸ��� �ٽ� ȣ���ؼ� ��� �ٲ�� ����
		checkCookie();
	}

		
	function checkCookie(){
		/* ��Ű�� �ִ��� Ȯ����  section �������� �� �����Ⱥ��̰� */
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
		/*onload�� �ϳ��� ���ư��Ƿ� ���⼭ �α��� �α׾ƿ� ���̴� �κб��� ó��  */
		if("<%=(String)session.getAttribute("id")%>"!="null"){
			/* �α����� ���ִ� ���¸� */
			
			
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
		/* �� ��� onload�� ���ư� include ���� jsp�� onload function call */
		
		
	}
	

	function setCookie() {
		/*�������� �κ� xǥ�ø� ������ �ݵǴ� �Լ� üũ �ڽ�üũ ���α��� Ȯ���� ��Ű����  */
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
	/* �α��� üũ �Լ�/ȸ������ ���� �Լ�*/
	
	function popupLogin2(){
		//�ϳ��� ���յǾ��ٰ�..������ ���ؼ� ������. �α��� �ڽ� ���� x ǥ Ŭ���� ����
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
	/* �α��� ��ư�� �˾�������� �α���â�� ������. */
	/* �α��� ���� �ٽ� �������� �ҷ����Ƿ� ���ǹ����� ���� ó��*/
	
		
			//�α����� �ȵǾ id�� ���� ������ ���������� üũ�ϴ�....
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
		/* ȸ��üũ */
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
				alert("�����߻�!")
			}
		});
	}
	
	function logout(){
		/* ������ ���⼭ �ڹ��ڵ�� ����� ���� ������ ���ؼ� �ٷ� �����Ǽ� �α׾ƿ� �Լ��� ���� */
		$.ajax({
			types: "post",
			url : "checkLogin.indexdo",
			dataType : "text",
			success : function(re) {
				location.replace("index.jsp");
			},
			error: function(re){
				alert("�����߻�!")
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
			alert("�α����� ���� ���ּ���~!");
		}
		
	}
	</script>
</body>
</html>