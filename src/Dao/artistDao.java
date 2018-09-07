package Dao;

import java.util.HashMap;
import java.util.List;

import Model.art;
import Model.follow;
import Model.lecture;
import Model.likes;
import Model.member;

public interface artistDao {

	public int	insertFollow(follow follow);
	public List<String>	selectFollower(String id);
	public List<String>	selectFollowing(String id);
	public int	deleteFollow(follow follow);
	public int	insertLikes(likes likes);
	public List<art>	selectLikesArt(String id);
	public List<lecture>	selectLikesLecture(String id);
	public int	deleteLikesArt(String id, int no);
	public int	deleteLikesLecture(String id, int no);
	public List<String>	selectGenreArtist(String genre);
	public List<member>	searchArtist(HashMap<String, Object>params);
	public List<HashMap<String, Object>>	selectTopArtist(String genre); //수정
	public List<member>	selectRecentArtist(HashMap<String, Object>params); //수정
	public int searchArtistCount(HashMap<String, Object>params); // 추가
	public int recentArtistCount(String genre); // 추가

	
}
