package kr.co.vol.dto;

public class Bbs {

	private long id;
	private String title;
	private String content;
	private String type;
	private String write_date;
	private String writer;
	private Integer views;
	
	public Bbs() {
		super();
	}
	public Bbs(long id, String title, String content, String type, String write_date, String writer, Integer views) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.type = type;
		this.write_date = write_date;
		this.writer = writer;
		this.views = views;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	
	
	
}
