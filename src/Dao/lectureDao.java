package Dao;

import java.util.HashMap;
import java.util.List;

import Model.lecture;
import Model.lectureComment;
import Model.lectureRecomment;

public interface lectureDao {

	public List<lecture> searchLecture(HashMap<String, Object> params); //수정
	public int	insertLecture(lecture lecture);
	public int	updateLecture(int no);
	public int	deleteLecture(int no);
	public lecture	selectOneLecture(int no);
	public int	insertAttendants(int no, String id);
	
	public List<lecture>	selectRecentLectureA();
	public List<lecture>	selectRecentLectureG();
	
	public List<lecture>	selectAllLectureA(int skip); //수정
	public List<lecture>	selectAllLectureG(int skip); //수정

	public int	insertLectureComment(lectureComment lectureComment);
	public int	insertLectureRecomment(lectureRecomment lectureRecomment);
	public List<lectureComment>	selectLectureComment(int no);
	public List<lectureRecomment> selectLectureRecomment(int commentNo);

	public int selectAllLectureACount(); //추가
	public int selectAllLectureGCount(); //추가
	public int searchLectureCount(HashMap<String, Object> params); //추가
}
