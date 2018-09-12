package Dao;

import java.util.HashMap;

import java.util.List;

import Model.attendants;
import Model.lecture;
import Model.lectureComment;
import Model.pay;

public interface lectureDao {

	public List<lecture> searchLecture(HashMap<String, Object> params); //수정
	public int	insertLecture(lecture lecture);
	public int	updateLecture(lecture lecture);
	public int	deleteLecture(int no);
	public lecture	selectOneLecture(int no);
	public int	insertAttendants(attendants attendants);
	
	public List<lecture>	selectRecentLectureA();
	public List<lecture>	selectRecentLectureG();
	
	public List<lecture>	selectAllLectureA(int skip); //수정
	public List<lecture>	selectAllLectureG(int skip); //수정

	public int	insertLectureComment(lectureComment lectureComment);
	public List<lectureComment>	selectLectureComment(HashMap<String, Object> params);
	public lectureComment selectLectureLatestcomment();
	
	public int selectAllLectureACount(); //추가
	public int selectAllLectureGCount(); //추가
	public int searchLectureCount(HashMap<String, Object> params); //추가
	public int updateLecturePeople(lecture lecture); //추가
	public List<attendants> selectAttendants(int no); //추가
	
	public int deleteLectureComment(int no);
	
}
