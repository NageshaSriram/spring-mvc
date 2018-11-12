package com.s360.chatbot.controller;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.s360.chatbot.rest.client.TataSkyChatBotRestClient;

@RestController
@RequestMapping("/tatasky")
public class TataSkyChatBotController {
	
	private static final Logger LOG = Logger.getLogger(TataSkyChatBotController.class);
	@Autowired
	TataSkyChatBotRestClient tataSkyChatBotRestClient;
	
	@RequestMapping("/")
	public ModelAndView chatbot() {
		ModelAndView mv = new ModelAndView("tataskychatbot");
		return mv;
	}
	@RequestMapping(value="/reply")
	@ResponseBody
	public Object reply(@RequestParam(value = "user", required = false, defaultValue = "s360") String name,
			@RequestParam(value = "option", required = false, defaultValue = "0") Long option) {
		LOG.debug("inside TataSkyChatBotController::reply()");
		LOG.info("inside TataSkyChatBotController::reply()");
		LOG.error("inside TataSkyChatBotController::reply()");
		return tataSkyChatBotRestClient.getReply(name,option);
	}
	
	@RequestMapping(value="/download")
	@ResponseBody
	public Workbook download() {
		LOG.debug("inside TataSkyChatBotController::download()");
		return tataSkyChatBotRestClient.download();
	}
}
