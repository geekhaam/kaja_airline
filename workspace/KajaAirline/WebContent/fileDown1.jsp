<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �ٿ�ε� ������</title>
</head>
 <!-- ���ε��� �ٿ�ޱ� ���� �ʿ��� -->
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
    // a�±��� href�� fileDown1.jsp?file_name="<%=fileName1 �� ���� ������
    // �ߺ� ���� ó���� ���ϸ� ���� �����´�.
    String fileName = request.getParameter("file_name");
     
    // ���ε��� ������ ��ġ�� ���ε� ������ �̸��� �˾ƾ� �Ѵ�.
    String savePath ="uploadFile";// WebContent/uploadFile
    // ���� ������ ������̰� ������ ������ ��¥ ��θ� ���ؿ;��Ѵ�.
    String sDownPath = request.getRealPath(savePath);
     
    System.out.println("�ٿ�ε� ���� ���� ��� ��ġ : " + sDownPath);
    System.out.println("fileName1 : " + fileName);
     
    // ����Ǿ� �ִ� �������/����� ���ϸ� ���� Ǯ path�� ������ش�.
        // �ڹٿ����� \�� ǥ���ϱ� ���ؼ��� \�� �ѹ� �� �ٿ��ֱ� ������ \\�� ���ش�.
    String sFilePath = sDownPath +"\\" + fileName;// ex)c:\\uploadPath\\image.jpg
    System.out.println("sFilePath : " + sFilePath);
    // Ǯ path�� ���Ѱ� ���� ��ü�� �νĽ�Ų��.
    File outputFile =new File(sFilePath);
    // ����� ������ �о�� ������ ���۸� �ӽ÷� ����� ������ �뷮�� ������ �ѹ��� ���ε��� �� �ִ� ����ũ��� �����Ѵ�.
    byte[] temp =new byte[1024*1024*10];// 10M
     
    // ������ �о�;� ������ inputStream�� ����.(Ǯ�н��� ������ ���� ��ü�� �̿��� input��Ʈ���� �����Ѵ�.)
    FileInputStream in =new FileInputStream(outputFile);
     
    // ���� Ȯ�� : �о�� ����� ������ ���� -> ������ ������ �� Ÿ���� �����ؾ� �Ѵ�.
    String sMimeType = getServletContext().getMimeType(sFilePath);
     
    System.out.println("���� : " + sMimeType);
     
    // �������� ���� ���� ����ó��
    if ( sMimeType ==null ){
        // �������� ǥ��
        sMimeType ="application.octec-stream";// �Ϸõ� 8bit ��Ʈ�� ����
        // ������ �˷����� ���� ���Ͽ� ���� �б� ���� ����
    }
     
    // ���� �ٿ�ε� ����
    // ������ ������ �ش�.
    response.setContentType(sMimeType);// ������ �������� text/html;charset=utf-8��
    // ���� mime Ÿ������ ������ �ش�.
     
    // ���ε� ������ ������ ���� �� �����Ƿ� ���ڵ��� ���ش�.
    String sEncoding =new String(fileName.getBytes("euc-kr"),"8859_1");
    //String B = "utf-8";
    //String sEncoding = URLEncoder.encode(A,B);
     
    // ��Ÿ ������ ����� �÷��� �Ѵ�.
    // ��Ÿ ������ ���� ���������� �ٿ�ε� �� ȭ�鿡 ��½��� �ش�.
    String AA ="Content-Disposition";
    String BB ="attachment;filename="+sEncoding;
    response.setHeader(AA,BB);
     
    // �������� ����
    ServletOutputStream out2 = response.getOutputStream();
     
    int numRead =0;
     
    // ����Ʈ �迭 temp�� 0������ numRead������ �������� ���
        // ������ ��ġ�� ���� ����� inputStream���� �е� ��(-1) ������ while�� ����.
    while((numRead = in.read(temp,0,temp.length)) != -1){// temp �迭�� �о�ðǵ� 0��° �ε������� �ѹ��� �ִ� temp.length ��ŭ �о�´�.
        // �о�ð� ���̻� ������ -1�� �����ϸ鼭 while���� ��������
         
        // �������� ��� : �ٴ� header ������ attachment�� �س��������� �ٿ�ε尡 �ȴ�.
        out2.write(temp,0,numRead);// temp�迭�� �ִ� �������� 0��°���� �ִ� numRead��ŭ ����Ѵ�.
    }
    // �ڿ� ����
    out2.flush();
    out2.close();
    in.close();
%>


