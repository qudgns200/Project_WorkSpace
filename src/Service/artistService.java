package Service;

import java.util.HashMap;
import java.util.List;

import Model.art;
import Model.lecture;
import Model.likes;
import Model.member;

public interface artistService {
	
	public	int	insertFollow	(String followerID, String followingID);
	public	List<String>	selectFollower	(String id);
	public	List<String>	selectFollowing	(String id);
	public	int	deleteFollow	(String followerID, String followingID);
	public	int	insertLikes	(likes likes);
	public	List<art>	selectLikesArt	(String id);
	public	List<lecture>	selectLikesLecture	(String id);
	public	int	deleteLikesArt	(String id, int no);
	public	int	deleteLikesLecture	(String id, int no);
	
	public	HashMap<String, Object>	searchArtist	(HashMap<String, Object> params, int page);
	public	HashMap<String, Object>	selectTopArtist	();  //수정
	public	HashMap<String, Object>	selectRecentArtist	(String genre, int page); //수정


}
