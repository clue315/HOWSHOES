package order.model.vo;

import java.sql.Date;

public class Order {
	private int oNo;
	private int oCount;
	private int oTotal;
	private int oSale;
	private String oName;
	private String oAddress;
	private String oPhone;
	private String oComment;
	private String oStatus;
	private Date oDate;
	private int poSize;
	private String mId;
	
	public Order() {}

	public Order(int oNo, int oCount, int oTotal, int oSale, String oName, String oAddress, String oPhone,
			String oComment, String oStatus, Date oDate, int poSize, String mId) {
		super();
		this.oNo = oNo;
		this.oCount = oCount;
		this.oTotal = oTotal;
		this.oSale = oSale;
		this.oName = oName;
		this.oAddress = oAddress;
		this.oPhone = oPhone;
		this.oComment = oComment;
		this.oStatus = oStatus;
		this.oDate = oDate;
		this.poSize = poSize;
		this.mId = mId;
	}
	
	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getoCount() {
		return oCount;
	}

	public void setoCount(int oCount) {
		this.oCount = oCount;
	}

	public int getoTotal() {
		return oTotal;
	}

	public void setoTotal(int oTotal) {
		this.oTotal = oTotal;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoAddress() {
		return oAddress;
	}

	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}

	public String getoPhone() {
		return oPhone;
	}

	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}

	public String getoComment() {
		return oComment;
	}

	public void setoComment(String oComment) {
		this.oComment = oComment;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getPoSize() {
		return poSize;
	}

	public void setPoSize(int poSize) {
		this.poSize = poSize;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public int getoSale() {
		return oSale;
	}

	public void setoSale(int oSale) {
		this.oSale = oSale;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	@Override
	public String toString() {
		return "Order [oNo=" + oNo + ", oCount=" + oCount + ", oTotal=" + oTotal + ", oSale=" + oSale + ", oName="
				+ oName + ", oAddress=" + oAddress + ", oPhone=" + oPhone + ", oComment=" + oComment + ", oStatus="
				+ oStatus + ", oDate=" + oDate + ", poSize=" + poSize + ", mId=" + mId + "]";
	}
}
