package com.s360.chatbot.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.s360.chatbot.rest.client.TataSkyChatBotRestClient;

@RestController
@RequestMapping("/tatasky")
public class TataSkyChatBotController {

	// private static final Logger LOG =
	// Logger.getLogger(TataSkyChatBotController.class);
	@Autowired
	TataSkyChatBotRestClient tataSkyChatBotRestClient;

	@RequestMapping("/")
	public ModelAndView chatbot(@RequestParam(value = "user", required = false, defaultValue = "user") String user) {
		ModelAndView mv = new ModelAndView("tataskychatbot");
		mv.addObject("message", user);
		return mv;
	}

	@RequestMapping("/admin")
	public ModelAndView admin(@RequestParam(value = "user",defaultValue = "user") String user,
			@RequestParam(value = "password", defaultValue = "user") String password) {
		if (user.equalsIgnoreCase("admin") && password.equals("admin")) {
			ModelAndView mv = new ModelAndView("tataskyadmin");
			mv.addObject("message", user);
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("tataskylogin");
			mv.addObject("message", user);
			return mv;
		}
		
	}

	@RequestMapping(value = "/reply")
	@ResponseBody
	public Object reply(@RequestParam(value = "user", required = true, defaultValue = "user") String user,
			@RequestParam(value = "input", required = false, defaultValue = "") String input,
			@RequestParam(value = "code", required = false, defaultValue = "") String code,
			@RequestParam(value = "date", required = false, defaultValue = "") String date,
			@RequestParam(value = "refresh", required = false, defaultValue = "") String refresh) {
		// LOG.info("inside TataSkyChatBotController::reply()");
		return tataSkyChatBotRestClient.getReply(user, input, code, refresh);
	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> uploadFileHandler(@RequestParam("file") MultipartFile file) {

		try {
			return tataSkyChatBotRestClient.fileUpload(file);
		} catch (IOException e) {
		}
		return null;
	}

}
