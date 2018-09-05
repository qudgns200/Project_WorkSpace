package Dao;

import java.util.HashMap;
import java.util.List;

import Model.art;
import Model.artComment;
import Model.artRecomment;
import Model.pay;

public interface artDao {

	public List<art>	searchArt(HashMap<String, Object> params);
	public List<art>	selectTopArt(String genre);
	public List<art>	selectRecentArt(HashMap<String, Object> params);
	public art	selectOneArt(int no);
	public int	insertArtPay(pay pay);
	public int	insertArtComment(artComment artComment);

	public List<artComment>	selectArtComment(HashMap<String, Object>params);
	public artComment selectArtLatestcomment();

	public int searchArtCount(HashMap<String, Object>params); //추가
	public int selectRecentArtCount(String genre); //추가

	//추가
	public int getMaxGroupNo(int no);
	public int deleteComment(artComment artComment);
	public int updateComment(artComment artComment);
	
	public int selectGroupNo(artComment artComment);
	public int maxGroupOrder(int groupNo);
	public int updateGroupOrder(artComment artComment);
}
