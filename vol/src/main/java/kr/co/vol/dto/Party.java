package kr.co.vol.dto;

public class Party {
	 private String id;
	    private String title;
	    private String writer;
	    private String write_date;
	    private String content;
	    private String views;
		public Party() {
			super();
		}
		public Party(String id, String title, String writer, String write_date, String content, String views) {
			super();
			this.id = id;
			this.title = title;
			this.writer = writer;
			this.write_date = write_date;
			this.content = content;
			this.views = views;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getWrite_date() {
			return write_date;
		}
		public void setWrite_date(String write_date) {
			this.write_date = write_date;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getViews() {
			return views;
		}
		public void setViews(String views) {
			this.views = views;
		}

	
}
