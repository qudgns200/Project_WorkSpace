package Service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import Dao.lectureDao;
import Model.lecture;
import Model.lectureComment;
import Model.lectureRecomment;

@Service
public class lectureServiceImpl implements lectureService{

	@Autowired
	private lectureDao lectureDao;
	
	@Autowired
	private mainService mainService;

	@Override
	public HashMap<String, Object> searchLecture(HashMap<String, Object>params, int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getSearchLectureLastPage(params));
		params.put("skip", mainService.getSkip(page, 5));
		params.put("qty", 5);
		result.put("lectureList", lectureDao.searchLecture(params));
		return result;
	}

	@Override
	public int insertLecture(lecture lecture, MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "C:/Project/Project/WebContent/resources/Thumnail/lectureImage/";

		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs(); //지정 경로에 폴더가 없을 시 폴더 생성 요청
		
		String fileName=new Date().getTime() + "_" + file.getOriginalFilename();
		File attachFile = new File(path + fileName);
		try {
			file.transferTo(attachFile);
			lecture.setFile(fileName);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lectureDao.insertLecture(lecture);
	}

	@Override
	public int updateLecture(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLecture(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public lecture selectOneLecture(int no) {
		return lectureDao.selectOneLecture(no);
	}

	@Override
	public int insertAttendants(int no, String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<lecture> selectRecentLectureA() {
		return lectureDao.selectRecentLectureA();
	}

	@Override
	public List<lecture> selectRecentLectureG() {
		return lectureDao.selectRecentLectureG();
	}

	@Override
	public HashMap<String, Object> selectAllLectureA(int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getAllLectureALastPage());
		result.put("lectureList", lectureDao.selectAllLectureA(mainService.getSkip(page, 5)));
		return result;
	}

	@Override
	public HashMap<String, Object> selectAllLectureG(int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getAllLectureGLastPage());
		result.put("lectureList", lectureDao.selectAllLectureG(mainService.getSkip(page, 5)));
		return result;
	}

	@Override
	public int insertLectureComment(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLectureRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<lectureComment> selectLectureComment(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<lectureRecomment> selectLectureRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
