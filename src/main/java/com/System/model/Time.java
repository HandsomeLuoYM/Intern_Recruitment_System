package com.System.model;

public class Time {
	
	private int id ;
	private String begin_time;
	private String over_time;
	private int all_number;
	private int now_number;
	private int type;
	
	public Time() {
		super();
		// TODO 自动生成的构造函数存根
	}

	
	
	public Time(int id, String begin_time, String over_time, int all_number, int now_number, int type) {
		super();
		this.id = id;
		this.begin_time = begin_time;
		this.over_time = over_time;
		this.all_number = all_number;
		this.now_number = now_number;
		this.type = type;
	}



	public Time(String begin_time, String over_time, int all_number, int now_number) {
		super();
		this.begin_time = begin_time;
		this.over_time = over_time;
		this.all_number = all_number;
		this.now_number = now_number;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBegin_time() {
		return begin_time;
	}

	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}

	public String getOver_time() {
		return over_time;
	}

	public void setOver_time(String over_time) {
		this.over_time = over_time;
	}

	public int getAll_number() {
		return all_number;
	}

	public void setAll_number(int all_number) {
		this.all_number = all_number;
	}

	public int getNow_number() {
		return now_number;
	}

	public void setNow_number(int now_number) {
		this.now_number = now_number;
	}

	@Override
	public String toString() {
		return "Time [id=" + id + ", begin_time=" + begin_time + ", over_time=" + over_time + ", all_number="
				+ all_number + ", now_number=" + now_number + ", type=" + type + "]";
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
