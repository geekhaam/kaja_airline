<%@page import="clientsVO.ClientsVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 변경</title>
<style>

body{
	background-image: url("./imgs/bg.jpg");
}
.title {
	text-align: center;
	margin: 35px;
	font-size: 26pt;
}

.subtitle {
	text-align: center;
	margin: 30px;
}

.table {
	width: 50%;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	margin: auto;
}

.th {
	width: 30%;
	font-size: 17pt;
	padding: 10px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

.td {
	width: 70%;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.input {
	width: 94%;
	
	font-size: 15pt;
	padding: 13px;
}



</style>
<script type="text/javascript">
	window.onload=function start() {
		
		showSlides();
	}
		function deleteClick() {
			if(confirm("정말 탈퇴하시겠습니까?")){
				location.href="clientsDelete.mypage";
			}
		}
	</script>
</head>
<body>

	<%
		ClientsVO vo = (ClientsVO)request.getAttribute("vo");
	%>
	
	
	
	<header>
	<jsp:include page="header.jsp" />
	</header>

	<section id="sectionId">
	<div>
		<h1 class="title">회원 정보 변경</h1>

		<hr>

		<h2 class="subtitle"><%=vo.getcName() %>님, 안녕하세요!</h2>

		<form action="clientsUpdate.mypage" method="post">
			<table class="table">
				<tr>
					<th class="th">아이디</th>
					<td class="td"><input class="input" type="text" name="cId" value="<%=vo.getcId() %>" readonly></td> <!-- 아이디는 못바꿈 -->
				</tr>
				<tr>
					<th class="th">비밀번호</th>
					<td class="td"><input class="input" type="text" name="cPw" value="<%=vo.getcPw() %>" required="required"></td>
				</tr>
				<tr>
					<th class="th">이름</th>
					<td class="td"><input class="input" type="text" name="cName" value="<%=vo.getcName() %>" required="required"></td>
				</tr>
				<tr>
					<th class="th">전화번호</th>
					<td class="td"><input class="input" type="text" name="cTel" value="<%=vo.getcTel() %>" required="required"></td>
				</tr>
				<tr>
					<th class="th">이메일</th>
					<td class="td"><input class="input" type="text" name="cEmail" value="<%=vo.getcEmail() %>" required="required"></td>
				</tr>
				<tr>
					<th class="th">국적</th>
					<td class="td"><input class="input" type="text" name="cNation" value="<%=vo.getcNation() %>" required="required"></td>
				</tr>
				<tr>
					<th class="th">주소</th>
					<td class="td"><input class="input" type="text" name="cResiAddr" value="<%=vo.getcResiAddr() %>" required="required"></td>
				</tr>
				</table>

				<br><br>
				
				<div align="center">
					<input class="buttonUpdate" type="submit" value="회원 정보 변경"> &nbsp;
					<input class="buttonUpdate" type="button" value="회원 탈퇴"	onclick="deleteClick();"><br><br>
					<!-- cId 임의 --> 
					<input class="buttonUpdate" type="button" value="취 소" onclick="location.href='index.jsp'">
					<!-- 취소버튼은 메인으로 가는 버튼 -->
				</div>
		</form>
	</div>
	</section>
	
	<footer>
	<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>