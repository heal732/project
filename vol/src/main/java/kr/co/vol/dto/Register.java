package kr.co.vol.dto;

public class Register {
	public String name;
	public String phone;
	public String addr;
	public String reason;
	public String mem_id;
	public Register() {
		super();
	}
	public Register(String name, String phone, String addr, String reason, String mem_id) {
		super();
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.reason = reason;
		this.mem_id=mem_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	

}
