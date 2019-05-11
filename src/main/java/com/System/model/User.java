package com.System.model;

public class User {
	private int AccountNumber;
	private String SchoolName;
	private String StudentName;
	private String StudentId;
	private String Grade;
	private String TelephoneNumber;
	private String PassWord;
	private String Email;
	private String Adress;
	private int IsAdmin;
	private int id;
	private String Self_introduction;
	private int status;
	private int TimeId;
	private int Score;
	private int InterviewScore;
	private String Picture;

	


	public User(int accountNumber, String passWord) {
		super();
		this.AccountNumber = accountNumber;
		this.PassWord = passWord;
	}



	public User(int accountNumber, String schoolName, String studentName, String studentId, String grade,
			String telephoneNumber, String passWord, String email, String adress, int isAdmin, int id,
			String self_introduction, int status, int timeId, int score, int interviewScore, String picture) {
		super();
		AccountNumber = accountNumber;
		SchoolName = schoolName;
		StudentName = studentName;
		StudentId = studentId;
		Grade = grade;
		TelephoneNumber = telephoneNumber;
		PassWord = passWord;
		Email = email;
		Adress = adress;
		IsAdmin = isAdmin;
		this.id = id;
		Self_introduction = self_introduction;
		this.status = status;
		TimeId = timeId;
		Score = score;
		InterviewScore = interviewScore;
		Picture = picture;
	}



	public User(int accountNumber, String schoolName, String studentName, String studentId, String grade,
			String telephoneNumber, String passWord, String email, String adress, int isAdmin, int id) {
		super();
		this.AccountNumber = accountNumber;
		this.SchoolName = schoolName;
		this.StudentName = studentName;
		this.StudentId = studentId;
		this.Grade = grade;
		this.TelephoneNumber = telephoneNumber;
		this.PassWord = passWord;
		this.Email = email;
		this.Adress = adress;
		this.IsAdmin = isAdmin;
		this.id = id;
	}


	public User(int accountNumber, String schoolName, String studentName, String studentId, String grade,
			String telephoneNumber, String passWord, int isAdmin, int id) {
		super();
		this.AccountNumber = accountNumber;
		this.SchoolName = schoolName;
		this.StudentName = studentName;
		this.StudentId = studentId;
		this.Grade = grade;
		this.TelephoneNumber = telephoneNumber;
		this.PassWord = passWord;
		this.IsAdmin = isAdmin;
		this.id = id;
	}


	public User() {
		super();
	}


	public String getPicture() {
		return Picture;
	}

	public void setPicture(String picture) {
		Picture = picture;
	}

	
	public int getAccountNumber() {
		return AccountNumber;
	}


	public void setAccountNumber(int accountNumber) {
		AccountNumber = accountNumber;
	}


	public String getSchoolName() {
		return SchoolName;
	}


	public void setSchoolName(String schoolName) {
		SchoolName = schoolName;
	}


	public String getStudentName() {
		return StudentName;
	}


	public void setStudentName(String studentName) {
		StudentName = studentName;
	}


	public String getStudentId() {
		return StudentId;
	}


	public void setStudentId(String studentId) {
		StudentId = studentId;
	}


	public String getGrade() {
		return Grade;
	}


	public void setGrade(String grade) {
		Grade = grade;
	}


	public String getTelephoneNumber() {
		return TelephoneNumber;
	}


	public void setTelephoneNumber(String telephoneNumber) {
		TelephoneNumber = telephoneNumber;
	}


	public String getPassWord() {
		return PassWord;
	}


	public void setPassWord(String passWord) {
		PassWord = passWord;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String getAdress() {
		return Adress;
	}


	public void setAdress(String adress) {
		Adress = adress;
	}


	public int getIsAdmin() {
		return IsAdmin;
	}


	public void setIsAdmin(int isAdmin) {
		IsAdmin = isAdmin;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getSelf_introduction() {
		return Self_introduction;
	}


	public void setSelf_introduction(String self_introduction) {
		Self_introduction = self_introduction;
	}
	
	
	
	@Override
	public String toString() {
		return "User [AccountNumber=" + AccountNumber + ", SchoolName=" + SchoolName + ", StudentName=" + StudentName
				+ ", StudentId=" + StudentId + ", Grade=" + Grade + ", TelephoneNumber=" + TelephoneNumber
				+ ", PassWord=" + PassWord + ", Email=" + Email + ", Adress=" + Adress + ", IsAdmin=" + IsAdmin
				+ ", id=" + id + ", Self_introduction=" + Self_introduction + ", status=" + status + ", TimeId="
				+ TimeId + ", Score=" + Score + ", InterviewScore=" + InterviewScore + "]";
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getTimeId() {
		return TimeId;
	}


	public void setTimeId(int timeId) {
		TimeId = timeId;
	}


	public int getScore() {
		return Score;
	}


	public void setScore(int score) {
		Score = score;
	}



	public int getInterviewScore() {
		return InterviewScore;
	}



	public void setInterviewScore(int interviewScore) {
		InterviewScore = interviewScore;
	}


}
