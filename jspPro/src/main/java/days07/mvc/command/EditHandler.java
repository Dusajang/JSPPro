package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if (method.equals("GET")) {  // GET  POST
			String referer = request.getHeader("referer");
			long pseq = Long.parseLong(request.getParameter("seq"));
			
			Connection conn = ConnectionProvider.getConnection();
		    BoardDAOImpl dao = new BoardDAOImpl(conn);
		    int rowCount = 0;
		    BoardDTO dto = null;
		    
		    // 트랜잭션 처리 필요한 부분
		    try {
				dto = dao.view(pseq);
			} catch (SQLException e) {
				System.out.println("> EditHandler.doGet() Exception...");
				e.printStackTrace();
			}
		    conn.close();
			
			
		    // view.jsp 포워딩
	 		request.setAttribute("dto", dto);
	 		return "/days07/board/edit.jsp";
		}else { // POST
			request.setCharacterEncoding("UTF-8");
			System.out.println("> EditHandler.doPost()...");
			
			long pseq = Long.parseLong(request.getParameter("seq"));
			
			  
		      String pwd = request.getParameter("pwd");
		      String email = request.getParameter("email");
		      String title = request.getParameter("title");
		      String content = request.getParameter("content");
		      int tag = Integer.parseInt( request.getParameter("tag") );
		      
		      Connection conn = ConnectionProvider.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);
		      int rowCount = 0;
		      BoardDTO dto = BoardDTO.builder()
		    		  			.seq(pseq)
		    		  			.pwd(pwd)
		    		  			.email(email)
		    		  			.title(title)
		    		  			.content(content)
		    		  			.tag(tag)
		    		  			.build();
		      
		      try {
		         rowCount = dao.update(dto);
		      } catch (SQLException e) { 
		         System.out.println("> EditHandler.doPost() Exception...");
		         e.printStackTrace();
		      }
		      
		      conn.close();
		      
		      // [ 리다이렉트 ]
		      String location = "/jspPro/board/view.do?seq="+pseq;
		      location += rowCount == 1 ? "&edit=success":"&edit=fail";
		      response.sendRedirect(location);
		}//if
		return null;
	}

}
