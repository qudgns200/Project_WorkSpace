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
	public List<art>	feed(String id);
	public List<member>	searchID(String id);
	public List<String>	selectFollowing(String id);
	public int sendMessage(message message);
	public List<message> logMessage(String to, String from);
	public int	deleteMessage(String to, String from);
	public int	insertAlarm(HashMap<String, Object>params);		// 수정
	public int	updateAlarm(int no);
	public int	deleteAlarm(String from);
	public List<alarm>	selectAlarm(String from);
	public int alarmCount(String from);	

	
}
