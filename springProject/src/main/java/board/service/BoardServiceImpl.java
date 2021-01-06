package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public void boardWrite(Map<String, String> map) {
		map.put("id",(String)session.getAttribute("memId"));
		map.put("name",(String)session.getAttribute("memName"));
		map.put("email",(String)session.getAttribute("memEmail"));
		
		boardDAO.boardWrite(map);
		
	}


	@Override
	public List<BoardDTO> getBoardList(String pg) {
	
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum -4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		return boardDAO.boardList(map);
	}


	@Override
	public BoardPaging boardPaging(String pg) {
		int totalA = boardDAO.getBoardTotalA();//총글수
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	
	@Override
	public BoardPaging boardPaging(Map<String, Object> map) {
		int totalA = boardDAO.getSearchTotalA(map);//총글수
		
		boardPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	//검색한 글 리스트 갖고오기
	@Override
	public List<BoardDTO> getBoardSearch(Map<String, Object> map) {
		int endNum = Integer.parseInt((String) map.get("pg"))*5;
		int startNum = endNum -4;
		
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		return boardDAO.getBoardSearch(map);
	}

	//클릭한 글 가져오기
	@Override
	public BoardDTO getBoard(String seq) {
		
		return boardDAO.getBoard(seq);
	}

	//답글쓰기
	@Override
	public void boardReply(Map<String, Object> map) {
		//원글  
		BoardDTO pDTO = boardDAO.getBoard(map.get("pseq")+"");
		
		map.put("id",(String)session.getAttribute("memId"));
		map.put("name",(String)session.getAttribute("memName"));
		map.put("email",(String)session.getAttribute("memEmail"));
		
		map.put("ref", pDTO.getRef()+""); //원글의 그룹번호
		map.put("lev", pDTO.getLev()+""); //원글의 lev
		map.put("step", pDTO.getStep()+""); //원글의 step
		
		
		
		boardDAO.boardReply(map);
	}


	@Override
	public void boardModify(Map<String, Object> map) {
		boardDAO.boardModify(map);
		
	}


	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);
		
	}


	@Override
	public void updateHit(String seq) {
		boardDAO.updateHit(seq);
		
	}



}
