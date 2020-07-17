package com.kaja_air.index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaja_air.index.DAO.KajaDAO;

/**
 * Servlet implementation class IndexController
 */
@WebServlet("*.indexdo")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		/*response.setCharacterEncoding("EUC-KR");*/
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
		
		/*String caseType=request.getRequestURI().substring(request.getContextPath().length());*/
		//��û�� �� ���߿� ������ url�� �����ͼ� üũ ���̽������� �з��ϱ� ���� �뵵
		String[] uri = request.getRequestURI().split("/");
		String caseType="/"+uri[uri.length-1].substring(0);
		
		KajaDAO dao=null;
		switch(caseType) {
		case "/checkLogin.indexdo":
			if(request.getParameter("id")==null) {
				//�α׾ƿ� ��
				session.removeAttribute("id");
				session.removeAttribute("result");
			} else {
				try {
					
					String id = request.getParameter("id");
					String pw = request.getParameter("pw");
					dao = new KajaDAO();
					String result = dao.checkLogin(id, pw);
					System.out.println(result);
					if (result.equals("member")) {
						result = "�α��� ����";
						session.setAttribute("id", id);
						
						
					} else if (result.equals("pw")) {
						result = "��й�ȣ �����Դϴ�";
						session.setAttribute("result", "pw");
					} else if (result.equals("id")) {
						result = "�������� �ʴ� ID�Դϴ�.";
						session.setAttribute("result", "id");
					}
					out.println(result);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					out.close();
				} 
			} // else-end
			break;
		}// switch-end
		
		
	}

}
