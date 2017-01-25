
package com.underdog.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.underdog.service.ManagerService;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	private ManagerService service;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);


	@RequestMapping(value = "/manager")
	public String manager() throws Exception {
		logger.info("관리자 폼");
		return "/manager/manager";
	}

}
