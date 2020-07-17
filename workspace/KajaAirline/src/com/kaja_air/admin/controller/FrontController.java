package com.kaja_air.admin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaja_air.admin.DAO.AdminDAO;
import com.kaja_air.admin.VO.AdmimVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession();

		String c = request.getRequestURI().substring(request.getContextPath().length());

		String str = null;
		switch(c) {
		
		
		case "/ScheduleSearchOne.do": // dao(2) 하나의 스케줄 가져오기
			AdminDAO tidao2 = null;
			AdmimVO tv2 = null;
			
			try {
				tidao2 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			
			String pid = request.getParameter("pId");//pId = 스케줄 ID 
			String pdeparture = request.getParameter("pDeparture");
			String pArrive = request.getParameter("pArrive");
			
			try {
				tv2 = tidao2.getOneSchedule(pid);
			
			} catch (SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			
			request.setAttribute("pid2", pid);
			request.setAttribute("pdeparture2",pdeparture);
			request.setAttribute("parrive2", pArrive);
			request.setAttribute("tv2", tv2);

			str = "AdminScheduleUpdateForm.jsp";
			break;
			
			
		case "/AdminScheduleUpdate.do": //dao(3) 하나의 스케줄을 수정
			
			AdminDAO tidao3 = null;
			AdmimVO tv3 = null;
			
			//수정한 스케줄들~
			int pid2 = Integer.parseInt(request.getParameter("pid"));
			String d = request.getParameter("dtime");
			String d1 = request.getParameter("atime");
			String departure = request.getParameter("departure");
			String arrive = request.getParameter("arrive");
			int aprice = Integer.parseInt(request.getParameter("aprice"));
			int cprice = Integer.parseInt(request.getParameter("cprice"));
			int bprice = Integer.parseInt(request.getParameter("bprice"));
			
			//수정하기전  departure,arrive
			String departure2 = request.getParameter("departure1");
			String arrive2 = request.getParameter("arrive1");

			try {
				tidao3 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			tidao3.UpdateSchedule(pid2, d, d1, departure, arrive, aprice, cprice, bprice, departure2, arrive2);
			
			str = "getAllSchedule.jsp";
			break;
			
		case "/AdminScheduleDelete.do":
			AdminDAO tidao4 = null;
			AdmimVO tv4 = null;
			
			
			int pid3 = Integer.parseInt(request.getParameter("pid"));  //스케줄 번호
			String departure1 = request.getParameter("departure1"); //출발지
			String arrive1 = request.getParameter("arrive1"); //도착지
			
			try {
				tidao4 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			try {
				tidao4.DeleteSchedule(pid3, departure1, arrive1);
				
			} catch (SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			str="getAllSchedule.jsp";
			break;
			
			
			
		case "/NoticeWrite.do":
			
			AdminDAO tidao5 = null;
			AdmimVO tv5 = null;
			
			
			
			//현재 날자와 시간 구하기
			Date nowtime = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmm");
			String nowdate = sf.format(nowtime);
			
			 // request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
		    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
		    String uploadPath = request.getRealPath("/uploadFile");
		    //System.out.println("절대경로 : " + uploadPath +"<br/>");
		    
		    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
		     
		    String name ="";
		    String subject ="";
		    
		    String content1= "";
		    
		    String num="";
		   
		    String fileName1 ="";// 중복처리된 이름
		    String originalName1 ="";// 중복 처리전 실제 원본 이름
		    long fileSize =0;// 파일 사이즈
		    String fileType ="";// 파일 타입
		    
		    MultipartRequest multi =null;
		     
		    try{
		    	
		    	// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
		        multi =new MultipartRequest(request,uploadPath,maxSize,"EUC-KR",new DefaultFileRenamePolicy());
		      
		        // form내의 input name="name" 인 녀석 value를 가져옴
				/* name = multi.getParameter("name"); */
		        subject = multi.getParameter("subject"); //글제목
		        content1 = multi.getParameter("content"); //글내용
		        num = multi.getParameter("num");
		        // 전송한 전체 파일이름들을 가져옴
		        Enumeration files = multi.getFileNames(); 
		       
		         
		        while(files.hasMoreElements()){
		            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
		            String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
		            // 그에 해당하는 실재 파일 이름을 가져옴
		            originalName1 = multi.getOriginalFileName(file1);
		            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
		            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
		            fileName1 = multi.getFilesystemName(file1);
		            // 파일 타입 정보를 가져옴
		            fileType = multi.getContentType(file1);
		            // input file name에 해당하는 실재 파일을 가져옴
		            File file = multi.getFile(file1);
		            // 그 파일 객체의 크기를 알아냄
		            fileSize = file.length();
		        }
		    }catch(Exception e){
		        e.printStackTrace();
		    }
		    

		    try {
		    	;
				tidao5 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		   
		    
			try {
				tidao5.insertNoticeList(subject, nowdate, content1, uploadPath, fileName1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println(num);
			request.setAttribute("num", num);
			str = "AdminNotice.jsp";
			
			break;
			
			//게시물 내용을 가져옴
		case "/NoticeContent.do":
			
			
			AdminDAO tidao6 = null;
			AdmimVO tv6 = null;
			String name1 = request.getParameter("name");
			String subject1 = request.getParameter("subject");
			String fileName2 = request.getParameter("fileName1");
			String originalName2 = request.getParameter("originalName1");
			
			
			
			
			try {
				tidao6 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String no = request.getParameter("nNo");
		
			try {
			tv6= tidao6.getOneNotice(no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("tv6", tv6);
			request.setAttribute("name1", name1);
			request.setAttribute("subject1", subject1);
			request.setAttribute("fileName2", fileName2);
			

			str = "NoticeRead.jsp";
			break;
			
		case "/AdminNoticeUpdate.do":
			
			AdminDAO tidao7 = null;
			AdmimVO tv7 = null;
			
			String num2 = request.getParameter("nNo");
			String title = request.getParameter("title");
			String date = request.getParameter("date");
			String content = request.getParameter("content");
			String file = request.getParameter("file");
			
			request.setAttribute("num2", num2);
			request.setAttribute("title", title);
			request.setAttribute("date", date);
			request.setAttribute("content",content );
			request.setAttribute("file", file);
			
			str = "AdminNoticeUpdateForm.jsp";
			break;
			
		case "/AdminNoticeDelete.do":
			
			AdminDAO tidao8 = null;
			AdmimVO tv8 = null;
			
			String num3 = request.getParameter("nNo");
			
			try {
				tidao8 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			tidao8.deleteNotice(num3); 
			
			str = "AdminNotice.jsp";
			break;
			
		case "/AdminNoticeUpdateForm.do":

			AdminDAO tidao9 = null;
			AdmimVO tv9 = null;
			
			String num4 = request.getParameter("nNo");//글번호
			String subject2 = request.getParameter("subject");//글제목			
			String content2 = request.getParameter("content"); //글내용
			System.out.println(num4);
			System.out.println(subject2);
			System.out.println(content2);
			
			try {
				tidao9 = new AdminDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				tidao9.updateNotice(num4, subject2, content2);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			str = "AdminNotice.jsp";
			break;
			
		} //switch -end
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
