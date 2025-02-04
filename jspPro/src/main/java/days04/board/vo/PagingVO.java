package days04.board.vo;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingVO {

	public int currentPage = 1;
	public int start ;
	public int end ;
	
	public boolean prev;
	public boolean next;
	
	public int numberPerPage = 10;
	
	
	public PagingVO(int currentPage, int numberPerPage, int numberOfPageBlock) {
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		try {
			int totalPages = dao.getTotalPages(numberPerPage);
			
			start = (currentPage-1)/numberOfPageBlock*numberOfPageBlock+1; 
			end = start + numberOfPageBlock -1;
			if (end > totalPages) end = totalPages;
						
			if (start != 1) this.prev = true;
			if (end != totalPages ) this.next = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public PagingVO(int currentPage, int numberPerPage, int numberOfPageBlock, String searchCondition, String searchWord) {
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
			
			try {
				int totalPages = dao.getTotalPages(numberPerPage, searchCondition, searchWord);
				
				start = (currentPage-1)/numberOfPageBlock*numberOfPageBlock+1; 
				end = start + numberOfPageBlock -1;
				if (end > totalPages) end = totalPages;
							
				if (start != 1) this.prev = true;
				if (end != totalPages ) this.next = true;
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	
	
}

