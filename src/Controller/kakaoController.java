package Controller;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Model.member;
import Model.pay;
import Service.memberService;

@Controller
public class kakaoController {
	
	private String cid;
	private String tid;
	private String partner_order_id;
	private String partner_user_id;
	
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
	
	@Autowired
	private memberService memberService;
	
	@RequestMapping("kakaoPayment.do")
	public void kakaoPayment(HttpServletResponse response, HttpServletRequest request) {
		
		String apiURL = null;
		String admin_key = "bae67e1926bf8534d3b638dbd95bbb67";
		
		cid(request.getParameter("cid"));
		partner_order_id(request.getParameter("partner_order_id"));
		partner_user_id(request.getParameter("partner_user_id"));
		
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
	public void kakaoApproval(HttpServletRequest request) {
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
			
			System.out.println("responseCode = " + responseCode);

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
			Object obj = parser.parse(res.toString());
			JSONObject json = (JSONObject) obj;
			
			System.out.println(res.toString());
			
			pay pay = new pay();
			
//			String id = session.getAttribute("id");
			String id = "test";
			
			member member = new member();
			member = memberService.selectOneMember(id);			
			pay.setId(id);
			pay.setIsCheck(0);
			pay.setAddr(member.getAddr());
			pay.setPhone(member.getPhone());
			pay.setName(member.getName());
//			pay.setTotalPrice(json.get("total"));
//			pay.setPayMethod(json.get("payment_method_type"));
			pay.setTotalPrice(1);
//			pay.setPayDate(json.get("approved_at"));
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
