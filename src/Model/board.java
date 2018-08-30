package Model;

import java.util.Date;

public class board {

	private int no;
	private String title;
	private String id;
	private String content;
	private String file;
	private Date writeDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "board [no=" + no + ", title=" + title + ", id=" + id + ", content=" + content + ", file=" + file
				+ ", writeDate=" + writeDate + "]";
	}
}
