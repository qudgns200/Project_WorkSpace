package Model;

import java.util.Date;

public class artComment {
	
	private int no; //게시글 번호
	private String id;
	private String content;
	private Date time;
	private int commentNo;
	private int groupNo;
	private int childNode;
	
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
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getChildNode() {
		return childNode;
	}
	public void setChildNode(int childNode) {
		this.childNode = childNode;
	}
	@Override
	public String toString() {
		return "test [no=" + no + ", id=" + id + ", content=" + content + ", time=" + time + ", commentNo=" + commentNo
				+ ", groupNo=" + groupNo + ", childNode=" + childNode + "]";
	}
}
