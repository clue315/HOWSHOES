package product.model.vo;

import java.sql.Date;

public class ProductImage {
	private int piNo;
	private int pNo;
	private String piOriginName;
	private String piChangeName;
	private String piPath;
	private Date piDate;
	private int fileLevel;
	private String status;
	
	public ProductImage() {}

	public ProductImage(int piNo, int pNo, String piOriginName, String piChangeName, String piPath, Date piDate,
			int fileLevel, String status) {
		super();
		this.piNo = piNo;
		this.pNo = pNo;
		this.piOriginName = piOriginName;
		this.piChangeName = piChangeName;
		this.piPath = piPath;
		this.piDate = piDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public ProductImage(int pNo, String piChangeName) {
		super();
		this.pNo = pNo;
		this.piChangeName = piChangeName;
	}

	public int getPiNo() {
		return piNo;
	}

	public void setPiNo(int piNo) {
		this.piNo = piNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getPiOriginName() {
		return piOriginName;
	}

	public void setPiOriginName(String piOriginName) {
		this.piOriginName = piOriginName;
	}

	public String getPiChangeName() {
		return piChangeName;
	}

	public void setPiChangeName(String piChangeName) {
		this.piChangeName = piChangeName;
	}

	public String getPiPath() {
		return piPath;
	}

	public void setPiPath(String piPath) {
		this.piPath = piPath;
	}

	public Date getPiDate() {
		return piDate;
	}

	public void setPiDate(Date piDate) {
		this.piDate = piDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product_Image [piNo=" + piNo + ", pNo=" + pNo + ", piOriginName=" + piOriginName + ", piChangeName="
				+ piChangeName + ", piPath=" + piPath + ", piDate=" + piDate + ", fileLevel=" + fileLevel + ", status="
				+ status + "]";
	}
	
}
