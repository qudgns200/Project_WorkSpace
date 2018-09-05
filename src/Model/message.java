package Model;

import java.util.Date;

public class message {

	private String isTo;
	private String isFrom;
	private String content;
	private Date time;
	private String file;

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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "message [isTo=" + isTo + ", isFrom=" + isFrom + ", content=" + content + ", time=" + time + ", file=" + file
				+ "]";
	}
}
