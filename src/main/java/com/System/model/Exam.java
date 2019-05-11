package com.System.model;

public class Exam {
	private int id;
	private String Stem;
	private String AOption;
	private String BOption;
	private String COption;
	private String DOption;
	private String RightOption;
	private int Score;
	
	public Exam(int id, String stem, String aOption, String bOption, String cOption, String dOption, String rightOption,
			int score) {
		super();
		this.id = id;
		this.Stem = stem;
		this.AOption = aOption;
		this.BOption = bOption;
		this.COption = cOption;
		this.DOption = dOption;
		this.RightOption = rightOption;
		this.Score = score;
	}
	public Exam(String Stem, String aOption, String bOption, String cOption, String dOption, String rightOption) {
		super();
		this.Stem = Stem;
		this.AOption = aOption;
		this.BOption = bOption;
		this.COption = cOption;
		this.DOption = dOption;
		this.RightOption = rightOption;
	}
	public Exam() {
		super();
	}
	@Override
	public String toString() {
		return "Exam [id=" + id + ", Stem=" + Stem + ", AOption=" + AOption + ", BOption=" + BOption + ", COption="
				+ COption + ", DOption=" + DOption + ", RightOption=" + RightOption + ", score=" + Score + "]";
	}
	public String getStem() {
		return Stem;
	}
	public void setStem(String Stem) {
		this.Stem = Stem;
	}
	public String getAOption() {
		return AOption;
	}
	public void setAOption(String aOption) {
		AOption = aOption;
	}
	public String getBOption() {
		return BOption;
	}
	public void setBOption(String bOption) {
		BOption = bOption;
	}
	public String getCOption() {
		return COption;
	}
	public void setCOption(String cOption) {
		COption = cOption;
	}
	public String getDOption() {
		return DOption;
	}
	public void setDOption(String dOption) {
		DOption = dOption;
	}
	public String getRightOption() {
		return RightOption;
	}
	public void setRightOption(String rightOption) {
		RightOption = rightOption;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getScore() {
		return Score;
	}
	public void setScore(int score) {
		Score = score;
	}

}
