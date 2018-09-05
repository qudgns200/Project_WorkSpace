package Controller;

import java.io.IOException;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Model.art;
import Model.board;
import Model.lecture;
import Model.member;
import Model.pay;
import Model.qna;
import Service.artService;
import Service.artistService;
import Service.boardService;
import Service.lectureService;
import Service.memberService;
import net.sf.json.JSONArray;
import Model.artComment;

@Controller
public class boardController {

	@Autowired
	private lectureService lectureService;

	@Autowired
	private boardService boardService;

	@Autowired
	private artService artService;

	@Autowired
	private artistService artistService;

	@Autowired
	private memberService memberService;

	@RequestMapping("artistForm.do")
	public ModelAndView artistForm() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = artistService.selectTopArtist();
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 1);
		mav.setViewName("artistForm");
		return mav;
	}

	@RequestMapping("searchArtist.do")
	public ModelAndView searchArtist(@RequestParam(defaultValue = "0") int type,
			@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String searchWord) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<>();
		params.put("page", page);
		params.put("type", type);
		params.put("searchWord", searchWord);
		if (type == 1) {
			params.put("nickname", searchWord);
		}
		if (type == 2) {
			params.put("name", searchWord);
		}
		if (type == 3) {
			params.put("id", searchWord);
		}
		HashMap<String, Object> result = new HashMap<>();
		result = artistService.searchArtist(params, page);
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.addObject("viewChoice", 2);
		mav.setViewName("artistForm");
		return mav;
	}

	@RequestMapping("genreArtist.do")
	public ModelAndView genreArtist(@RequestParam(defaultValue = "1") int page, String genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = artistService.selectRecentArtist(genre, page);
		mav.addAllObjects(result);
		mav.addObject("genre", genre);
		mav.addObject("viewChoice", 3);
		mav.setViewName("artistForm");
		return mav;
	}

	@RequestMapping("artForm.do")
	public ModelAndView artForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("originalList", artService.selectTopArt("original"));
		mav.addObject("paintingList", artService.selectTopArt("painting"));
		mav.addObject("sculptureList", artService.selectTopArt("sculpture"));
		mav.addObject("viewChoice", 1);
		mav.setViewName("artForm");
		return mav;
	}

	@RequestMapping("searchArt.do")
	public ModelAndView searchArt(@RequestParam(defaultValue = "0") int type,
			@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<>();
		params.put("page", page);
		params.put("type", type);
		params.put("searchWord", searchWord);
		params.put("genre", genre);
		if (type == 1) {
			params.put("title", searchWord);
		}
		if (type == 2) {
			params.put("nickname", searchWord);
		}
		if (type == 3) {
			params.put("content", searchWord);
		}
		if (type == 4) {
			params.put("title", searchWord);
			params.put("content", searchWord);
		}
		HashMap<String, Object> result = new HashMap<>();
		result = artService.searchArt(params, page);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 2);
		mav.setViewName("artForm");
		return mav;
	}

	@RequestMapping("genreArt.do")
	public ModelAndView genreArt(@RequestParam(defaultValue = "1") int page, int genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		String genreStr = null;
		if (genre == 1) {
			genreStr = "original";
		}
		if (genre == 2) {
			genreStr = "painting";
		}
		if (genre == 3) {
			genreStr = "sculpture";
		}
		result = artService.selectRecentArt(genreStr, page);
		mav.addAllObjects(result);
		mav.addObject("genre", genreStr);
		mav.addObject("genreInt", genre);
		mav.addObject("viewChoice", 3);
		mav.setViewName("artForm");
		return mav;
	}

	@RequestMapping("selectOneArt.do") // 작품 상세페이지로 이동
	public String selectOneArt(@RequestParam int no, Model model) {
		// 해당 작품 정보와 댓글 정보를 담고 상세 페이지로 이동함
		// art 객체 : 상세 정보
		// comment 객체 : 해당 작품에 달린 댓글들

		art art = new art();
		art = artService.selectOneArt(no);
		model.addAttribute(art);

		return "artDetail";
	}

	@RequestMapping("artComment.do") //댓글 입력
	public void artComment(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		int childNode = Integer.parseInt(request.getParameter("childNode"));
		int groupNo = Integer.parseInt(request.getParameter("groupNo"));
		
		if(groupNo==0) {
			groupNo = artService.getMaxGroupNo(no)+1;
		} else {
			groupNo = Integer.parseInt(request.getParameter("groupNo"));
		}
		String id = (String)session.getAttribute("id");
		
		artComment artComment = new artComment();
		artComment artComment1 = new artComment();
		
		artComment.setNo(no);
		artComment.setId(id);
		artComment.setContent(request.getParameter("content"));
		artComment.setGroupNo(groupNo);
		artComment.setChildNode(childNode);
		
		artService.insertArtComment(artComment);
		
		artComment1 = artService.selectArtLatestcomment();

		JSONArray jsonArray = JSONArray.fromObject(artComment1);
		
		response.getWriter().print(jsonArray);
		
	}	

	@RequestMapping("artPayForm.do") // 결제 폼 요청
	public String artPayForm(HttpServletRequest request, Model model) throws ParseException {

		// String id = (String)request.getSession().getAttribute("id"); //세션에서 id 가져오기
		String id = "test";

		// art 자료 객체 생성하여 value 대입
		// String 으로 넘어온 값들 모델 클래스 자료형에 맞게 형변환!
		art art = new art();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		int no = Integer.parseInt(request.getParameter("no"));
		art.setNo(no);
		art.setContent(request.getParameter("conetent"));
		Date date1 = dateformat.parse((request.getParameter("artDate")));
		art.setArtDate(date1);
		int price = Integer.parseInt(request.getParameter("price"));
		art.setPrice(price);
		art.setId("id");
		art.setGenre("genre");

		// member 객체 생성하여 주문자 정보 가져오기
		member member = new member();
		member = memberService.selectOneMember(id);

		// 주문 번호 생성
		// 고유한 값이 필요하기에 생성
		// 주문품목명 + 구매자 id + 구입한 시간
		String orderNumber = request.getParameter("no") + "_" + id + "_" + new Date().getTime();

		// 각 정보들 모델에 담아서 결제 폼으로 이동!
		model.addAttribute(member);
		model.addAttribute(art);
		model.addAttribute("orderNumber", orderNumber);
		model.addAttribute("payMethod", request.getParameter("payMethod"));

		return "artPayForm";
	}

	@RequestMapping("artPay.do") // 결제 액션 실행
	public void artPay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 카드 결제 시 수행되는 메소드
		// 결제 성공 시에 해당 정보를 받아 pay 테이블에 삽입하기 위함

		pay pay = new pay();
		int no = Integer.parseInt(request.getParameter("no"));
		pay.setNo(no);
		pay.setId(request.getParameter("customer_uid"));
		// int isCheck = Integer.parseInt(request.getParameter("isCheck"));
		// pay.setIsCheck(isCheck);
		pay.setIsCheck(0);
		pay.setAddr(request.getParameter("buyer_addr"));
		pay.setPhone(request.getParameter("buyer_tel"));
		pay.setName(request.getParameter("buyer_name"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		pay.setTotalPrice(amount);
		pay.setPayMethod(1);
		pay.setState(1);
		pay.setOrderNumber(request.getParameter("merchant_uid"));

		int result = artService.insertArtPay(pay);

		// DB입력 성공/실패 여부 확인 후 JSON으로 바꿔주고
		// 다시 페이지로 전달
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		response.getWriter().println(jsonObj);
	}

	@RequestMapping("lectureForm.do") // lecture 게시판으로 이동
	public ModelAndView lectureForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("recentLectureA", lectureService.selectRecentLectureA());
		mav.addObject("recentLectureG", lectureService.selectRecentLectureG());
		mav.addObject("viewChoice", 1);
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("allLectureA.do")
	public ModelAndView allLectureA(@RequestParam(defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = lectureService.selectAllLectureA(page);
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 3);
		mav.addObject("who", "A");
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("allLectureG.do")
	public ModelAndView allLectureG(@RequestParam(defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = lectureService.selectAllLectureG(page);
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 3);
		mav.addObject("who", "G");
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("searchLecture.do")
	public ModelAndView searchLecture(@RequestParam(defaultValue = "0") int type,
			@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String searchWord,
			@RequestParam(required = false) String genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<>();
		params.put("page", page);
		params.put("type", type);
		params.put("searchWord", searchWord);
		params.put("genre", genre);
		if (type == 1) {
			params.put("title", searchWord);
		}
		if (type == 2) {
			params.put("nickname", searchWord);
		}
		if (type == 3) {
			params.put("content", searchWord);
		}
		if (type == 4) {
			params.put("title", searchWord);
			params.put("content", searchWord);
		}
		HashMap<String, Object> result = new HashMap<>();
		result = lectureService.searchLecture(params, page);
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.addObject("viewChoice", 2);
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("addLectureForm.do") // 강의 등록 폼 요청
	public void addLectureForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		member member = new member();
		member = memberService.selectOneMember(id);

		List<member> artistList = new ArrayList<member>();

		artistList = memberService.searchMember(null, null, 2);

		if (member.getIsCheck() == 3)
			model.addAttribute("artistList", artistList);

		model.addAttribute("isCheck", member.getIsCheck());
	}

	@RequestMapping("addLecture.do") // lecture 테이블에 insert 요청
	public String addLecture(HttpServletRequest request, @RequestParam MultipartFile ufile, HttpSession session) {

		String id = (String) session.getAttribute("id");
		lecture lecture = new lecture();
		if (request.getParameter("artistID") == null)
			lecture.setState(1);
		else {
			lecture.setState(3);
			lecture.setArtistID(request.getParameter("artistID"));
		}
		lecture.setGuestID(id);
		lecture.setNumberPeople(0);
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd"); // String으로 넘어오기 때문에 형 변환!
		lecture.setTitle(request.getParameter("title"));
		lecture.setPlace(request.getParameter("place"));
		lecture.setGenre(request.getParameter("genre"));
		try {
			// String으로 넘어오기 때문에 형 변환!
			Date date1;
			date1 = dateformat.parse((request.getParameter("startDate")));
			lecture.setStartDate(date1);
			Date date2 = dateformat.parse((request.getParameter("endDate"))); // String으로 넘어오기 때문에 형 변환!
			lecture.setEndDate(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int num = Integer.parseInt(request.getParameter("maxPeople")); // String으로 넘어오기 때문에 형 변환!
		lecture.setMaxPeople(num);
		lecture.setContent(request.getParameter("content"));
		lectureService.insertLecture(lecture, ufile);
		return "redirect:myLectureFormA.do";
	}

	@RequestMapping("selectOneLecture.do") // 강의 상세페이지로 이동
	public String selectOneLecture(@RequestParam int no, Model model) {
		lecture lecture = lectureService.selectOneLecture(no);
		model.addAttribute(lecture);
		return "lectureDetail";
	}

	@RequestMapping("lectureComment.do")
	public void lectureComment() {
	}

	@RequestMapping("lectureReComment.do")
	public void lectureReComment() {
	}

	@RequestMapping("updateLectureForm.do")
	public void updateLectureForm() {
	}

	@RequestMapping("updateLecture.do")
	public void updateLecture() {
	}

	@RequestMapping("deleteLecture.do")
	public void deleteLecture() {
	}

	@RequestMapping("lectureAttendForm.do")
	public void lectureAttendForm() {
	}

	@RequestMapping("lectureAttend.do")
	public void lectureAttend() {
	}

	@RequestMapping("boardForm.do") // 자유게시판 이동
	public void boardForm(Model model) {
		List<board> boardList = new ArrayList<board>();
		boardList = boardService.selectBoard();

		model.addAttribute("boardList", boardList);
	}

	@RequestMapping("searchBoard.do")
	public void searchBoard() {
	}

	@RequestMapping("writeBoardForm.do") // 자유게시판 글쓰기 이동
	public void writeBoardForm() {
	}

	@RequestMapping("writeBoard.do")
	public String writeBoard(HttpServletRequest request) {
		// 입력된 데이터들을 art 객체로 받아서 테이블에 insert
		// 아이디 체크 후 함수 호출
		// 관리자 : boardService.selectNotice
		// 게스트 : boardService.selectBoard

		board board = new board();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setId(request.getParameter("id"));
		boardService.insertBoard(board);
		return "redirect:artistMyPage.do";
	}

	@RequestMapping("selectOneBoard.do") //자유게시글 상세페이지
	public void selectOneBoard(@RequestParam int no, Model model) {
		board board = new board();
		board = boardService.selectOneBoard(no);
		model.addAttribute("board", board);
	}

	@RequestMapping("updateBoardForm.do")
	public void updateBoardForm() {
	}

	@RequestMapping("updateBoard.do")
	public void updateBoard() {
	}

	@RequestMapping("deleteBoard.do")
	public void deleteBoard() {
	}

	@RequestMapping("boardComment.do")
	public void boardComment() {
	}

	@RequestMapping("boardReComment.do")
	public void boardReComment() {
	}

	@RequestMapping("qnaForm.do") // QnA게시판 이동
	public void qnaForm(Model model) {
		List<qna> qnaList = new ArrayList<qna>();
		qnaList = boardService.selectQna();
		model.addAttribute("qnaList", qnaList);
	}

	@RequestMapping("selectOneQna.do") //qna 상세페이지 이동
	public void selectOneQna(@RequestParam int no, Model model) {
		qna qna = new qna();
		qna = boardService.selectOneQna(no);
		model.addAttribute("qna", qna);
	}

	@RequestMapping("searchQna.do")
	public void searchQna() {
	}

	@RequestMapping("writeQnaForm.do") // QnA게시판 글쓰기 이동
	public void writeQnaForm() {
	}

	@RequestMapping("writeQna.do")
	public String writeQna(HttpServletRequest request) {
		qna qna = new qna();

		qna.setTitle(request.getParameter("title"));
		qna.setId(request.getParameter("id"));
		qna.setContent(request.getParameter("content"));
		qna.setPw(request.getParameter("pw"));
		boardService.insertQna(qna);
		return "redirect:artistMyPage.do";
	}

	@RequestMapping("updateQnaForm.do")
	public void updateQnaForm() {
	}

	@RequestMapping("updateQna.do")
	public void updateQna() {
	}

	@RequestMapping("deleteQna.do")
	public void deleteQna() {
	}

	@RequestMapping("qnaComment.do")
	public void qnaComment() {
	}

	@RequestMapping("qnaReComment.do")
	public void qnaReComment() {
	}

	// 추가 매핑///////////////////////////////////////////////////////////
	@RequestMapping("selectArtComment.do")
	public void selectArtComment(HttpServletRequest request, HttpServletResponse response, Model model)
			throws IOException {
		response.setCharacterEncoding("UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));
		int skip = Integer.parseInt(request.getParameter("skip"));
		int startComment = Integer.parseInt(request.getParameter("startComment"));

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("no", no);
		params.put("skip", skip + 1);
		params.put("startComment", startComment);

		List array = new ArrayList<artComment>();
		array = artService.selectArtComment(params);

		JSONArray jsonArray = JSONArray.fromObject(array);
		response.getWriter().println(jsonArray);
	}

	@RequestMapping("deleteComment.do")
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));

		artComment artComment = new artComment();
		artComment.setNo(no);
		artComment.setContent("삭제된 댓글입니다.");
		artComment.setCommentNo(commentNo);

		artService.deleteComment(artComment);

		response.getWriter().println("success");
	}

	@RequestMapping("modifyComment.do")
	public void modifyComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));

		artComment artComment = new artComment();
		artComment.setNo(no);
		artComment.setContent(request.getParameter("content"));
		artComment.setCommentNo(commentNo);

		artService.updateComment(artComment);

		response.getWriter().println("success");
	}
}// public class의 끝.
