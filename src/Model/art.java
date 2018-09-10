package Model;

import java.util.Date;


import org.springframework.web.multipart.MultipartFile;

public class art {

	private int no;
	private String title;
	private String genre;
	private String content;
	private int sellCheck;
	private int price;
	private int isCheck;
	private String id;
	private Date artDate;
	private int state;
	private int totalCount;
	private String file;
	private String nickname;
	
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSellCheck() {
		return sellCheck;
	}
	public void setSellCheck(int sellCheck) {
		this.sellCheck = sellCheck;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getArtDate() {
		return artDate;
	}
	public void setArtDate(Date artDate) {
		this.artDate = artDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
<<<<<<< HEAD
=======

>>>>>>> origin/master
	@Override
	public String toString() {
		return "art [no=" + no + ", title=" + title + ", genre=" + genre + ", content=" + content + ", sellCheck="
				+ sellCheck + ", price=" + price + ", isCheck=" + isCheck + ", id=" + id + ", artDate=" + artDate
				+ ", state=" + state + ", totalCount=" + totalCount + ", file=" + file + ", nickname=" + nickname + "]";
<<<<<<< HEAD
=======

>>>>>>> origin/master
	}
}
