package Model;

import java.util.Date;

public class alarm {

	private String type;
	private Date time;
	private String isTo;
	private String isFrom;
	private int readCheck;
	private int no;
	
	public int getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getIsTo() {
		return isTo;
	}
	public void setIsTo(String isTo) {
		this.isTo = isTo;
	}
	public String getIsFrom() {
		return isFrom;
	}
	public void setIsFrom(String isFrom) {
		this.isFrom = isFrom;
	}
	@Override
	public String toString() {
		return "alarm [type=" + type + ", time=" + time + ", isTo=" + isTo + ", isFrom=" + isFrom + ", readCheck="
				+ readCheck + ", no=" + no + "]";
	}
	
	
	
	
	
}
