package Dao;

import java.util.HashMap;
import java.util.List;

import Model.art;
import Model.lecture;
import Model.member;
import Model.pay;

public interface memberDao {

	public member selectOneMember(String id);
	public int	insertMember(member member);
	public List<member>	searchMember(HashMap<String, Object> params); // 수정
	public List<member>	searchApproveArtist(HashMap<String, Object> params); // 수정
	public List<member>	selectAllMember(HashMap<String, Object> params); // 수정
	public int	deleteMember(String id);
	public int	blackList(String id); // 수정
	public int	updateApproveArtist(String id);
	public int	updateRefuseArtist(String id);
	public int	updateMember(member member);
	//params : 스킵할 레코드의 갯수와 조회할 레코드의 갯수
	public List<HashMap<String, Object>>	selectMyAttendLec(HashMap<String, Object>params);	//수정
	public List<HashMap<String, Object>>	selectGatherLec(HashMap<String, Object>params);		//수정
	
	//params : 스킵할 레코드의 갯수와 조회할 레코드의 갯수
	public List<pay> selectOnePay(HashMap<String, Object>params);
	public int	insertLecturePay(pay pay);
	public int	insertArt(art art);
	public List<art>	selectArtistArt(String id);
	
	public int	updateArt(HashMap<String, Object> params); // 수정
	public int	deleteArt(HashMap<String, Object> params); // 수정
	public List<HashMap<String, Object>>	selectRequestLec(HashMap<String, Object>params);
	public List<HashMap<String, Object>>	selectApproveLec(HashMap<String, Object>params);
	
	public List<art>	selectSellingArt(HashMap<String, Object>params);
	public List<HashMap<String, Object>>	selectSoldArt(HashMap<String, Object>params);
	public List<HashMap<String, Object>>	selectBuyingArt(HashMap<String, Object>params);
	
	public int	updateDelivery(pay pay); // 수정
	
	public member selectOneNickname(String nickname);
	
	public int getArtistCount(HashMap<String, Object> params); // 추가 - 테이블 레코드 개수
	public int getCount(HashMap<String, Object> params); // 추가 - 테이블 레코드 개수
	
	//강의내역 레코드 갯수 조회
	public int getAttendLecCount(String id);
	public int getGatherLecCount(HashMap<String, Object> params);
	public int getRequestLecCount(String id);
	public int getApproveLecCount(String id);
	
	//주문 및 판매관리 레코드 갯수 조회
	public int getBuyingArtCount(String id);
	public int getSellingArtCount(String id);
	public int getSoldArtCount(String id);
	public int getOnePayCount(String id);
	
	public Integer updateApproveLec(lecture lecture); // 추가
}
