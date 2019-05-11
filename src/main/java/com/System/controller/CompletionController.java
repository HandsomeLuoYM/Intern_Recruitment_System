package com.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.System.model.Completion;
import com.System.model.Msg;
import com.System.service.ICompletionService;

@Controller
@RequestMapping("/completionController")
public class CompletionController {

    private ICompletionService completionService;

	public ICompletionService getCompletionService() {
		return completionService;
	}

	@Autowired
	public void setCompletionService(ICompletionService completionService) {
		this.completionService = completionService;
	}
	
	/**
	 * 查询所有题目
	 * */
	@RequestMapping(value="/qurryAll",method=RequestMethod.POST)
	@ResponseBody
	public Msg qurryAll() {
		List<Completion> allCompletion = completionService.qurryAllCompletion();
		return Msg.success().add("completionInfo", allCompletion);
	}
	
	/**
	 * 添加题目
	 * */
	@RequestMapping(value="/insertCompletion",method=RequestMethod.POST)
	@ResponseBody
	public Msg insertCompletion(Completion completion) {
		System.out.println(completion);
		completionService.insertCompletion(completion);
		return Msg.success();
	}
	
	/**
	 * 删除题目
	 * */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg deleteCompletiom(@PathVariable("id")Integer id){
		completionService.deleteCompletion(id);
		return Msg.success();
	}
	
}
