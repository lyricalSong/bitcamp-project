package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value="board")
public class boardController {
	@Autowired
	private BoardService boardService; 
	
	//boardWriteForm.jsp으로 감
	@RequestMapping(value="boardWriteForm",method=RequestMethod.GET)
	public String boardWriteForm(Model model) {
			
		model.addAttribute("display", "/board/boardWriteForm.jsp");
		return "/main/index";
	}
	
	//boardWrite.jsp으로 감
	@RequestMapping(value="boardWrite",method=RequestMethod.POST)
	public String boardWrite(@RequestParam Map<String,String> map//subject,content들어옴
								, Model model) {
			boardService.boardWrite(map);
			
			model.addAttribute("display", "/board/boardWrite.jsp");
			return "/main/index";
			
	 }
	//글쓰기 목록
	@RequestMapping(value="boardList",method=RequestMethod.GET)
	public String boardList(@RequestParam(required = false,defaultValue = "1") String pg, Model model) {
		
		model.addAttribute("pg",pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/main/index";
	}

	// 리스트&페이지처리
	@RequestMapping(value = "getBoardList", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getBoardList(@RequestParam String pg,HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String memId = (String) session.getAttribute("memId");
		
		//쿠키
		if(memId != null) {
			Cookie cookie = new Cookie("memHit", "ok");
			cookie.setMaxAge(30*60);
			cookie.setPath("/");
			response.addCookie(cookie);//클라이언트에게 보내기
		}

		List<BoardDTO> list = boardService.getBoardList(pg);

		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg);

		mav.addObject("memId", memId);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");

		return mav;
	}

	// 검색리스트
	@RequestMapping(value = "getBoardSearch", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getBoardSearch(@RequestParam Map<String, Object> map) {

		List<BoardDTO> list = boardService.getBoardSearch(map);
		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", map.get("pg"));
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");

		return mav;
	}

	// 글 클릭했을 때 view로
	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(@RequestParam String seq, @RequestParam String pg, Model model) {

		model.addAttribute("pg", pg);
		model.addAttribute("seq", seq);
		model.addAttribute("display", "/board/boardView.jsp");
		return "/main/index";
	}

	// 해당 글 뿌려주기
	@RequestMapping(value = "getBoardView", method = RequestMethod.POST)
	public @ResponseBody ModelAndView getBoardView(@RequestParam String seq,@CookieValue(value="memHit", required = false) Cookie cookie,HttpServletResponse response, HttpSession session) {
		
		
		String memId = (String) session.getAttribute("memId");
		
		//쿠키 
		System.out.println(cookie);
		if(cookie != null) {
			boardService.updateHit(seq); //조회수 증가
			
			//쿠키삭제
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
	
		BoardDTO boardDTO = boardService.getBoard(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memId", memId);
		mav.addObject("boardDTO", boardDTO);
		mav.setViewName("jsonView");

		return mav;
	}

	// 답글 폼
	@RequestMapping(value = "boardReplyForm", method = RequestMethod.POST)
	public String boardReplyForm(@RequestParam String seq, @RequestParam String pg, Model model) {

		model.addAttribute("pseq", seq);// 원글번호
		model.addAttribute("pg", pg);// 원글 페이지번호
		model.addAttribute("display", "/board/boardReplyForm.jsp");
		return "/main/index";
	}

	// 답글
	@RequestMapping(value = "boardReply", method = RequestMethod.POST)
	public String boardReply(@RequestParam Map<String, Object> map, Model model) {
		boardService.boardReply(map);// pseq,pg,subject,content

		model.addAttribute("display", "/board/boardReply.jsp");
		return "/main/index";
	}

	// 수정폼
	@RequestMapping(value = "boardModifyForm", method = RequestMethod.POST)
	public String boardModifyForm(@RequestParam String seq, @RequestParam String pg, Model model) {

		model.addAttribute("seq", seq);// 원글번호
		model.addAttribute("pg", pg);// 원글 페이지번호
		model.addAttribute("display", "/board/boardModifyForm.jsp");
		return "/main/index";
	}
	//수정
	@RequestMapping(value = "boardModify", method = RequestMethod.POST)
	@ResponseBody
	public void boardModify(@RequestParam Map<String,Object> map, Model model) {
		boardService.boardModify(map);
		
	}
	
	//삭제폼
	@RequestMapping(value = "boardDelete", method = RequestMethod.POST)
	public String boardDelete(@RequestParam String seq, Model model) {
		boardService.boardDelete(seq);
		
		model.addAttribute("display", "/board/boardDelete.jsp");
		return "/main/index";
	}
	
	
}
