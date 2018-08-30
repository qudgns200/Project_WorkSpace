package Model;

import java.util.Date;

public class lectureRecomment {

	private int commentNo;
	private String id;
	private String content;
	private Date time;
	private int reCommentNo;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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
	public int getReCommentNo() {
		return reCommentNo;
	}
	public void setReCommentNo(int reCommentNo) {
		this.reCommentNo = reCommentNo;
	}
	@Override
	public String toString() {
		return "artrecomment [commentNo=" + commentNo + ", id=" + id + ", content=" + content + ", time=" + time
				+ ", reCommentNo=" + reCommentNo + "]";
	}

	
	
	
	
}
