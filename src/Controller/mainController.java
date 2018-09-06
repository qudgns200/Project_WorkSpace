package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import Model.member;
import Model.message;
import Service.mainService;
import Service.memberService;


@Controller
public class mainController {
	
	@Autowired
	private memberService memberService;
	
	@Autowired
	private mainService mainService; //추가
	
	// 메인 페이지 이동
		@RequestMapping("main.do") 
		public void main() {}
		
		@RequestMapping("loginForm.do")
		public void loginForm() {}
		
		@RequestMapping("joinForm.do")
		public void joinForm() {}
		
		@RequestMapping("join.do")
		public String join(member member, @RequestParam("pwCheck") String pwCheck, 
				@RequestParam(value="uProfile", required=false) MultipartFile uProfile, 
				@RequestParam(value="uFile", required=false) MultipartFile uFile,
				@RequestParam(value="datepicker1", required=false) String datepicker1,
				@RequestParam(value="datepicker2", required=false) String datepicker2) throws ParseException {
			Date birth = null;
			if(datepicker1 != null) {
				birth = new SimpleDateFormat("yyyyMMdd").parse(datepicker1);
			} else if(datepicker2 != null) {
				birth = new SimpleDateFormat("yyyyMMdd").parse(datepicker2);
			}
			member.setBirth(birth);
			
			if(memberService.insertMember(member, uProfile, uFile) == 1) {
				return "redirect:main.do";
			} else {
				return "redirect:joinForm.do";
			}
		}
		
		@RequestMapping("login.do")
		public String login(HttpSession session, String id, String pw) {
			if(memberService.login(id, pw) == 1) {
				session.setAttribute("id", id);
			
				return "redirect:main.do";
			} else {
				return "redirect:loginForm.do";
			}
		}
		
		@RequestMapping("adminForm.do")
		public void adminForm() {}
		
