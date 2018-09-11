package Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.artistDao;
import Model.art;
import Model.follow;
import Model.lecture;
import Model.likes;
@Service
public class artistServiceImpl implements artistService{

	@Autowired
	private artistDao artistDao;
	
	@Autowired
	private mainService mainService;
	
	@Override
	public int insertFollow(follow follow) {
		// TODO Auto-generated method stub
		return artistDao.insertFollow(follow);
	}

	@Override
	public HashMap<String, Object> selectFollower(HashMap<String, Object> params, int page) {
		HashMap<String, Object> result = new HashMap<>();
		
		if(page != 0) {
			result.put("current", page);
			result.put("start", mainService.getStartPage(page));
			result.put("end", mainService.getEndPage(page));
			result.put("last", getFollowerLastPage(params));
		
			params.put("skip", mainService.getSkip(page, 10));
			params.put("qty", 10);
		}
		result.put("followerList", artistDao.selectFollower(params));
		
		return result;
	}

	@Override
	public HashMap<String, Object> selectFollowing(HashMap<String, Object> params, int page) {
		// TODO Auto-generated method stub
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", getFollowingLastPage(params));
		
		params.put("skip", mainService.getSkip(page, 10));
		params.put("qty", 10);
		result.put("followingList", artistDao.selectFollowing(params));
		
		return result;
	}

	@Override
	public int deleteFollow(follow follow) {
		// TODO Auto-generated method stub
		return artistDao.deleteFollow(follow);
	}

	@Override
	public int insertLikes(likes likes) {
		// TODO Auto-generated method stub
		return artistDao.insertLikes(likes);
	}

	@Override
	public List<art> selectLikesArt(String id) {
		// TODO Auto-generated method stub
		return artistDao.selectLikesArt(id);
	}

	@Override
	public List<lecture> selectLikesLecture(String id) {
		// TODO Auto-generated method stub
		return artistDao.selectLikesLecture(id);
	}

	@Override
	public int deleteLikesArt(likes likes) {
		// TODO Auto-generated method stub
		return artistDao.deleteLikesArt(likes);
	}

	@Override
	public int deleteLikesLecture(likes likes) {
		// TODO Auto-generated method stub
		return artistDao.deleteLikesLecture(likes);
	}

	@Override
	public HashMap<String, Object> searchArtist(HashMap<String, Object> params, int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getSearchArtistLastPage(params));
		params.put("skip", mainService.getSkip(page, 9));
		result.put("artistList", artistDao.searchArtist(params));
		return result;
	}

	@Override
	public HashMap<String, Object> selectTopArtist() {
		HashMap<String, Object> result = new HashMap<>();
		result.put("originalList", artistDao.selectTopArtist("original"));
		result.put("paintingList", artistDao.selectTopArtist("painting"));
		result.put("sculptureList", artistDao.selectTopArtist("sculpture"));
		return result;
	}

	@Override
	public HashMap<String, Object> selectRecentArtist(String genre, int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getRecentArtistLastPage(genre));
		HashMap<String, Object> params = new HashMap<>();
		params.put("genre", genre);
		params.put("skip", mainService.getSkip(page, 9));
		result.put("artistList", artistDao.selectRecentArtist(params));
		return result;
	}

	@Override
	public int getFollowerLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (artistDao.getFollowerCount(params) - 1) / 10 + 1;
	}
	
	@Override
	public int getFollowingLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (artistDao.getFollowingCount(params) - 1) / 10 + 1;
	}
}
