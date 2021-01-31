package foot.model.vo;

public class Foot {
	private int f_No;
	private String f_Length;
	private String f_Width;
	private String f_Form;
	private String m_Id;
	
	public Foot() {
		super();
	}

	public Foot(String f_Length, String f_Width, String f_Form, String m_Id) {
		super();
		
		this.f_Length = f_Length;
		this.f_Width = f_Width;
		this.f_Form = f_Form;
		this.m_Id = m_Id;
	}
	
	public Foot(int f_No, String f_Length, String f_Width, String f_Form, String m_Id) {
		super();
		this.f_No = f_No;
		this.f_Length = f_Length;
		this.f_Width = f_Width;
		this.f_Form = f_Form;
		this.m_Id = m_Id;
	}

	public int getF_No() {
		return f_No;
	}

	public void setF_No(int f_No) {
		this.f_No = f_No;
	}

	public String getF_Length() {
		return f_Length;
	}

	public void setF_Length(String f_Length) {
		this.f_Length = f_Length;
	}

	public String getF_Width() {
		return f_Width;
	}

	public void setF_Width(String f_Width) {
		this.f_Width = f_Width;
	}

	public String getF_Form() {
		return f_Form;
	}

	public void setF_Form(String f_Form) {
		this.f_Form = f_Form;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	@Override
	public String toString() {
		return "Foot [f_No=" + f_No + ", f_Length=" + f_Length + ", f_Width=" + f_Width + ", f_Form=" + f_Form
				+ ", m_Id=" + m_Id + "]";
	}
	
	
}
