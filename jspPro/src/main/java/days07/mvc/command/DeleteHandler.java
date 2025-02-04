package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler{

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
				System.out.println("> DeleteHandler.doGet() Exception...");
				e.printStackTrace();
			}
		    conn.close();
			
			
		    // view.jsp 포워딩
	 		request.setAttribute("dto", dto);
	 		return "/days07/board/delete.jsp";
		}else { // POST
			request.setCharacterEncoding("UTF-8");
			System.out.println("> DeleteHandler.doPost()...");
			
			long pseq = Long.parseLong(request.getParameter("seq"));
			String ppwd = request.getParameter("pwd");
			  
		      
		      Connection conn = ConnectionProvider.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);
		      int rowCount = 0;
		      String originalPwd;
		      String location = "/jspPro/board/";
		      
		      try {
		         originalPwd = dao.getOriginalPwd(pseq);
		         if (originalPwd.equals(ppwd)) {
					rowCount = dao.delete(pseq);
					location += "list.do";
				}else {
					//location += "delete.htm?seq="+pseq+"&delete=fail";
					// 모달창 삭제
					location += "view.do?seq="+pseq+"&delete=fail";
				}
		      } catch (SQLException e) { 
		         System.out.println("> DeleteHandler.doPost() Exception...");
		         e.printStackTrace();
		      }
		      
		      conn.close();
		      
		      // [ 리다이렉트 ]
		      response.sendRedirect(location);
		}//if
		return null;
	}

}
