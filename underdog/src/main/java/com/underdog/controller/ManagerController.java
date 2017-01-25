
package com.underdog.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.underdog.domain.MemberVO;
import com.underdog.service.ManagerService;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	private ManagerService service;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 관리자 모드 페이지 이동
	@RequestMapping(value = "/manager")
	public String manager() throws Exception {
		logger.info("관리자 폼");
		return "/manager/manager";
	}

	// 관리자 모드 회원 정보 가져오기
	@RequestMapping(value = "/memberGet")
	public String members(Model model) throws Exception {
		logger.info("회원 정보 가져오기");
		String jsp = null;
		List<MemberVO> members = service.members();
		model.addAttribute("members", members);

		jsp = "/manager/ma_members";
		return jsp;
	}

}
