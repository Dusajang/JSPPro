package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;


//@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Delete() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Delete.doGet()...");
		
		
		
	    // view.jsp 포워딩
 		String path = "/days04/board/delete.jsp";
 		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
 		dispatcher.forward(request, response);
	}


	// http://localhost/jspPro/cstvsboard/delete.htm?seq=4
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("> Delete.doPost()...");
		
		long pseq = Long.parseLong(request.getParameter("seq"));
		String ppwd = request.getParameter("pwd");
		  
	      
	      Connection conn = DBConn.getConnection();
	      BoardDAOImpl dao = new BoardDAOImpl(conn);
	      int rowCount = 0;
	      String originalPwd;
	      String location = "/jspPro/cstvsboard/";
	      
	      try {
	         originalPwd = dao.getOriginalPwd(pseq);
	         if (originalPwd.equals(ppwd)) {
				rowCount = dao.delete(pseq);
				location += "list.htm";
			}else {
				//location += "delete.htm?seq="+pseq+"&delete=fail";
				// 모달창 삭제
				location += "view.htm?seq="+pseq+"&delete=fail";
			}
	      } catch (SQLException e) { 
	         System.out.println("> Edit.doPost() Exception...");
	         e.printStackTrace();
	      }
	      
	      DBConn.close();
	      
	      // [ 리다이렉트 ]
	      response.sendRedirect(location);
		
	}

}
