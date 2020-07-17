<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Ϸ�</title>
<style>
html, body {
   padding: 0px;
   border: 0px;
   margin: 0;
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

   margin: 2%;
    margin-top: 13%;
}

footer {
   position : relative;
   width: 100%;
   height: 20%;
   z-index: 100;
}

.title {
   text-align: center;
   margin: 35px;
   font-size: 26pt;
}

.subtitle {
   text-align: center;
   margin: 30px;
   font-size: 24pt;
}

.button {
   font-size: 14pt;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		showSlides();
	}
</script>
</head>
<body>

<header>
   <jsp:include page="./header.jsp" />
</header>

   <section id="sectionId">
   <h1 class="title">���� �Ϸ�</h1>
   
   <hr><br><br>
   
   <div align="center">
      <h1 class="subtitle">���Ű� �Ϸ�Ǿ����ϴ�.</h1>
      <h1 class="subtitle">�����װ��� �̿��� �ּż� �����մϴ�.</h1>
      
      - ������ ž�¼����� �ش� �װ��� ��� 2�ð� ������ 60�� ������ �Դϴ�. <br>
      - ž�°� ������ �ź����� �����Ͻð�, ž�±��� �߱� ������ �� ž���Ͽ� �ֽñ� �ٶ��ϴ�. <br>
      - �װ��� ������ �����ΰ� �����̸�, ���� ���� ���� ���� �� �� �ֽ��ϴ�.
   </div>
   
   <br><br>
   
   <div align="center">
      <input class="button" type="button" value="���� ���ų���" onclick="location.href='../reservation.mypage';">
   </div>
   </section>
   
<footer>
   <jsp:include page="./footer.jsp" />
</footer>
   

</body>
</html>