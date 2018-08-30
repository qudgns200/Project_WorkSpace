package Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.artDao;
import Model.art;
import Model.artComment;
import Model.artRecomment;
import Model.pay;
@Service
public class artServiceImpl implements artService{

	@Autowired
	private artDao artDao;
	
	@Autowired
	private mainService mainService;
	
	@Override
	public HashMap<String, Object> searchArt(HashMap<String, Object> params, int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getSearchArtLastPage(params));
		params.put("skip", mainService.getSkip(page, 9));
		params.put("qty", 9);
		result.put("artList", artDao.searchArt(params));
		return result;
	}

	@Override
	public List<art> selectTopArt(String genre) {
		return artDao.selectTopArt(genre);
	}

	@Override
	public HashMap<String, Object> selectRecentArt(String genre, int page) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("current", page);
		result.put("start", mainService.getStartPage(page));
		result.put("end", mainService.getEndPage(page));
		result.put("last", mainService.getRecentArtLastPage(genre));
		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", mainService.getSkip(page, 9));
		params.put("genre", genre);
		result.put("artList", artDao.selectRecentArt(params));
		return result;
	}

	@Override
	public art selectOneArt(int no) {
		// TODO Auto-generated method stub
		return artDao.selectOneArt(no);
	}

	@Override
	public int insertArtPay(pay pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertArtComment(artComment artComment) {
		// TODO Auto-generated method stub
		return artDao.insertArtComment(artComment);
	}

	@Override
	public int insertArtRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<artComment> selectArtComment(int no) {
		// TODO Auto-generated method stub
		return artDao.selectArtComment(no);
	}

	@Override
	public List<artRecomment> selectArtRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//추가
	@Override
	public int getMaxGroupNo(int no) {
		// TODO Auto-generated method stub
		return artDao.getMaxGroupNo(no);
	}

	@Override
	public int deleteComment(artComment artComment) {
		// TODO Auto-generated method stub
		return artDao.deleteComment(artComment);
	}
	
	@Override
	public int updateComment(artComment artComment) {
		return artDao.updateComment(artComment);
	}

	
	
}
