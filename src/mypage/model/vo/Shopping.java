package mypage.model.vo;

import java.sql.Date;

public class Shopping {
	private int sc_no;
	private Date sc_date;
	private int sc_count;
	private int po_size;
	private int p_no;
	private String m_id;
	
	public Shopping() {}
	public Shopping(int sc_no, Date sc_date, int sc_count, int po_size, int p_no, String m_id) {
		super();
		this.sc_no = sc_no;
		this.sc_date = sc_date;
		this.sc_count = sc_count;
		this.po_size = po_size;
		this.p_no = p_no;
		this.m_id = m_id;
	}
	public Shopping(int sc_count, int po_size, int p_no, String m_id) {
		super();
		this.sc_count = sc_count;
		this.po_size = po_size;
		this.p_no = p_no;
		this.m_id = m_id;
	}
	
	public int getSc_no() {
		return sc_no;
	}
	public void setSc_no(int sc_no) {
		this.sc_no = sc_no;
	}
	public Date getSc_date() {
		return sc_date;
	}
	public void setSc_date(Date sc_date) {
		this.sc_date = sc_date;
	}
	public int getSc_count() {
		return sc_count;
	}
	public void setSc_count(int sc_count) {
		this.sc_count = sc_count;
	}
	public int getPo_size() {
		return po_size;
	}
	public void setPo_size(int po_size) {
		this.po_size = po_size;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "Shopping [sc_no=" + sc_no + ", sc_date=" + sc_date + ", sc_count=" + sc_count + ", po_size=" + po_size
				+ ", p_no=" + p_no + ", m_id=" + m_id + "]";
	}
}
