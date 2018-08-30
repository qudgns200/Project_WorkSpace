package Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{ //AbstractView : 스프링프레임워크에서 제공하는 클래스
												//				 View 구현을 위한 추상 기본 클래스
	private File file;
	
	public DownloadView(File file) { //DownloadView 생성자 생성
		// TODO Auto-generated constructor stub
		setContentType("applicationContext/download; UTF-8");
		this.file = file;
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		//한글 처리를 위한 respons의 setContetType 함수
		response.setContentType(getContentType());
		response.setContentLength((int) file.length()); //파일 사이즈 대입
		
		String userAgent = request.getHeader("User-Agent"); //HTTP 요청 헤더에 User-Agent 로 지정된 이름으로 할당된 값을 리턴
		boolean ie = userAgent.indexOf("MSIE") > -1; //웹 브라우저가 IE인지 확인
		
		String fileName = null;
		
		//ie일 경우 인코딩 해주고 아닐 경우 byte로 변환
		if(ie)
			fileName = URLEncoder.encode(file.getName(), "UTF-8");
		else
			fileName = new String(file.getName().getBytes("UTF-8"));
		
		//setHeader : 요청에 대한 서버 정보를 주는 객체
		response.setHeader("Content-Disposition", "attachment; filename=\" " + fileName + "\"; ");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream(); //응답에 쓰기 위한 준비
		
		FileInputStream fis = null; //파일로부터 바이트 단위의 입력을 받는 클래스
		
		
		// 1. 업로드 할 file을 받고 응답 요청에 복사
		// 2. out으로 쓰고 출력(flush)
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(fis!=null)
				try {
					fis.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
		}
		out.flush();
	}
}
