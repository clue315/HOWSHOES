package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int n_no;
	private String n_title;
	private String n_content;
	private String n_writer;
	private int n_count;
	private Date n_date;
	private String n_status;
	
	public Notice() {}

	public Notice(String n_title, String n_content, String n_writer) {
		super();
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_writer = n_writer;
	}
	
	public Notice(String n_title, String n_content, String n_writer, Date n_date) {
		super();
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_writer = n_writer;
		this.n_date = n_date;
	}

	public Notice(int n_no, String n_title, String n_content, String n_writer, int n_count, Date n_date) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_writer = n_writer;
		this.n_count = n_count;
		this.n_date = n_date;
	}

	public Notice(int n_no, String n_title, String n_content, String n_writer, int n_count, Date n_date,
			String n_status) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_writer = n_writer;
		this.n_count = n_count;
		this.n_date = n_date;
		this.n_status = n_status;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	public int getN_count() {
		return n_count;
	}

	public void setN_count(int n_count) {
		this.n_count = n_count;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public String getN_status() {
		return n_status;
	}

	public void setN_status(String n_status) {
		this.n_status = n_status;
	}

	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_writer=" + n_writer
				+ ", n_count=" + n_count + ", n_date=" + n_date + ", n_status=" + n_status + "]";
	}
}
