<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
 <!DOCTYPE html>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 폼</title>
<style type="text/css">
	.noticeUpdateTable{
	width: 50%;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}
.updateButton{
	font-size: 15pt;
	text-align: center;
	padding: 3px;
}

</style>
<script type="text/javascript">
	window.onload=function(){
		showSlides();
	}
</script>
</head>
<body>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>
<section id="sectionId">

<h3 style="text-align: center;">게시글 수정화면</h3>

    <form action="AdminNoticeUpdateForm.do" method="post">
    <input type="hidden" name="nNo" value="${num2 }"> <!-- 글 번호 -->
<table class="noticeUpdateTable" border="3" >


	<tr>
		<td>작성자</td>
        <td>관리자</td>
	</tr>
	
	<tr>
        <td>글번호</td>
        <td>${num2 }</td>
    </tr>
    
	<tr>
	<td>제목</td>
	 <td >
	 <input type= "text" name = "subject" value="${title }">
	 </td>
	</tr>
	
	<tr>
	<td>작성일</td>
	<td>${date }</td>
	</tr>
	 
	 <tr>
     <td>내 용</td>
    <td>
    <textarea name="content" cols="72" rows="20" >${content }</textarea>      
    </td>
	</tr>
	
	<tr>
	<td>첨부파일</td>
	<td>
    ${file }
	</td>
	</tr>
</table>	
<hr><br>
	<div style="margin-left: auto;margin-right: auto;text-align: center;">
            <input class="updateButton" type="button" value="목록" onclick="location.href='AdminNotice.jsp'">
            <input class="updateButton" type="submit" value="입력" >
     </div>
 	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>