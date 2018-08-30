package Model;

import java.util.Date;

public class pay {

	private int no;
	private String id;
	private int isCheck;
	private String addr;
	private String phone;
	private String name;
	private int totalPrice;
	private int payMethod;
	private int state;
	private Date payDate;
	private String orderNumber;
	
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
	public int getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(int payMethod) {
		this.payMethod = payMethod;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	
	@Override
	public String toString() {
		return "pay [no=" + no + ", id=" + id + ", isCheck=" + isCheck + ", addr=" + addr + ", phone=" + phone
				+ ", name=" + name + ", totalPrice=" + totalPrice + ", payMethod=" + payMethod + ", state=" + state
				+ ", payDate=" + payDate + ", orderNumber=" + orderNumber + "]";
	}
	
	
}
