package Model;

import java.util.Date;

public class message {

	private String to;
	private String from;
	private String content;
	private Date time;
	private String file;
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
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
		return "message [to=" + to + ", from=" + from + ", content=" + content + ", time=" + time + ", file=" + file
				+ "]";
	}
	
	
	
}
