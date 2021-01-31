package member.model.vo;

import java.sql.Date;

public class Member {
	private String m_Id;
	private String m_Pwd;
	private String m_Name;
	private String phone;
	private String address;
	private String email;
	private int point;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	
	public Member() {}

	public Member(String m_Id, String m_Pwd) {
		super();
		this.m_Id = m_Id;
		this.m_Pwd = m_Pwd;
	}

	public Member(String m_Id, String m_Pwd, String m_Name, String phone, String address, String email,
			int point) {
		super();
		
		this.m_Id = m_Id;
		this.m_Pwd = m_Pwd;
		this.m_Name = m_Name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.point = point;
	}
   
	public Member(String m_Id, String m_Pwd, String m_Name, String phone, String address, String email) {
		super();
		this.m_Id = m_Id;
		this.m_Pwd = m_Pwd;
		this.m_Name = m_Name;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}

	public Member( String m_Id, String m_Pwd, String m_Name, String phone, String address, String email,
			int point, Date enrollDate, Date modifyDate, String status) {
		super();
	
		this.m_Id = m_Id;
		this.m_Pwd = m_Pwd;
		this.m_Name = m_Name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.point = point;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Pwd() {
		return m_Pwd;
	}

	public void setM_Pwd(String m_Pwd) {
		this.m_Pwd = m_Pwd;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
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
		return "Member [ m_Id=" + m_Id + ", m_Pwd=" + m_Pwd + ", m_Name=" + m_Name + ", phone="
				+ phone + ", address=" + address + ", email=" + email + ", point=" + point + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
}
