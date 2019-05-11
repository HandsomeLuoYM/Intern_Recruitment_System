package com.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.System.model.Exam;
import com.System.model.Msg;
import com.System.service.IExamService;

@Controller
@RequestMapping("/examController")
public class ExamController {
	
	
    private IExamService examService;
    

    public IExamService getExamService() {
		return examService;
	}
    
	@Autowired
	public void setExamService(IExamService examService) {
		this.examService = examService;
	}
	
	/**
	 * 查找所有的题目
	 * */
	@RequestMapping(value="/queryAllExam",method=RequestMethod.GET)
	@ResponseBody
	public Msg quallyExam() {
		 List<Exam> AllExam = examService.qurryAll();
		return Msg.success().add("AllExam", AllExam);
	}
	
	/**
	 * 插入题目
	 * */
	@RequestMapping(value="/insertStem",method=RequestMethod.POST)
	@ResponseBody
	public Msg insertStrm(Exam exam) {
		examService.insertStem(exam);
		return Msg.success();		
	}
	
	/**
	 * 删除题目
	 * */
	@RequestMapping(value="/deleteStem/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg deleteStrm(@PathVariable("id") Integer id) {
		examService.deleteStem(id);
		return Msg.success();
	}
	
	/**
	 * 校验答案
	 * */
	@RequestMapping(value="/checkExam",method=RequestMethod.POST)
	@ResponseBody
	public Msg checkExam(@RequestParam("ids_values")String ids_values) {
		String[] id_value = ids_values.split(",");
		int Score = 0;
		for(String Stem : id_value) {
			String[] idAndanswer = Stem.split("=");
			if(idAndanswer.length>1) {
				Score += examService.checkAnswer(idAndanswer[0],idAndanswer[1]);
			}
		}
		return Msg.success().add("score", Score);
	}
}

