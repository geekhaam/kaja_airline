<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- <!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε� ��</title>
<script type="text/javascript">
	window.onload=function(){
		showSlides();
	}
</script>
<style type="text/css">
.noticeWriteTable{
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	text-align: center;
	
}


</style>
</head>
<body>
<%request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("euc-kr");%>
<header>
  <jsp:include page="header.jsp"></jsp:include>
  </header>
  <section id="sectionId" style="text-align: center;">
<h3>���� ���� �ۼ�</h3><hr>


    <form action="NoticeWrite.do" method="post" enctype="Multipart/form-data">
<table class="noticeWriteTable" border="3">
	<tr>
	<td>�ۼ���</td>
    <td><%=session.getAttribute("id") %></td>
	</tr>
	<tr>
	<td>����</td>
	<td><input type="text" name="subject" size="70" maxlength="100" style="width: 99%;" value="" /></td>
	</tr>
	 <tr>
     <td> �� ��</td>
     <td><textarea name="content" cols="72" rows="20"style="width: 99%;"></textarea></td>        
     </tr>
     <tr>
	 <tr>
	 <td>����÷��</td>
	 <td>
         <!-- ���� ���ε�� input type="file"�� �����Ѵ�.-->
        <input type="file" name="fileName1"  /><br/>
	</td>
</table>

     	        <br><hr>
        <input type="reset" value="�ۼ����" onclick="location.href='AdminNotice.jsp'"> 
        <input type="submit" value="���" >
</form>

</section>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>