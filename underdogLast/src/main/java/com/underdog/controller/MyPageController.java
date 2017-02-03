package com.underdog.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.underdog.service.BasketService;
import com.underdog.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Inject
	private MyPageService service;
	@Inject
	private BasketService service2;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 마이페이지 회원정보 보기
	@RequestMapping(value = "/mypage")
//	public String mypage(@RequestParam("me_email") String me_email, Model model, HttpServletRequest req)
//			throws Exception {
	public String mypage(HttpSession session, Model model, HttpServletRequest req,@ModelAttribute("cri") SearchCriteria cri)
			throws Exception {
		//비밀번호 체크 값
		int result = 0;
				
		if (session.getAttribute("result") != null){
		//비밀번호 체크후 결과값
			result = (Integer)session.getAttribute("result");
		}
		logger.info("result 페이지 에서 !"+result);
		
		String jsp = null;
		
		MemberVO vo = (MemberVO)session.getAttribute("MEMBER");	
		System.out.println("me_email값:"+vo.getMe_email());
		
		//페이징 만들기 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//페이지 총 수 가져오기
		int totalCount = service.boardCount(vo.getMe_email());
		System.out.println("총게시글수"+totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		//페이징 처리
		model.addAttribute("pageMaker",pageMaker);
		
		cri.setBo_me_email(vo.getMe_email());
		List<BoardVO> list =  service.myboardInfo(cri);
		
		//마이 페이지 내가 쓴글 가져오기
		model.addAttribute("myboardList",list);	
		
		
		//mypage 장바구니 정보 가져오기 (세종 추가_2017.02.03)
		model.addAttribute("basket", service2.basket(vo.getMe_email()));
		
			
		System.out.println("쎄션 me_email:" + vo.getMe_email());
		//본인 회원 정보
		model.addAttribute("memberInfo", service.memberInfo(vo.getMe_email()));
		//비밀번호 체크 결과값 보내기
		model.addAttribute("result", result);
		logger.info(service.memberInfo(vo.getMe_email()).getMe_regdate().toString());
		
	
		jsp = "/mypage/mypage";
		logger.info("mypage - 마이페이지폼 이동");

		return jsp;

	}

	// 마이페이지 회원 비밀번호 체크
	@RequestMapping(value = "/pwcheck")
	public String pwcheck(Model model, @RequestParam("me_pw") String me_pw, HttpSession session)
			throws Exception {
		int result = 0;
		String jsp = null;
		
		
		MemberVO vo = (MemberVO)session.getAttribute("MEMBER");
		
		System.out.println("입력되 me_pw 값:" + me_pw);
		System.out.println("입력된 me_email 값:" + vo.getMe_email());
		

		result = service.pwcheck(vo.getMe_email(), me_pw);
		session.setAttribute("result", result);
//		model.addAttribute("result", result);
//		model.addAttribute("me_email", me_email);
		jsp = "redirect:/mypage/mypage";
		
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
