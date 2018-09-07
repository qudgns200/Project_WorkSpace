package Model;

import java.util.Date;

public class boardComment {

	private int no;
	private String id;
	private String content;
	private Date time;
	private int commentNo;
	private int groupNo; //댓글 묶음 번호
	private int childNode; //댓글, 답글 깊이 여부
	private int groupOrder; //댓글 묶음 내 순서
	
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
	public int getGroupOrder() {
		return groupOrder;
	}
	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}
	@Override
	public String toString() {
		return "boardComment [no=" + no + ", id=" + id + ", content=" + content + ", time=" + time + ", commentNo="
				+ commentNo + ", groupNo=" + groupNo + ", childNode=" + childNode + ", groupOrder=" + groupOrder + "]";
	}

}
