<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<script src="./js/jquery-3.1.1.js"></script>
<style>
body{
	background-image: url("./imgs/bg.jpg");
}

.title {
	text-align: center;
	margin: 35px;
	font-size: 26pt;
}
.table {
	width: 42%;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid;
	border-left: 1px solid;
	/* 
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc; */
	margin: auto;
}

.th {
	width: 30%;
	font-size: 17pt;
	padding: 10px;
	border-right: 1px solid ;
	border-bottom: 1px solid ;
	/* border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	 */
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}
.td {
	width: 70%;
	border-right: 1px solid ;
	border-bottom: 1px solid ;/* 
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc; */
}
.input {
	width: 94%;
	padding : 13px;
	font-size: 15pt;
}
.input2 {
	width: 66%;
	padding : 13px;
	font-size: 15pt;
}


</style>
</head>
<body>

	<header>
	<jsp:include page="header.jsp" />
	
	</header>
	<script src="./js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
		window.onload=function setSign() {
			var check = document.getElementById("submit");
			check.disabled = true;
			showSlides();
		}
		var idFlag = false;
		var pwFlag = false;
		
		function overlap() {
			$.ajax({
				type: "post",
				url: "idOverlap.mypage",
				data: {cId : $('#cId').val()},
				dataType: "text",
				contentType: "application/x-www-form-urlencoded; charset=euc-kr",
				success: function(data) {
					 if(data == 1){
			               if($('#cId').val()!=''){ 
			               	alert("사용가능한 아이디입니다.");
			               	idFlag = true;
			               	check();
			               }else
			            	   alert("아이디를 적어주세요.");
			           	} else {
			               if($('#cId').val()!=''){
			                  alert("중복된 아이디입니다.");
			                  $('#cId').val('');
			                  $('#cId').focus();
			               }
			            }
				}
			});
		}
		
		$(function() {
			$("#success").hide();
			$("#fail").hide();
			$("input").keyup(function(){ 
				var cPw=$("#cPw").val(); 
				var cPw2=$("#cPw2").val();
				if(cPw != '' || cPw2 != '') {
					if(cPw == cPw2) {
						$("#success").show();
						$("#success").css("color", "green");
						$("#fail").hide();
					} else {
						$("#success").hide();
						$("#fail").show();
						$("#fail").css("color", "red");
						pwFlag = true;
						check();
					}
				}
			});
		});
		
		function check() {
			var check = document.getElementById("submit");
			if(idFlag == true && pwFlag == true) {
				check.disabled = false;
			} else {
				check.disabled = true;
			}
		}
		function noRewrite(){
			$('#cId').val('');
		}
	</script>
	
	<section id="sectionId">
	<h1 class="title">회원가입</h1>
	
	<hr><br><br>
	
	<form action="signup.mypage" name="signup" method="post">
	<table class="table">
		<tr>
			<th class="th">아이디</th>
			<td class="td">
				<input type="text" class="input2" id="cId" name="cId" required="required" onfocus="noRewrite()">
				<input type="button" value="중복 확인" onclick="overlap()" style="width: 25%;padding: 10px;font-weight: bold;">
			</td>
		</tr>
		<tr>
			<th class="th">비밀번호</th>
			<td class="td"><input class="input" type="password" id="cPw" name="cPw" required="required"></td>
		</tr>
		<tr>	
			<th class="th">비밀번호 확인</th>
			<td class="td">
				<input class="input" type="password" id="cPw2" name="cPw2" required="required">
				<div id="success">비밀번호가 일치합니다.</div>
				<div id="fail">비밀번호가 일치하지 않습니다.</div>
			</td>
		</tr>
		<tr>
			<th class="th">이름</th>
			<td class="td"><input class="input" type="text" name="cName" required="required"></td>
		</tr>
		<tr>
			<th class="th">전화번호</th>
			<td class="td"><input class="input" type="text" name="cTel" required="required"></td>
		</tr>
		<tr>
			<th class="th">이메일</th>
			<td class="td"><input class="input" type="text" name="cEmail" required="required"></td>
		</tr>
		<tr>
			<th class="th">국적</th>
			<td class="td"><input class="input" type="text" name="cNation" required="required"></td>
		</tr>
		<tr>
			<th class="th">주소</th>
			<td class="td"><input class="input" type="text" name="cResiAddr" required="required"></td>
		</tr>
	</table>
	<br><br>
	
	<div align="center">
		<input type="submit" class="buttonUpdate" value="회원가입" id="submit">
	</div>
	</form>
	<br>
	</section>
	
	<footer>
	<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>