		@RequestMapping("searchMember.do")
		public void searchMember(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int page = Integer.parseInt(req.getParameter("page"));
			String searchType = req.getParameter("searchType");
			String keyword = req.getParameter("keyword");
			String isCheck = req.getParameter("isCheck");
	
			JSONObject jsonObject = new JSONObject();
			HashMap<String, Object> params = new HashMap<>();
			
			if(searchType.equals("id")) {
				params.put("searchType", searchType);
				params.put("id", keyword);
			} else if(searchType.equals("name")) {
				params.put("searchType", searchType);
				params.put("name", keyword);
			} else if(searchType.equals("nickname")) {
				params.put("searchType", searchType);
				params.put("nickname", keyword);
			}
			
			if(isCheck != null) {
				params.put("isCheck", isCheck);
			}
	
			HashMap<String, Object> memberList = memberService.selectAllMember(params, page);
		
			jsonObject.put("member", memberList);
			jsonObject.put("search", params);
			
			resp.setContentType("text/html; charset=UTF-8"); 
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("selectAllMember.do")
		public void selectAllMember(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int page = Integer.parseInt(req.getParameter("page"));
	
			JSONObject jsonObject = new JSONObject();
			HashMap<String, Object> params = new HashMap<>();
			
			HashMap<String, Object> memberList = memberService.selectAllMember(params, page);
		
			jsonObject.put("member", memberList);
			
			resp.setContentType("text/html; charset=UTF-8"); 
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("blackList.do")
		public void blackList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			String id = req.getParameter("id");
			JSONObject jsonObject = new JSONObject();
			boolean result;
			
			if(memberService.blackList(id) == 1) {
				result = true;
			} else {
				result = false;
			}
			
			jsonObject.put("result", result);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("searchApproveArtist.do")
		public void searchApproveArtist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int page = Integer.parseInt(req.getParameter("page"));
			String searchType = req.getParameter("searchType");
			String keyword = req.getParameter("keyword");
	
			JSONObject jsonObject = new JSONObject();
			HashMap<String, Object> params = new HashMap<>();
			
			if(searchType.equals("id")) {
				params.put("searchType", searchType);
				params.put("id", keyword);
			} else if(searchType.equals("name")) {
				params.put("searchType", searchType);
				params.put("name", keyword);
			} else if(searchType.equals("nickname")) {
				params.put("searchType", searchType);
				params.put("nickname", keyword);
			}
	
			HashMap<String, Object> memberList = memberService.searchApproveArtist(params, page);
		
			jsonObject.put("member", memberList);
			jsonObject.put("search", params);
			
			resp.setContentType("text/html; charset=UTF-8"); 
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("selectAllArtist.do") // 추가
		public void selectAllArtist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int page = Integer.parseInt(req.getParameter("page"));
	
			JSONObject jsonObject = new JSONObject();
			HashMap<String, Object> params = new HashMap<>();
			
			HashMap<String, Object> memberList = memberService.searchApproveArtist(params, page);
		
			jsonObject.put("member", memberList);
			
			resp.setContentType("text/html; charset=UTF-8"); 
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("approveView.do")
		public ModelAndView approveView(String id, int index) {
			ModelAndView mav = new ModelAndView();
			member member = memberService.selectOneMember(id);
			
			mav.addObject("member", member);
			mav.addObject("index", index);
			mav.setViewName("approveView");
			
			return mav;
		}
		
		@RequestMapping("updateApproveArtist.do")
		public void updateApproveArtist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			String id = req.getParameter("id");
			JSONObject jsonObject = new JSONObject();
			boolean result;
			
			if(memberService.updateApproveArtist(id) == 1) {
				result = true;
			} else {
				result = false;
			}
			
			jsonObject.put("result", result);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("updateRefuseArtist.do")
		public void updateRefuseArtist() {}
		
		@RequestMapping("updateMemberForm.do")
		public void updateMemberForm() {}
		
		@RequestMapping("updateMember.do")
		public void updateMember() {}
		
		@RequestMapping("myLectureFormG.do")
		public void myLectureFormG(HttpSession session, HttpServletResponse response, @RequestParam(defaultValue="1") int pageA, @RequestParam(defaultValue="1") int pageG) 
				throws ServerException, IOException{
			String id = (String)session.getAttribute("id"); 
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();

			HashMap<String, Object> params = new HashMap<>();
			params.put("pageA", pageA);
			params.put("pageG", pageG);
			HashMap<String, Object> resultA = new HashMap<>();
			HashMap<String, Object> resultG = new HashMap<>();
			resultA = memberService.selectMyAttendLec(id, pageA, params);	// 강의신청 map을 resultA HashMap에 담기
			resultG = memberService.selectGatherLec(id, pageG, params); // 모집 중인 강의 map을 resultG HashMap에 담기
			
			JSONObject jsonObj = new JSONObject();					// map을 담을 JSONObject 생성
			jsonObj.put("attendList", resultA.get("attendList"));	// 강의 신청 map JSONObject에 담기
			jsonObj.put("currentA", resultA.get("currentA"));
			jsonObj.put("startA", resultA.get("startA"));
			jsonObj.put("endA", resultA.get("endA"));
			jsonObj.put("lastA", resultA.get("lastA"));
			
			jsonObj.put("gatherList", resultG.get("gatherList"));	// 모집 중인 강의 map JSONObject에 담기	
			jsonObj.put("currentG", resultG.get("currentG"));
			jsonObj.put("startG", resultG.get("startG"));
			jsonObj.put("endG", resultG.get("endG"));
			jsonObj.put("lastG", resultG.get("lastG"));
			pw.println(jsonObj); // printWriter로 뷰에 JSONObject 보내기.
		}
		
		@RequestMapping("myOrderFormG.do")
		public void myOrderFormG(HttpSession session, HttpServletResponse response, @RequestParam(defaultValue="1") int pageBuy) throws ServletException, IOException {
			String id = (String)session.getAttribute("id"); 
			response.setCharacterEncoding("UTF-8");
	    	PrintWriter pw = response.getWriter();
	    	HashMap<String, Object> params = new HashMap<>();
	    	params.put("pageBuy", pageBuy);
	    	HashMap<String, Object> resultBuy = new HashMap<>();
	    	resultBuy = memberService.selectBuyingArt(id, pageBuy, params);
	    	
	    	JSONObject jsonObj = new JSONObject();
	    	jsonObj.put("buyingList", resultBuy.get("buyingList"));	// 구매내역 map을 JSONObject에 담기
			jsonObj.put("currentBuy", resultBuy.get("currentBuy"));
			jsonObj.put("startBuy", resultBuy.get("startBuy"));
			jsonObj.put("endBuy", resultBuy.get("endBuy"));
			jsonObj.put("lastBuy", resultBuy.get("lastBuy"));
			pw.println(jsonObj);
		}	
		
		@RequestMapping("feed.do")
		public void feed() {}
		
		@RequestMapping("myPage.do")
		public String myPage(HttpSession session) {				// 권한에 따라 이동할 페이지 다름  ★ 코드 추가해야함
			String id = (String) session.getAttribute("id");
			member member = memberService.selectOneMember(id);
			
			if (member.getIsCheck() == 1) {
				return "redirect:adminForm.do";
			} else if (member.getIsCheck() == 2) {
				return "redirect:artistMyPage.do";	// 권한이 아티스트(Artist)인 경우
			} else {
				return "myLectureFormG";	// 권한이 사용자(Guest)인 경우
			}
		}
		
		@RequestMapping("updateAlarm.do")
		public void updateAlarm(int no, HttpServletResponse response)throws IOException, ServletException {
			mainService.updateAlarm(no);
			PrintWriter pw = response.getWriter();
			pw.println("ok");
		}
		
		@RequestMapping("deleteAlarm.do")
		public void deleteAlarm() {}
		
		@RequestMapping("selectAlarm.do")
		public void selectAlarm(HttpSession session, HttpServletResponse response)throws ServletException, IOException {
			response.setCharacterEncoding("UTF-8");
	    	PrintWriter pw = response.getWriter();
	    	String id = (String)session.getAttribute("id"); 
	    	JSONObject jsonObj = new JSONObject();
	    	jsonObj.put("alarmList", mainService.selectAlarm(id));
			pw.println(jsonObj);
		}
		
		@RequestMapping("check.do")
		public void check(HttpServletRequest req, HttpServletResponse resp) throws ParseException, IOException {
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String pwd = req.getParameter("pwd"); // 비밀번호 확인
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			if(req.getParameter("guestAddr") != null) {
				String addr = req.getParameter("guestAddr");
			} else if(req.getParameter("artistAddr") != null) {
				String addr = req.getParameter("artistAddr");
			}
			String email = req.getParameter("email");
			String nickname = req.getParameter("nickname");
//			Date birth = new SimpleDateFormat("yy-mm-dd").parse(req.getParameter("birth"));
			String content = req.getParameter("content");
			boolean idCheck, pwCheck, nameCheck, phoneCheck, addrCheck, emailCheck, nicknameCheck, contentCheck;
			JSONObject jsonObject = new JSONObject();
		
			
			if (memberService.selectOneMember(id) == null && id != "") {
				idCheck = true;
			} else {
				idCheck = false;
			}
			if (pw != "" && pw == pwd) {
				pwCheck = true;
			} else {
				pwCheck = false;
			}
			if (memberService.selectOneNickname(nickname) == null && nickname != "") {
				nicknameCheck = true;
			} else {
				nicknameCheck = false;
			}
			
			jsonObject.put("idCheck", idCheck);
			jsonObject.put("pwCheck", pwCheck);
			jsonObject.put("nicknameCheck", nicknameCheck);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter pwr = resp.getWriter();
			pwr.println(jsonObject);
		}
		
		@RequestMapping("logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:main.do";
		}
		
	// 주문내역 조회 페이지로 이동
	@RequestMapping("myOrderFormG0.do") 
	public String myOrderFormG0() {
		return "myOrderFormG";
	}
	// 강의내역 조회 페이지로 이동
	@RequestMapping("myLectureFormG0.do") 
	public String myLectureFormG0() {
		return "myLectureFormG";
	}
	
	@RequestMapping("download.do") // 추가
	public View download(@RequestParam(required=false) String id, @RequestParam(required=false) Integer no, 
			@RequestParam(required=false) String profile, @RequestParam(required=false) String lecture) {
		View view;
		HashMap<String, Object> params = new HashMap<>();
		if (id!=null) {
			params.put("id", id);
			if (profile!=null) {
				params.put("profile", profile);
			}
		}else {
			params.put("no", no);
			if (lecture!=null) {
			params.put("lecture", lecture);
			}
		}
		view = new DownloadView(memberService.getAttachFile(params));
		return view;
	}
	
	// 알림 페이지로 이동
	@RequestMapping("alarmPage.do")
	public void alarmPage() {
			
			
			
			
			
	}
	// 알림 개수 조회
	@RequestMapping("alarmCount.do")
	public void alarmCount(HttpSession session, HttpServletResponse response)throws IOException, ServletException {
			if (session.getAttribute("id")!=null) {
				String id = (String)session.getAttribute("id");
				response.setCharacterEncoding("UTF-8");
				PrintWriter pw = response.getWriter();
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("alarmCount", mainService.getAlarmCount(id));
				pw.println(jsonObj);
			}
	}
	
	@RequestMapping("sendMessage.do")
	public void sendMessage(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		String isTo = (String) session.getAttribute("id");
		String isFrom = req.getParameter("isFrom");
		String content = req.getParameter("content");
		JSONObject jsonObject = new JSONObject();
		boolean result;
		
		message message = new message();
		message.setIsTo(isTo);
		message.setIsFrom(isFrom);
		message.setContent(content);
		
		if(mainService.sendMessage(message) == 1) {
			result = true;
		} else {
			result = false;
		}
		
		jsonObject.put("result", result);
		jsonObject.put("logMessage", mainService.logMessage(message));
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.println(jsonObject);
	}
	
//	@RequestMapping("messageList.do")
//	public void messageList(HttpSession session, HttpServletResponse resp) throws IOException {
//		String id = (String) session.getAttribute("id");
//		JSONObject jsonObject = new JSONObject();
//		
//		jsonObject.put("messageList", mainService.messageList(id));
//		
//		resp.setContentType("text/html; charset=UTF-8");
//		PrintWriter pw = resp.getWriter();
//		pw.println(jsonObject);
//		System.out.println(jsonObject);
//	}
	
	@RequestMapping("messageList.do")
	public ModelAndView messageList(HttpSession session) {
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("messageList", mainService.messageList(id));
		mav.setViewName("messageList");
		
		return mav;
	}
	
	@RequestMapping("logMessage.do")
	public ModelAndView logMessage(HttpSession session, String isFrom) {
		String isTo = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		message message = new message();
		
		message.setIsTo(isTo);
		message.setIsFrom(isFrom);
		
		mav.addObject("isFrom", isFrom);
		mav.addObject("logMessage", mainService.logMessage(message));
		mav.setViewName("logMessage");
		
		return mav;
	}
	
	@RequestMapping("deleteMessage.do")
	public void deleteMessage(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		String isTo = (String) session.getAttribute("id");
		String isFrom = req.getParameter("isFrom");
		JSONObject jsonObject = new JSONObject();
		boolean result;
		
		message message = new message();
		message.setIsTo(isTo);
		message.setIsFrom(isFrom);
		
		if(mainService.deleteMessage(message) == 0) {
			result = false;
		} else {
			result = true;
		}
		
		jsonObject.put("result", result);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.println(jsonObject);
	}
	
} // public class의 끝.

//	@RequestMapping("isCheckMember.do")
//	public ModelAndView isCheckMember(HttpServletRequest request, HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		String id = (String) session.getAttribute("id");
//		String requestURI = request.getRequestURI();
//		mav.addObject("isCheck", memberService.selectOneMember(id).getIsCheck());
//		mav.setViewName(requestURI);
//		return mav;
//	}
