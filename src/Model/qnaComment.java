package Model;

import java.util.Date;

public class qnaComment {

	private int no;
	private String id;
	private String content;
	private Date time;
	private int commentNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	@Override
	public String toString() {
		return "artcomment [no=" + no + ", id=" + id + ", content=" + content + ", time=" + time + ", commentNo="
				+ commentNo + "]";
	}
	
}
