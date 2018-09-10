package Service;

import java.util.HashMap;
import java.util.List;

import Model.art;
import Model.follow;
import Model.lecture;
import Model.likes;

public interface artistService {
	
	public	int	insertFollow	(follow follow);
	public	HashMap<String, Object>	selectFollower	(HashMap<String, Object> params, int page);
	public	List<String>	selectFollowing	(String id);
	public	int	deleteFollow	(follow follow);
	public	int	insertLikes	(likes likes);
	public	List<art>	selectLikesArt	(String id);
	public	List<lecture>	selectLikesLecture	(String id);
	public	int	deleteLikesArt	(HashMap<String, Object> params);
	public	int	deleteLikesLecture	(HashMap<String, Object> params);
	
	public	HashMap<String, Object>	searchArtist	(HashMap<String, Object> params, int page);
	public	HashMap<String, Object>	selectTopArtist	();  //수정
	public	HashMap<String, Object>	selectRecentArtist	(String genre, int page); //수정

	public int getFollowerLastPage(HashMap<String, Object> params); // 추가
}
