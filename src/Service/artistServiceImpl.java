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
	public List<String> selectFollower(String id) {
		return artistDao.selectFollower(id);
	}

	@Override
	public List<String> selectFollowing(String id) {
		// TODO Auto-generated method stub
		return artistDao.selectFollowing(id);
	}

	@Override
	public int deleteFollow(follow follow) {
		// TODO Auto-generated method stub
		return artistDao.deleteFollow(follow);
	}

	@Override
	public int insertLikes(likes likes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<art> selectLikesArt(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<lecture> selectLikesLecture(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteLikesArt(String id, int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLikesLecture(String id, int no) {
		// TODO Auto-generated method stub
		return 0;
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

}
