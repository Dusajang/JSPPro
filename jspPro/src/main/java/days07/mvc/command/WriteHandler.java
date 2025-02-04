package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if (method.equals("GET")) {  // GET  POST
			return "/days07/board/write.jsp";
		}else { // POST
			request.setCharacterEncoding("UTF-8");
		      
		      String writer = request.getParameter("writer");
		      String pwd = request.getParameter("pwd");
		      String email = request.getParameter("email");
		      String title = request.getParameter("title");
		      String content = request.getParameter("content");
		      int tag = Integer.parseInt( request.getParameter("tag") );
		      
		      Connection conn = ConnectionProvider.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);
		      int rowCount = 0;
		      BoardDTO dto = 
		   new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);
		      
		      try {
		         rowCount = dao.insert(dto);
		      } catch (SQLException e) { 
		         System.out.println("> WriteHandler.Post() Exception...");
		         e.printStackTrace();
		      }
		      
		      conn.close();
		      
		      // [ 리다이렉트 ]
		      String location = "/jspPro/board/list.do";
		      location += rowCount == 1 ? "?write=success":"?write=fail";
		      response.sendRedirect(location);
		}//if
		return null;
	}

}
