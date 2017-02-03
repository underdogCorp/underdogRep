
package com.underdog.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.domain.BoardVO;
import com.underdog.domain.MemberVO;
import com.underdog.domain.PageMaker;
import com.underdog.domain.SearchCriteria;
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

	// 관리자 모드 회원 정보 가져오기+ 페이징 처리
	@RequestMapping(value = "/memberGet")
	public String members(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("ManagerController - MemberGet 입장");
		logger.info("page:" + cri.getPage());
		logger.info("perPageNum:" + cri.getPerPageNum());

		String jsp = null;

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = service.listCountCriteria(cri);
		logger.info("count:" + service.listCountCriteria(cri));
		pageMaker.setTotalCount(totalCount);

		List<MemberVO> me_list = service.listSearchCriteria(cri);

		logger.info("list:" + service.listSearchCriteria(cri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("me_list", me_list);

		jsp = "/manager/ma_members";
		return jsp;
	}

	// 관리자 모드 회원 삭제 처리
	@RequestMapping(value = "/delProc")
	public String delProc(@RequestParam("me_email") String me_email) throws Exception {
		String jsp = null;
		logger.info("ManagerModeController- delProc 입장");
		logger.info("me_email값:" + me_email);
		service.delProc(me_email);
		jsp = "redirect:/manager/memberGet";

		return jsp;
	}

}
