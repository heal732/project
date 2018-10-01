package kr.co.vol.dto;

public class ImgPath {

	private String URL;
	private long bbs_id;
	public ImgPath() {
		super();
	}
	public ImgPath(String uRL, long bbs_id) {
		super();
		URL = uRL;
		this.bbs_id = bbs_id;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public long getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(long bbs_id) {
		this.bbs_id = bbs_id;
	}
	
	
}
