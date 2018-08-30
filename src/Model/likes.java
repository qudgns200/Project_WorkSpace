package Model;

public class likes {

	private int no;
	private String id;
	private int isCheck;
	
	
	public int getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}
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

	@Override
	public String toString() {
		return "likes [no=" + no + ", id=" + id + ", isCheck=" + isCheck + "]";
	}
	
	
	
	
}
