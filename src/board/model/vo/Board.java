package board.model.vo;

import java.sql.Date;

public class Board {
	private int bNo;
	private int bType;
	private String qcName;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String mId;
	private int bCount;
	private Date createDate;
	private Date modifyDate;
	private String status;
	public Board() {}
	public Board(int bNo, int bType, String qcName, String bTitle, String bContent, String bWriter, String mId,
			int bCount, Date createDate, Date modifyDate, String status) {
		super();
		this.bNo = bNo;
		this.bType = bType;
		this.qcName = qcName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.mId = mId;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getbType() {
		return bType;
	}
	public void setbType(int bType) {
		this.bType = bType;
	}
	public String getQcName() {
		return qcName;
	}
	public void setQcName(String qcName) {
		this.qcName = qcName;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bType=" + bType + ", qcName=" + qcName + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bWriter=" + bWriter + ", mId=" + mId + ", bCount=" + bCount + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
}