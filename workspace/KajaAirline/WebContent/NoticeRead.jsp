<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- <!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���ε� ��</title>
<style type="text/css">

.noticeReadTable{
	width: 50%;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}
.noticeInput{
	font-size: 15pt;
	text-align: center;
	padding: 3px;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");
%>
<header>
 <jsp:include page="header.jsp"></jsp:include>
 </header>
 <section id="sectionId">

<h3 style="text-align: center;">�Խñ� ���� </h3>
    <!--
        ���Ͼ��ε带 ���ؼ� �ݵ�� method="post" enctype="Multipart/form-data"������!
     -->
    <form action="AdminNotice.jsp" method="post" enctype="Multipart/form-data">
		<table class="noticeReadTable" border="3">
		<tr>
			<td>�ۼ���</td>
        	<td>������</td>
		</tr>
	
	<tr>
        <td>�۹�ȣ</td>
        <td>${tv6.nNo }</td>
        <input type="hidden" name ="num" value="${tv6.nNo }">
    </tr>
    
	<tr>
	<td>����</td>
	<td>${tv6.nTitle }</td>
	<input type="hidden" name ="submit" value="${tv6.nNo }">
	</tr>
	
	<tr>
	<td>�ۼ���</td>
	<td>${tv6.nDate }</td>
	</tr>
	 
	 <tr>
     <td>�� ��</td>
	<td width ="89%" height="300px"> ${tv6.nContent }</td>
	<input type="hidden" name ="content" value="${tv6.nNo }">        
	</tr>
	
	<tr>
	<td>÷������</td>
	<td>
        <!-- ���� ���ε�� input type="file"�� �����Ѵ�.-->
        <a id="downA" href="#">${tv6.nFname }</a>
        <input type="hidden" name ="filename" value="${tv6.nNo }">
	</td>
</table>
    </form>
    <hr>
	<div style="text-align: center;">
		<input class="noticeInput" type="button" value="���" onclick="location.href='AdminNotice.jsp'">
		<div id="adminButton" style="display: none;">
		<a href="AdminNoticeUpdate.do?nNo=${tv6.nNo }&title=${tv6.nTitle }&date=${tv6.nDate }&content=${tv6.nContent }&file=${tv6.nFname }">
			<input class="noticeInput" type="button" value="����" ></a>
        <a href="AdminNoticeDelete.do?nNo=${tv6.nNo }">
        	<input class="noticeInput" type="button" value="����" ></a>
        </div>
	</div>
</section>

    <script type="text/javascript">
        // ���������� �׳� �ٿ�ε� Ŭ���� �����۵������� �ѱ����ϸ��� ���������� ������� ���ڵ� ������ �߻��� �� �ִ�. �ѱ��� ���� �����۵����� ���� �� ����
        // ����, �������ڿ��� �ѱ��� ���� ���� �׻� ���ڵ��� �ؼ� �����ֵ��� ����.
       window.onload=function(){
    	   if("<%=session.getAttribute("id")%>"=="admin"){
   			document.getElementById("adminButton").style.display="block";
   		}
        	showSlides();
        }
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault();// a �±��� �⺻ ������ ����
            event.stopPropagation();// �̺�Ʈ�� ���ĸ� ����
            // fileName1�� utf-8�� ���ڵ��Ѵ�.
            var fName = encodeURIComponent("${fileName2}");
            // ���ڵ��� �����̸��� �������ڿ��� ���Խ��� �ٿ�ε� �������� �̵�
            window.location.href ="fileDown1.jsp?file_name="+fName;
        });
    </script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>