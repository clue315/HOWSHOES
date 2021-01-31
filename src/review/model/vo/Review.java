package review.model.vo;

import java.sql.Date;

public class Review {
	private int r_no;
	private String r_writer;
	private int r_score;
	private String r_content;
	private int r_count;
	private Date r_date;
	private String r_status;
	private int p_no;
	
	public Review () {}
	
	public Review (String r_writer) {
		this.r_writer = r_writer;
	}
	
	public Review(int r_no, String r_writer) {
		super();
		this.r_no = r_no;
		this.r_writer = r_writer;
	}

	public Review(int r_no, String r_writer, int r_score, String r_content, int r_count, Date r_date, String r_status,
			int p_no) {
		super();
		this.r_no = r_no;
		this.r_writer = r_writer;
		this.r_score = r_score;
		this.r_content = r_content;
		this.r_count = r_count;
		this.r_date = r_date;
		this.r_status = r_status;
		this.p_no = p_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	

	@Override
	public String toString() {
		return "Review [r_no=" + r_no + ", r_writer=" + r_writer + ", r_score=" + r_score + ", r_content=" + r_content
				+ ", r_count=" + r_count + ", r_date=" + r_date + ", r_status=" + r_status + ", p_no=" + p_no
				+"]";
	}
}
