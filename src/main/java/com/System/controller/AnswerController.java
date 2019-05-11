package com.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.System.model.Answer;
import com.System.model.Msg;
import com.System.service.IAnswerService;

@Controller
@RequestMapping("/answerController")
public class AnswerController {

	 private IAnswerService answerService;

	public IAnswerService getAnswerService() {
		return answerService;
	}

	@Autowired
	public void setAnswerService(IAnswerService answerService) {
		this.answerService = answerService;
	}
	
	/**
	 * 用户填写填空题答案
	 * */
	@RequestMapping(value="/insertAnswer",method=RequestMethod.POST)
	@ResponseBody
	public Msg insertAnswer(
			@RequestParam("Content") String Content,
			@RequestParam("Problem") String Problem,
			@RequestParam("UserId") Integer UserId,
			@RequestParam("Score") Integer Score
			) {
		answerService.insertAnswer(Content,Problem,UserId,Score);
		return Msg.success();
	}
	
	/**
	 * 查询所有未批改的
	 * */
	@RequestMapping(value="/qurryAll",method=RequestMethod.POST)
	@ResponseBody
	public Msg qurryAll() {
		List<Answer> answerList = answerService.qurryAll();
		return Msg.success().add("answerList", answerList);
	}	
	
	/**
	 * 改试卷的操作
	 * */
	@RequestMapping(value="/markTest",method=RequestMethod.POST)
	@ResponseBody
	public Msg markTest(@RequestParam(value="StemId") Integer id) {
		answerService.ChangeStatus(id);
		return Msg.success();
	}
	
	
}
