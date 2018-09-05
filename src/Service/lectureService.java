package Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import Model.lecture;
import Model.lectureComment;

public interface lectureService {

	public	HashMap<String, Object>	searchLecture	(HashMap<String, Object>params, int page);	//수정
	public	int	insertLecture	(lecture lecture, MultipartFile file);
	public	int	updateLecture	(int no);
	public	int	deleteLecture	(int no);
	public	lecture	selectOneLecture	(int no);
	public	int	insertAttendants	(int no, String id)
	;
	public	List<lecture>	selectRecentLectureA();
	public	List<lecture>	selectRecentLectureG();
	
	public	HashMap<String, Object>	selectAllLectureA(int page); // 수정
	public	HashMap<String, Object>	selectAllLectureG(int page); // 수정
	
	public	int	insertLectureComment	(int no);
	public	int	insertLectureRecomment	(int commentNo);
	public	List<lectureComment>	selectLectureComment (int no);
	public int updateLecturePeople (int no); // 추가 (강의 신청인원 증가)

	
}
