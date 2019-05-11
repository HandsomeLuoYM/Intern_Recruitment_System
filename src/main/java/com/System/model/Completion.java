package com.System.model;

public class Completion {
	private int id;
	private String Content;
	private String Answer;
	private int Score;
	
	@Override
	public String toString() {
		return "Completion [id=" + id + ", Content=" + Content + ", Answer=" + Answer + ", Score=" + Score + "]";
	}
	public Completion() {
		super();
	}
	
	public Completion(int id, String content, String answer, int score) {
		super();
		this.id = id;
		Content = content;
		Answer = answer;
		Score = score;
	}
	
	
	public int getScore() {
		return Score;
	}
	public void setScore(int score) {
		Score = score;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	
	
	
}
