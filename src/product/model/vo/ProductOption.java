package product.model.vo;

public class ProductOption {
	private int poNo;
	private int poSize;
	private String poYn;
	private int poInventory;
	private int pNo;
	
	public ProductOption() {}

	public ProductOption(int poNo, int poSize, String poYn, int poInventory, int pNo) {
		super();
		this.poNo = poNo;
		this.poSize = poSize;
		this.poYn = poYn;
		this.poInventory = poInventory;
		this.pNo = pNo;
	}

	public int getPoNo() {
		return poNo;
	}

	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}

	public int getPoSize() {
		return poSize;
	}

	public void setPoSize(int poSize) {
		this.poSize = poSize;
	}

	public String getPoYn() {
		return poYn;
	}

	public void setPoYn(String poYn) {
		this.poYn = poYn;
	}

	public int getPoInventory() {
		return poInventory;
	}

	public void setPoInventory(int poInventory) {
		this.poInventory = poInventory;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "ProductOption [poNo=" + poNo + ", poSize=" + poSize + ", poYn=" + poYn + ", poInventory=" + poInventory
				+ ", pNo=" + pNo + "]";
	}
	
	 
}
