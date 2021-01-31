package product.model.vo;

import java.sql.Date;

public class Product {
	private int pNo;
	private String pName;
	private int pPrice;
	private String pInfo;
	private int pCount;
	private int pcNo;
	private int poSize;
	private Date createDate;
	private String status;
	
	public Product() {}

	public Product(int pNo, String pName, int pPrice, String pInfo, int pCount, int pcNo, Date createDate,
			String status) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pInfo = pInfo;
		this.pCount = pCount;
		this.pcNo = pcNo;
		this.createDate = createDate;
		this.status = status;
	}

	public Product(int pNo, String pName, int pPrice, String pInfo, int pCount, int pcNo, int poSize) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pInfo = pInfo;
		this.pCount = pCount;
		this.pcNo = pcNo;
		this.poSize = poSize;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpInfo() {
		return pInfo;
	}

	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public int getPcNo() {
		return pcNo;
	}

	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
	}
	
	public int getPoSize() {
		return poSize;
	}

	public void setPoSize(int poSize) {
		this.poSize = poSize;
	}

	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pName=" + pName + ", pPrice=" + pPrice + ", pInfo=" + pInfo + ", pCount="
				+ pCount + ", pcNo=" + pcNo + ", poSize=" + poSize +"]";
	}
}
