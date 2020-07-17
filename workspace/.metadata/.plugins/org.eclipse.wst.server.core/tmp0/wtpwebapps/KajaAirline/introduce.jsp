<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
	background-image: url("./imgs/bg.jpg");
}
	.introduceTable{
		margin-left: auto;
		margin-right: auto;
		width: 80%;
		text-align: left;
		border: 0;
		padding: 0;
	}	
</style>
<script src="./js/jquery-3.1.1.js"charset="euc-kr"></script>
<script type="text/javascript">
window.onload=function setSign() {
	showSlides();
}
</script>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<section id="sectionId">
	
		<table class="introduceTable">
			<tr><td colspan="2" style="text-align: center;font-size: 25pt;">
				Kaja Airline
			</td></tr>
			<tr>
			<td style="width: 50%;">
				<p style="font-size: 20pt;">ȸ�� �Ұ�</p>
				<p style="font-size: 13pt;line-height: 130%;">&nbsp;2020�� '�ְ��� ������ ����, ������ ������ ����<br> 
				�� ����'�̶�� �濵�̳����� â���� Kaja Airline�� <br>
				�̷� �� ���迡 ���������� ��ġ�� �۷ι� �װ���� �����Ͽ�<br>
				���� ���� ��ŭ�̳� ģ���ϰ� �����ϸ� ���� � ���񽺷�<br>
				������ �ٰ������� �մϴ�.<br>
				���� Kaja Airline�� �ֽ� ����� ������ �ֿ켱����<br>
				�߱��ϸ� �̷��� ���� ����� ����ϰ� �ֽ��ϴ�.<br>
				�������� ���� �ְ� 1���� �����ġ�� â���ϴ� �Ƹ��ٿ� <br>
				������μ��� ������ ���ϰ��� ���Ӿ��� ����� ����̰� �ֽ��ϴ�.<br>
 				���� ����/ȯ��/��� �濵 �� ��ȸ���忡 �̸������ <br>
 				����� ��ȸ�� å���� ���Ͽ� ���� ������ ������ �߱��ϴ� <br>
 				���� �ְ��� �װ��簡 �ǰ��� �մϴ�.<br>
				���� Kaja Airline�� �Բ� ��̰� ����� ���� �ǽñ� �ٶ��ϴ�.</p>
			</td>
			<td class="slideshow-container" style="width: 50%;">
				<div class="imgSlides fade" style="display: block;"><br>
					<img src="./imgs/testAirPort1.jpg" style="width: 100%;">
				</div>
				<div class="imgSlides fade"><br>
					<img src=./imgs/testAirPort2.jpg style="width: 100%;">
				</div>
			</td>
			</tr>
		</table>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>