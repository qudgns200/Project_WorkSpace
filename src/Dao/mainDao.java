package Dao;

import java.util.HashMap;
import java.util.List;

import Model.alarm;
import Model.art;
import Model.lecture;
import Model.member;
import Model.message;

public interface mainDao {

	public List<member>	containerOne();
	public List<member>	containerTwo();
	public List<art>	containerThree();
	public List<art>	containerFour();
	public List<art>	feed(HashMap<String, Object> params); // 파라미터 수정
	public List<member>	searchID(String id);
	public int sendMessage(message message);
	public List<message> messageList(String to); // 추가
	public List<message> logMessage(message message); // 파라미터 수정
	public int	deleteMessage(message message); // 파라미터 수정
	public int	insertAlarm(HashMap<String, Object>params);		// 수정
	public int	updateAlarm(int no);
	public int	deleteAlarm(int no);
	public List<HashMap<String, Object>> selectAlarm(alarm alarm);
	public int alarmCount(String isTo);	

	
}
