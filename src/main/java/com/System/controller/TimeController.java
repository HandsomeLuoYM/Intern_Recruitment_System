
package com.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.System.model.Msg;
import com.System.model.Time;
import com.System.service.ITimeService;

@Controller
@RequestMapping("/timeController")
public class TimeController {
	
	    private ITimeService timeService;
	    

	    public ITimeService getTimeService() {
			return timeService;
		}
	    
		@Autowired
		public void setTimeService(ITimeService timeService) {
			this.timeService = timeService;
		}

		/**
	     * 查询所有时间段
	     * */
	    @RequestMapping(value="/queryAllTime",method=RequestMethod.POST)
	    @ResponseBody 
	    public Msg quallAllTime(@RequestParam(value = "typeId") String typeId){
	    	int type = Integer.parseInt(typeId);
	        List<Time> times = timeService.queryAllTime(type);
	        return Msg.success().add("times", times);
	    }

	    /**
	     * 插入时间段
	     * */
	    @RequestMapping(value="/insertTime",method=RequestMethod.POST)	 
	    @ResponseBody 
	    public Msg insertTime(Time time){
	    	time.setType(1);
	        timeService.insertTime(time);
	        return Msg.success();
	    }
	    
	    /**
	     * 时间段增加人数
	     * */
	    @RequestMapping(value="/enterExam/{id}",method=RequestMethod.POST)	 
	    @ResponseBody 
	    public Msg enterExam(@PathVariable("id")Integer id) {
	    	timeService.enterExam(id);
			return Msg.success();
	    	
	    }
	    
	    /**
	     * 删除用户时若已经报名
	     * */
	    @RequestMapping(value="/deleteUser/{ids}",method=RequestMethod.POST)	 
	    @ResponseBody 
	    public Msg deleteUse(@PathVariable("ids")String ids) {
	    	if(ids.contains("-")) {
	    		String[] str_ids = ids.split("-");
	    		for(String str_id : str_ids) {
	        		Integer id = Integer.parseInt(str_id);
	           	 	timeService.deleteUser(id);
	    		}
	    	}else {
	    		Integer id = Integer.parseInt(ids);
	    		System.out.println(id);
	       	 	timeService.deleteUser(id);
	    	}
	     	return Msg.success();
	    }
	    
	    /**
	     * 完善表格学习所选的时间段
	     * */
	    @RequestMapping(value="/timeUser/{id}",method=RequestMethod.POST)	 
	    @ResponseBody 
	    public Msg userTime(@PathVariable("id")String id) {
	    	int timeId = Integer.parseInt(id);
	    	if(timeId!=0) {
		    	Time time = timeService.userTime(timeId);
		    	return Msg.success().add("time", time);
	    	}
	    	return Msg.success();
	    }
	   
	    /**
	     * 插入面试时间段
	     * */
	    @RequestMapping(value="/insertInterviewTime",method=RequestMethod.POST)	 
	    @ResponseBody 
	    public Msg insertInterviewTime(Time time){
	    	time.setType(2);
	        timeService.insertTime(time);
	        return Msg.success();
	    }
}
