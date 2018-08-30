package Service;

import java.util.HashMap;
import java.util.List;

import Model.art;
import Model.artComment;
import Model.artRecomment;
import Model.pay;

public interface artService {

	public	HashMap<String, Object>	searchArt	(HashMap<String , Object>params, int page); //수정
	public	List<art>	selectTopArt	(String genre);
	public	HashMap<String, Object>	selectRecentArt	(String genre, int page); //수정

	public	art	selectOneArt	(int no);
	public	int	insertArtPay	(pay pay);
	public	int	insertArtComment	(artComment artComment);
	public	int	insertArtRecomment	(int commentNo);
	public	List<artComment>	selectArtComment	(int no);
	public	List<artRecomment>	selectArtRecomment	(int commentNo);

	//추가
	public int getMaxGroupNo(int no); //댓글 묶음 번호 확인
	public int deleteComment(artComment artComment);
	public int updateComment(artComment artComment);
	
}
