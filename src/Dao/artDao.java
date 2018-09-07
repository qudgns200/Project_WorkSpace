package Dao;

import java.util.HashMap;

import java.util.List;

import Model.art;
import Model.artComment;
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
	public int getMaxGroupNo(HashMap<String, Object> params);
	public int deleteComment(HashMap<String, Object> params);
	public int updateComment(HashMap<String, Object> params);
	
	public int selectGroupNo(HashMap<String, Object> params);
	public int maxGroupOrder(HashMap<String, Object> params);
	public int updateGroupOrder(HashMap<String, Object> params);
}
