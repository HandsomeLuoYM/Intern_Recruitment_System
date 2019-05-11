package com.System.model;

public class Answer {

	private String Content;
	private String Completion;
	private int id;
	private int Status;
	private int UserId;
	private int Score;
	
	@Override
	public String toString() {
		return "Answer [Content=" + Content + ", Completion=" + Completion + ", id=" + id + ", Status=" + Status
				+ ", UserId=" + UserId + ", Score=" + Score + "]";
	}

	

	public Answer(String content, String completion, int status, int userId, int score) {
		super();
		this.Content = content;
		this.Completion = completion;
		this.Status = status;
		this.UserId = userId;
		this.Score = score;
	}



	public Answer(String content, String completion, int id, int status, int userId, int score) {
		super();
		this.Content = content;
		this.Completion = completion;
		this.id = id;
		this.Status = status;
		this.UserId = userId;
		this.Score = score;
	}

	public Answer() {
		super();
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getCompletion() {
		return Completion;
	}

	public void setCompletion(String completion) {
		Completion = completion;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public int getScore() {
		return Score;
	}

	public void setScore(int score) {
		Score = score;
	}
	
	
	
}
