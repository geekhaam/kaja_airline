<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.table_imsi{
		width: 100%;
		margin-left: auto;
		margin-right: auto;
		background-color: #475774;
		color: #e6dbdb;
	}
</style>
</head>
<body>
	<%request.setCharacterEncoding("EUC-KR"); 
	response.setCharacterEncoding("EUC-KR");%>
	<hr>

	<table class="table_imsi">
	<tr><td colspan="3" align="center"><strong style="font-style: italic;font-size: 20pt;">Kaja Airline</strong></td></tr>
	<tr><td align="left" width="70%" style="padding-left: 20px;">
	<ul>
		<li><strong>�����װ���</strong> ��ǥ�̻� ���� ������</li>
		<li>����ڵ�Ϲ�ȣ 104-81-17480</li>
		<li>����Ǹž� �Ű� �� 11-1111</li>
		<li>����Ư���� ���α� ���� 56</li>
		<li>���� 1588-9999 / 02-1212-2121</li>
		<li>����������ȣå���� �������� �� ������</li>
		<li>���� ��ġ : �ܼ������ �����װ��� ���꼾��</li>
	</ul>
	</td>
	<td width="15%" align="right" style="font-size: 6pt;"><img src="./imgs/award1.jpg"><br>������ ������ �ݻ� ����</td>
	<td width="15%" align="center" style="font-size: 6pt;"><img src="./imgs/award2.jpg"><br>��������� ���� ���� ���� ����</td>
	</tr>
	</table>
</body>
</html>