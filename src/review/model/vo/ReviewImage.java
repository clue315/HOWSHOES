package review.model.vo;

import java.sql.Date;

public class ReviewImage {
	private int ri_no;
	private int r_no;
	private String ri_originName;
	private String ri_changeName;
	private String ri_filePath;
	private Date ri_uploadDate;
	private String ri_status;
	
	public ReviewImage() {}
	
	public ReviewImage(int r_no, String ri_changeName) {
		this.r_no = r_no;
		this.ri_changeName = ri_changeName;
	}

	public ReviewImage(int ri_no, int r_no, String ri_originName, String ri_changeName, String ri_filePath,
			Date ri_uploadDate, String ri_status) {
		super();
		this.ri_no = ri_no;
		this.r_no = r_no;
		this.ri_originName = ri_originName;
		this.ri_changeName = ri_changeName;
		this.ri_filePath = ri_filePath;
		this.ri_uploadDate = ri_uploadDate;
		this.ri_status = ri_status;
	}

	public int getRi_no() {
		return ri_no;
	}

	public void setRi_no(int ri_no) {
		this.ri_no = ri_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getRi_originName() {
		return ri_originName;
	}

	public void setRi_originName(String ri_originName) {
		this.ri_originName = ri_originName;
	}

	public String getRi_changeName() {
		return ri_changeName;
	}

	public void setRi_changeName(String ri_changeName) {
		this.ri_changeName = ri_changeName;
	}

	public String getRi_filePath() {
		return ri_filePath;
	}

	public void setRi_filePath(String ri_filePath) {
		this.ri_filePath = ri_filePath;
	}

	public Date getRi_uploadDate() {
		return ri_uploadDate;
	}

	public void setRi_uploadDate(Date ri_uploadDate) {
		this.ri_uploadDate = ri_uploadDate;
	}

	public String getRi_status() {
		return ri_status;
	}

	public void setRi_status(String ri_status) {
		this.ri_status = ri_status;
	}

	@Override
	public String toString() {
		return "ReviewImage [ri_no=" + ri_no + ", r_no=" + r_no + ", ri_originName=" + ri_originName
				+ ", ri_changeName=" + ri_changeName + ", ri_filePath=" + ri_filePath + ", ri_uploadDate="
				+ ri_uploadDate + ", ri_status=" + ri_status + "]";
	}
}
