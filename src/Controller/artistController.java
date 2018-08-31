package Controller;

import java.io.IOException;


import java.io.PrintWriter;
import java.rmi.ServerException;
import java.util.HashMap;
import java.util.List;

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


import Model.art;
import Model.member;
import Service.mainService;
import Service.memberService;

@Controller
public class artistController {

	@Autowired
	memberService memberService;
	
	@Autowired
	mainService mainService; //추가
		
	//아티스트 개인 페이지 이동 (아티스트용)
	@RequestMapping("artistMyPage.do") 
	public ModelAndView artistMyPage(HttpSession session) {
		String id = (String)session.getAttribute("id"); 
		ModelAndView mav = new ModelAndView();
		if (memberService.selectOneMember(id).getIsCheck()==2) {
			List<art> list = memberService.selectArtistArt(id);
			mav.addObject("artCount", list.size());
			mav.addObject("artList", list);
			mav.addObject("name", memberService.selectOneMember(id).getName());
			mav.addObject("nickname", memberService.selectOneMember(id).getNickname());
			mav.addObject("content", memberService.selectOneMember(id).getContent());
			mav.setViewName("artistMyPage");
		}else {
			mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping("myLectureFormA.do")
    public void myLectureFormA(HttpSession session, HttpServletResponse response, @RequestParam(defaultValue="1") int pageA, 
    		@RequestParam(defaultValue="1") int pageG, @RequestParam(defaultValue="1") int pageR, @RequestParam(defaultValue="1") int pageAp) 
			throws ServerException, IOException{
    	String id = (String)session.getAttribute("id"); 
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageA", pageA);
		params.put("pageG", pageG);
		params.put("pageR", pageR);
		params.put("pageAp", pageAp);
		HashMap<String, Object> resultA = new HashMap<>();
		HashMap<String, Object> resultG = new HashMap<>();
		HashMap<String, Object> resultR = new HashMap<>();
		HashMap<String, Object> resultAp = new HashMap<>();
		resultA = memberService.selectMyAttendLec(id, pageA, params);	// 강의신청 map을 resultA 에 담기
		resultG = memberService.selectGatherLec(id, pageG, params);		// 모집 중인 강의 map을 resultG 에 담기
		resultR = memberService.selectRequestLec(id, pageR, params);	// 요청 받은 강의 map을 resultR 에 담기
		resultAp = memberService.selectApproveLec(id, pageAp, params);	// 요청 수락한 강의 map을 resultAp에 담기
		
		JSONObject jsonObj = new JSONObject();			// map을 담을 JSONObject 생성
		jsonObj.put("attendList", resultA.get("attendList"));	// 강의 신청 map을 JSONObject에 담기
		jsonObj.put("currentA", resultA.get("currentA"));
		jsonObj.put("startA", resultA.get("startA"));
		jsonObj.put("endA", resultA.get("endA"));
		jsonObj.put("lastA", resultA.get("lastA"));
		// 모집 중인 강의 map을 JSONObject에 담기
		jsonObj.put("gatherList", resultG.get("gatherList"));	
		jsonObj.put("currentG", resultG.get("currentG"));
		jsonObj.put("startG", resultG.get("startG"));
		jsonObj.put("endG", resultG.get("endG"));
		jsonObj.put("lastG", resultG.get("lastG"));
		// 요청 받은 강의 map을 JSONObject에 담기
		jsonObj.put("requestList", resultR.get("requestList"));	
		jsonObj.put("currentR", resultR.get("currentR"));
		jsonObj.put("startR", resultR.get("startR"));
		jsonObj.put("endR", resultR.get("endR"));
		jsonObj.put("lastR", resultR.get("lastR"));
		// 요청 수락한 강의 map을 JSONObject에 담기
		jsonObj.put("approveList", resultAp.get("approveList"));	
		jsonObj.put("currentAp", resultAp.get("currentAp"));
		jsonObj.put("startAp", resultAp.get("startAp"));
		jsonObj.put("endAp", resultAp.get("endAp"));
		jsonObj.put("lastAp", resultAp.get("lastAp"));
		pw.println(jsonObj); // printWriter로 뷰에 JSONObject 보내기.
    }
    
    @RequestMapping("mySellFormA.do")
    public void mySellFormA(HttpSession session, HttpServletResponse response, @RequestParam(defaultValue="1") int pageBuy, 
    		@RequestParam(defaultValue="1") int pageSell, @RequestParam(defaultValue="1") int pageSold) 
    throws ServletException, IOException{
    	String id = (String)session.getAttribute("id"); 
    	response.setCharacterEncoding("UTF-8");
    	PrintWriter pw = response.getWriter();
    	
    	HashMap<String, Object> params = new HashMap<>();
    	params.put("pageBuy", pageBuy);
    	params.put("pageSell", pageSell);
    	params.put("pageSold", pageSold);
    	HashMap<String, Object> resultBuy = new HashMap<>();
    	HashMap<String, Object> resultSell = new HashMap<>();
    	HashMap<String, Object> resultSold = new HashMap<>();
    	resultBuy = memberService.selectBuyingArt(id, pageBuy, params);
    	resultSell = memberService.selectSellingArt(id, pageSell, params);
    	resultSold = memberService.selectSoldArt(id, pageSold, params);
    	
    	JSONObject jsonObj = new JSONObject();
    	jsonObj.put("buyingList", resultBuy.get("buyingList"));	// 구매내역 map을 JSONObject에 담기
		jsonObj.put("currentBuy", resultBuy.get("currentBuy"));
		jsonObj.put("startBuy", resultBuy.get("startBuy"));
		jsonObj.put("endBuy", resultBuy.get("endBuy"));
		jsonObj.put("lastBuy", resultBuy.get("lastBuy"));
    	
    	jsonObj.put("sellingList", resultSell.get("sellingList"));	//  판매 중인 작품 map을 JSONObject에 담기
		jsonObj.put("currentSell", resultSell.get("currentSell"));
		jsonObj.put("startSell", resultSell.get("startSell"));
		jsonObj.put("endSell", resultSell.get("endSell"));
		jsonObj.put("lastSell", resultSell.get("lastSell"));
		
    	jsonObj.put("soldList", resultSold.get("soldList"));	// 판매된 map을 JSONObject에 담기
		jsonObj.put("currentSold", resultSold.get("currentSold"));
		jsonObj.put("startSold", resultSold.get("startSold"));
		jsonObj.put("endSold", resultSold.get("endSold"));
		jsonObj.put("lastSold", resultSold.get("lastSold"));
		pw.println(jsonObj); 
//		System.out.println(jsonObj);
    }
    
    @RequestMapping("updateDelivery.do") 
	public void updateDelivery() {}
	
    @RequestMapping("myOrderFormA.do") 
	public void myOrderFormA() {}
    
	//작품 등록 글 폼 요청
	@RequestMapping("writeArtForm.do") 
	public void writeArtForm() {}
	
	//작품 등록 요청
	@RequestMapping("writeArt.do") 
	public String wrtieArt(HttpServletRequest request, @RequestParam("ufile") MultipartFile ufile, HttpSession session) { 
		//입력된 데이터들을 art 객체로 받아서 테이블에 insert
		art art = new art();
		
		int isCheck = Integer.parseInt(request.getParameter("isCheck"));
		art.setIsCheck(isCheck);
		String id = (String) session.getAttribute("id");
		art.setId(id);
		art.setTitle(request.getParameter("title"));
		art.setContent(request.getParameter("content"));
		
		if(isCheck==1) {
			int state=0;
			art.setGenre(request.getParameter("genre"));
			int sellCheck = Integer.parseInt(request.getParameter("sellCheck"));
			art.setSellCheck(sellCheck);
			if(sellCheck==1) {		
				int price = Integer.parseInt(request.getParameter("price"));
				art.setPrice(price);
				art.setTotalCount(Integer.parseInt(request.getParameter("totalCount")));
				if(sellCheck==0) state=2;
				else state=1;
				art.setState(state);
			}
		}

		System.out.println(art);
		
		memberService.insertArt(art, ufile);

		//		 알림 소스 추가
		mainService.insertAlarm("writeArt", id, id);
		// 알림 소스
		return "redirect:artistMyPage.do";
	}
	
	@RequestMapping("insertFollow.do") 
	public void insertFollow() {}

	@RequestMapping("deleteFollow.do") 
	public void deleteFollow() {}
	
	@RequestMapping("followerList.do") 
	public void followerList() {}

	@RequestMapping("followingList.do") 
	public void followingList() {}

	@RequestMapping("insertLikes.do") 
	public void insertLikes() {}

	@RequestMapping("likesList.do") 
	public void likesList() {}

	@RequestMapping("deleteLikes.do") 
	public void deleteLikes() {}

	@RequestMapping("updateArtForm.do") 
	public void updateArtForm() {}
	
	@RequestMapping("updateArt.do") 
	public void updateArt() {}
	
	@RequestMapping("deleteArt.do") 
	public void deleteArt() {}
	
	@RequestMapping("searchID.do") 
	public void searchID() {}
	
	@RequestMapping("sendMessage.do") 
	public void sendMessage() {}
	
	@RequestMapping("logMessage.do") 
	public void logMessage() {}

	@RequestMapping("deleteMessage.do") 
	public void deleteMessage() {}

  //아티스트 개인 페이지 이동 (사용자용)
  		@RequestMapping("artistPage.do")
  		public ModelAndView artistPage(String id) {
  			ModelAndView mav = new ModelAndView();
  			List<art> list = memberService.selectArtistArt(id);
  			mav.addObject("artCount", list.size());
  			mav.addObject("artList", list);
  			mav.addObject("artistID", id);
  			mav.addObject("name", memberService.selectOneMember(id).getName());
  			mav.addObject("nickname", memberService.selectOneMember(id).getNickname());
  			mav.addObject("content", memberService.selectOneMember(id).getContent());
  			mav.setViewName("artistPage");
  			return mav;
  		}
  	    
  	    @RequestMapping("mySellFormA0.do")
  	    public String mySellFormA0(HttpSession session) {
  	    	String id = (String) session.getAttribute("id");
  	    	if (memberService.selectOneMember(id).getIsCheck()==2) {
  	    		return "mySellFormA";
  			}else {
  				return "myOrderFormG";
  			}
  	    	
  	    }
  	    
  	  @RequestMapping("myLectureFormA0.do")
	    public String myLectureFormA0(HttpSession session) {
		  	String id = (String) session.getAttribute("id");
	    	if (memberService.selectOneMember(id).getIsCheck()==2) {
	    		return "myLectureFormA";
			}else {
				return "myLectureFormG";
			}
	    }

//상세 페이지에서 그림 로드 기능 - 추후 사용해야함
//  		@RequestMapping("download.do")
//  		public View download(int num) {
//  			View view = new DownloadView(memberService.getAttachFile(num));
//  			return view;
//  		}
  	    
}		// public class의 끝


