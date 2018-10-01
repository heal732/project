package kr.co.vol.dto;

public class Comments {
	private Long id;
	private Long party_id;
	private String writer;
	private String content;
	private String write_date;
	
	
	
	
	public Comments() {
		super();
	}

	public Comments(Long id, Long party_id, String writer, String content, String write_date) {
		super();
		this.id = id;
		this.party_id = party_id;
		this.writer = writer;
		this.content = content;
		this.write_date = write_date;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getParty_id() {
		return party_id;
	}
	public void setParty_id(Long party_id) {
		this.party_id = party_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	
	
}
