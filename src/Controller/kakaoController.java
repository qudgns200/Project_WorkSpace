package Controller;

import java.io.BufferedReader;


import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.art;
import Model.lecture;
import Model.member;
import Model.pay;
import Service.artService;
import Service.lectureService;
import Service.memberService;

@Controller
public class kakaoController {
	
	private String cid;
	private String tid;
	private String partner_order_id;
	private String partner_user_id;
	private int isCheck;
	
	private void cid(String cid) {
		this.cid = cid;
	}
	private void tid(String tid) {
		this.tid = tid;
	}
	private void partner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	private void partner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	
	private void isCheck(String isCheck) {
		this.isCheck = Integer.parseInt(isCheck);
	}
	
	@Autowired
	private memberService memberService;
	@Autowired
	private artService artService;
	@Autowired
	private lectureService lectureService;
	
	@RequestMapping("kakaoPayment.do")
	public void kakaoPayment(HttpServletResponse response, HttpServletRequest request) {
		
		String apiURL = null;
		String admin_key = "bae67e1926bf8534d3b638dbd95bbb67";
		
		cid(request.getParameter("cid"));
		partner_order_id(request.getParameter("partner_order_id"));
		partner_user_id(request.getParameter("partner_user_id"));
		isCheck(request.getParameter("isCheck"));
		
		System.out.println("isCheck = " + isCheck);
		
		try {
			apiURL = "https://kapi.kakao.com/v1/payment/ready";
			URL url = new URL(apiURL);
			
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			String header = "KakaoAK " + admin_key;
			conn.setRequestProperty("Authorization", header);

			String params = "cid=" + cid
							+ "&partner_order_id=" + partner_order_id
							+ "&partner_user_id=" + partner_user_id
							+ "&item_name=" + request.getParameter("item_name")
							+ "&quantity=" + request.getParameter("quantity")
							+ "&total_amount=" + request.getParameter("total_amount")
							+ "&vat_amount=" + request.getParameter("vat_amount")
							+ "&tax_free_amount=" + request.getParameter("tax_free_amount")
							+ "&approval_url=" + request.getParameter("approval_url")
							+ "&fail_url=" + request.getParameter("fail_url") 
							+ "&cancel_url=" + request.getParameter("cancel_url");
			
			conn.setDoOutput(true);
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(params);
			wr.flush();
			
			int responseCode = conn.getResponseCode();
			
			BufferedReader br;

			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			
			String inputLine;
			StringBuffer res = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			
			JSONParser parser = new JSONParser();
			JSONObject json = (JSONObject) parser.parse(res.toString());
			
			tid((String)json.get("tid"));
			
			response.getWriter().println(json);
			
			br.close();
			wr.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@RequestMapping("kakaoApproval.do")
	public String kakaoApproval(@RequestParam int no, HttpServletRequest request, HttpSession session) {
		String apiURL = null;
		String admin_key = "bae67e1926bf8534d3b638dbd95bbb67";
		
		try {
			apiURL = "https://kapi.kakao.com/v1/payment/approve";
			URL url = new URL(apiURL);
			
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			String header = "KakaoAK " + admin_key;
			conn.setRequestProperty("Authorization", header);

			String params = "cid=" + cid 
							+ "&tid=" + tid
							+ "&partner_order_id=" + partner_order_id
							+ "&partner_user_id=" + partner_user_id
							+ "&pg_token=" + request.getParameter("pg_token");
			
			conn.setDoOutput(true);
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(params);
			wr.flush();
			
			int responseCode = conn.getResponseCode();
			
			BufferedReader br;

			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			
			String inputLine;
			StringBuffer res = new StringBuffer();

			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			
			JSONParser parser = new JSONParser();
			JSONObject json = (JSONObject) parser.parse(res.toString());
			
			String amount = json.get("amount").toString();
			
			org.json.JSONObject jsonAmount = new org.json.JSONObject(amount);
			String total = jsonAmount.get("total").toString();
			
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd"); // String으로 넘어오기 때문에 형 변환!
			String payDateString = (String) json.get("approved_at");
			Date payDate = dateformat.parse(payDateString);
			
			pay pay = new pay();
			
			String id = (String)session.getAttribute("id");
			
			member member = new member();
			member = memberService.selectOneMember(id);	
			pay.setNo(no);
			pay.setId(id);
			pay.setIsCheck(isCheck);
			pay.setAddr(member.getAddr());
			pay.setPhone(member.getPhone());	
			pay.setName(member.getName());
			int totalPrice = Integer.parseInt(total);
			pay.setTotalPrice(totalPrice);
			pay.setPayMethod(2);
			pay.setPayDate(payDate);
			pay.setOrderNumber(partner_order_id);
			pay.setState(1);
			
			int result;
			if(isCheck == 0) {
				result = artService.insertArtPay(pay);
				if(result==1) {							// updateArt 쿼리 수정으로 인한 코드 변경 (09.11-종문)
					art originalArt = new art();
					originalArt = artService.selectOneArt(no);
					art art = new art();
					art.setSellCheck(-1);			// java에서 int형의 default값을 '0'으로 넘기는 것을 피하기 위해 '-1' 임의 세팅
					art.setPrice(-1);
					art.setIsCheck(-1);
					art.setState(-1);
					art.setTotalCount((originalArt.getTotalCount()-1));
					art.setNo(no);
					memberService.updateArt(art, null);
				}
			} else {
				result = memberService.insertLecturePay(pay);
				if(result==1) {	
					memberService.updateApproveLec(no,6);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:mySellFormA0.do";
	}
	
}
