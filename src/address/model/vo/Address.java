package address.model.vo;

public class Address {
	private int No;
	private String Name;
	private String Person;
	private String Address;
	private String Phone;
	private String Chose;
	private String mId;
	
	public Address() {}

	public Address(int no, String name, String person, String address, String phone, String chose, String mid) {
		super();
		No = no;
		Name = name;
		Person = person;
		Address = address;
		Phone = phone;
		Chose = chose;
		mId = mid;
	}

	public int getNo() {
		return No;
	}

	public void setNo(int no) {
		No = no;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPerson() {
		return Person;
	}

	public void setPerson(String person) {
		Person = person;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getChose() {
		return Chose;
	}

	public void setChose(String chose) {
		Chose = chose;
	}

	public String getMId() {
		return mId;
	}

	public void setMId(String mid) {
		mId = mid;
	}

	@Override
	public String toString() {
		return "Address [No=" + No + ", Name=" + Name + ", Person=" + Person + ", Address=" + Address + ", Phone="
				+ Phone + ", Chose=" + Chose + ", mId=" + mId + "]";
	}
	
}
