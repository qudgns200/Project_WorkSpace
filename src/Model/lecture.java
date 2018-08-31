package Model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class lecture {

	private int no;
	private String title;
	private String genre;
	private Date startDate;
	private Date endDate;
	private int numberPeople;
	private String guestID;
	private String artistID;
	private String place;
	private String content;
	private String file;
	private Date writeDate;
	private int state;
	private int maxPeople;
	private MultipartFile uploadfile; //추가
	private int price; //추가
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getNumberPeople() {
		return numberPeople;
	}
	public void setNumberPeople(int numberPeople) {
		this.numberPeople = numberPeople;
	}
	public String getGuestID() {
		return guestID;
	}
	public void setGuestID(String guestID) {
		this.guestID = guestID;
	}
	public String getArtistID() {
		return artistID;
	}
	public void setArtistID(String artistID) {
		this.artistID = artistID;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	
	@Override
	public String toString() {
		return "lecture [no=" + no + ", title=" + title + ", genre=" + genre + ", startDate=" + startDate + ", endDate="
				+ endDate + ", numberPeople=" + numberPeople + ", guestID=" + guestID + ", artistID=" + artistID
				+ ", place=" + place + ", content=" + content + ", file=" + file + ", writeDate=" + writeDate
				+ ", state=" + state + ", maxPeople=" + maxPeople + ", uploadfile=" + uploadfile + ", price=" + price
				+ "]";
	}
	
	
}
