package customer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import airfaqDAO.AirFAQDAO;
import airfaqVO.AirFAQVO;
import airinquireDAO.AirInquireDAO;
import airinquireVO.AirInquireVO;
import airnoticeDAO.AirNoticeDAO;
import airnoticeVO.AirNoticeVO;

/**
 * Servlet implementation class NoticeFrontController
 */
@WebServlet("*.customerdo")
public class kajaAirLineFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public kajaAirLineFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");

		String c = request.getRequestURI().substring(request.getContextPath().length());

		String str = null;
		switch (c) {
		case "/getNoticeForm.customerdo":
			AirNoticeDAO andao1 = null;
			AirNoticeVO anv1 = null;
			ArrayList<AirNoticeVO> list = null;
			int total = 0;
			try {
			andao1 = new AirNoticeDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String snTitle = request.getParameter("nTitle");
			try {
				anv1 = andao1.getInfo(snTitle);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("snTitle", snTitle);
			request.setAttribute("sanv1", anv1);
			str = "/getNoticeForm.jsp";
			break;
			
		case "/write_Inquire.customerdo":
			AirInquireDAO aidao1 = null;
			AirInquireVO aiVO = null;
			
			String uploadPath = request.getRealPath("/uploadFile");
			System.out.println(uploadPath);
			String iName = "";
			String iTitle="";
			String iContent = "";
			String iId = "";
			String iFile="";
			String iFilePath="";
			
			int maxSize =1024 *1024 *10;
			String originalName1 ="";
			String fileType = "";
			String fileName1="";
			long fileSize=0;
			
			MultipartRequest mr = null;
			
			try {
				mr = new MultipartRequest(request, uploadPath, maxSize, "EUC-KR", new DefaultFileRenamePolicy());

				iName = mr.getParameter("iName");
				iTitle = mr.getParameter("iTitle");
				iContent = mr.getParameter("iContent");
				iId = mr.getParameter("iId");
				
				Enumeration files = mr.getFileNames();
				
				while(files.hasMoreElements()) {
		            String file1 = (String)files.nextElement();           
		            originalName1 = mr.getOriginalFileName(file1);
		            fileName1 = mr.getFilesystemName(file1);
		            fileType = mr.getContentType(file1);
		            File file = mr.getFile(file1);
		            fileSize = file.length();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			try {
				aidao1 = new AirInquireDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			try {
			aidao1.insert_Inquire(iId, iName, iTitle, iContent, fileName1, uploadPath);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
/*			request.setAttribute("iContent", iContent);
			request.setAttribute("iName", iName);
			request.setAttribute("iTitle", iTitle);
			request.setAttribute("fileName1",fileName1 );
			request.setAttribute("originalName1", originalName1);*/
			
			str = "index.jsp";
			break;
			
		case "/getInquireForm.customerdo":
			AirInquireDAO aidao2 = null;
			AirInquireVO aiv2 = null;
			try {
				aidao2 = new AirInquireDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String siTitle = request.getParameter("name");
			try {
				aiv2 = aidao2.getInfo(siTitle);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("siTitle", siTitle);
			request.setAttribute("saiv1", aiv2);
			str = "/getInquireForm.jsp";
			break;
		case "/SearchFAQ.customerdo":
			AirFAQDAO afDAO3 = null;
			ArrayList<AirFAQVO> afVO3 = null;
			try {
				afDAO3 = new AirFAQDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String Kategorie1=request.getParameter("Kategorie1");
			try {
				afVO3=afDAO3.SearchQ(Kategorie1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("sKategorie1", Kategorie1);
			request.setAttribute("afVO3", afVO3);
			str="/SearchFAQ.jsp";
		}
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
