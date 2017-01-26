package com.underdog.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Inject
	private MyPageService service;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 마이페이지 회원정보 보기
	@RequestMapping(value = "/mypage")
	public String mypage(@RequestParam("me_email") String me_email, Model model, HttpServletRequest req)
			throws Exception {
		//비밀번호 체크 값
		int result = 0;
		if (req.getParameter("result") != null)
		//비밀번호 체크후 결과값
			result = Integer.parseInt(req.getParameter("result"));
		
		String jsp = null;
		System.out.println("쎄션 me_email:" + me_email);
		//본인 회원 정보
		model.addAttribute("memberInfo", service.memberInfo(me_email));
		//비밀번호 체크 결과값 보내기
		model.addAttribute("result", result);
		logger.info(service.memberInfo(me_email).getMe_regdate().toString());
		
	//마이 페이지 내가 쓴글 가져오기
		model.addAttribute("myboardList",service.myboardInfo(me_email));
		
		
		
		
		
		jsp = "/mypage/mypage";
		logger.info("mypage - 마이페이지폼 이동");

		return jsp;

	}

	// 마이페이지 회원 비밀번호 체크
	@RequestMapping(value = "/pwcheck")
	public String pwcheck(Model model, @RequestParam("me_pw") String me_pw, @RequestParam("me_email") String me_email)
			throws Exception {
		int result = 0;
		String jsp = null;
		System.out.println("입력되 me_pw 값:" + me_pw);
		System.out.println("입력된 me_email 값:" + me_email);
		System.out.println("반환된 pw result 값:" + result);

		result = service.pwcheck(me_email, me_pw);

		if (result == -1) {
			System.out.println("비밀번호가 다릅니다");
			jsp = "index";
			model.addAttribute("result", result);
		} else if (result == 1) {
			System.out.println("비밀번호 체크 성공");
			jsp = "redirect:/mypage/mypage?result=" + result + "&me_email=" + me_email;
		}

		return jsp;
	}

	// 마이페이지 수정 하기
	@RequestMapping(value = "/modifyProc")
	public String modifyProc(@RequestParam HashMap <String,String> data) throws Exception {
		System.out.println("마이페이지 수정하기 진입");
		service.modifyProc(data);
		String jsp = "redirect:/mypage/mypage?me_email="+data.get("me_email");
		return jsp;
	}
	
	
	
	
	

}
