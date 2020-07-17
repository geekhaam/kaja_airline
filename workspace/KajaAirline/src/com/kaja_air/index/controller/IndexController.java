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
		//요청이 온 것중에 보낼때 url을 가져와서 체크 케이스문에서 분류하기 위한 용도
		String[] uri = request.getRequestURI().split("/");
		String caseType="/"+uri[uri.length-1].substring(0);
		
		KajaDAO dao=null;
		switch(caseType) {
		case "/checkLogin.indexdo":
			if(request.getParameter("id")==null) {
				//로그아웃 시
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
						result = "로그인 성공";
						session.setAttribute("id", id);
						
						
					} else if (result.equals("pw")) {
						result = "비밀번호 오류입니다";
						session.setAttribute("result", "pw");
					} else if (result.equals("id")) {
						result = "존재하지 않는 ID입니다.";
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
