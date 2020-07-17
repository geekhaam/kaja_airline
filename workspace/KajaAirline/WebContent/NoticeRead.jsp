<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- <!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파일 업로드 폼</title>
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

<h3 style="text-align: center;">게시글 내용 </h3>
    <!--
        파일업로드를 위해선 반드시 method="post" enctype="Multipart/form-data"여야함!
     -->
    <form action="AdminNotice.jsp" method="post" enctype="Multipart/form-data">
		<table class="noticeReadTable" border="3">
		<tr>
			<td>작성자</td>
        	<td>관리자</td>
		</tr>
	
	<tr>
        <td>글번호</td>
        <td>${tv6.nNo }</td>
        <input type="hidden" name ="num" value="${tv6.nNo }">
    </tr>
    
	<tr>
	<td>제목</td>
	<td>${tv6.nTitle }</td>
	<input type="hidden" name ="submit" value="${tv6.nNo }">
	</tr>
	
	<tr>
	<td>작성일</td>
	<td>${tv6.nDate }</td>
	</tr>
	 
	 <tr>
     <td>내 용</td>
	<td width ="89%" height="300px"> ${tv6.nContent }</td>
	<input type="hidden" name ="content" value="${tv6.nNo }">        
	</tr>
	
	<tr>
	<td>첨부파일</td>
	<td>
        <!-- 파일 업로드는 input type="file"로 지정한다.-->
        <a id="downA" href="#">${tv6.nFname }</a>
        <input type="hidden" name ="filename" value="${tv6.nNo }">
	</td>
</table>
    </form>
    <hr>
	<div style="text-align: center;">
		<input class="noticeInput" type="button" value="목록" onclick="location.href='AdminNotice.jsp'">
		<div id="adminButton" style="display: none;">
		<a href="AdminNoticeUpdate.do?nNo=${tv6.nNo }&title=${tv6.nTitle }&date=${tv6.nDate }&content=${tv6.nContent }&file=${tv6.nFname }">
			<input class="noticeInput" type="button" value="수정" ></a>
        <a href="AdminNoticeDelete.do?nNo=${tv6.nNo }">
        	<input class="noticeInput" type="button" value="삭제" ></a>
        </div>
	</div>
</section>

    <script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
       window.onload=function(){
    	   if("<%=session.getAttribute("id")%>"=="admin"){
   			document.getElementById("adminButton").style.display="block";
   		}
        	showSlides();
        }
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault();// a 태그의 기본 동작을 막음
            event.stopPropagation();// 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("${fileName2}");
            // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
            window.location.href ="fileDown1.jsp?file_name="+fName;
        });
    </script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>