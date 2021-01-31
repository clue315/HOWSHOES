package product.model.vo;

import java.sql.Date;

import member.model.vo.Member;

public class ShoppingCart {
	private int scNo;
	private Date scDate;
	private int scCount;
	private String mId;
	private int poNo;
	private int pNo;
	
	

	public ShoppingCart(int scCount, String mId, int poNo, int pNo) {
		super();
		this.scCount = scCount;
		this.mId = mId;
		this.poNo = poNo;
		this.pNo = pNo;
	}


	public ShoppingCart(int scNo, Date scDate, int scCount, String mId, int poNo, int pNo) {
		super();
		this.scNo = scNo;
		this.scDate = scDate;
		this.scCount = scCount;
		this.mId = mId;
		this.poNo = poNo;
		this.pNo = pNo;
	}


	public int getScNo() {
		return scNo;
	}

	public void setScNo(int scNo) {
		this.scNo = scNo;
	}

	public Date getScDate() {
		return scDate;
	}

	public void setScDate(Date scDate) {
		this.scDate = scDate;
	}

	public int getScCount() {
		return scCount;
	}

	public void setScCount(int scCount) {
		this.scCount = scCount;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getPoNo() {
		return poNo;
	}

	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "ShoppingCart [scNo=" + scNo + ", scDate=" + scDate + ", scCount=" + scCount + ", mId=" + mId + ", poNo="
				+ poNo + ", pNo=" + pNo + "]";
	}
	
	
}
