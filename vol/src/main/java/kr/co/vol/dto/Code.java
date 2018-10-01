package kr.co.vol.dto;

public class Code {
	private String sido;
	private String gugun;
	public Code() {
		super();
	}
	public Code(String sido, String gugun) {
		super();
		this.sido = sido;
		this.gugun = gugun;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	
	
}
