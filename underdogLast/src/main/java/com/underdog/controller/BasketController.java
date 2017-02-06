package com.underdog.controller;

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

import com.underdog.service.BasketService;

@Controller
@RequestMapping("/basket/*")
public class BasketController {

	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);

	@Inject
	private BasketService service;
	
	// 장바구니 조회
	@RequestMapping(value = "/view")
	public String view(@RequestParam("me_email") String me_email, Model model, HttpServletRequest req) throws Exception{
		
		int result = 0;
		if (req.getParameter("result") != null){
			result = Integer.parseInt(req.getParameter("result"));
		}
		
		String jsp = null;
		System.out.println("쎄션 me_email:" + me_email);
		
		model.addAttribute("basket", service.basket(me_email));
		model.addAttribute("result", result);
//		logger.info(service.basket(me_email).getBa_regdate().toString());
		
		jsp = "/basket/basket_read";
		logger.info("basket - 장바구니 조회 페이지로 이동");
		
// 굳이 여기서 로그로 확인할 필요 없음.(메모리 주소 밖에 안나옴) view단에서 출력해서 확인하면 됨.(바보야)
//		logger.info(service.basket(me_email).toString());
		
		return jsp;
	}
	
	
	// 장바구니 삭제
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("me_email") String me_email, @RequestParam("ba_pr_idx") String ba_pr_idx, Model model) throws Exception{

		
		String jsp = null;
		System.out.println("쎄션 me_email:" + me_email);
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("me_email", me_email);
		param.put("ba_pr_idx", ba_pr_idx);
		
		//model.addAttribute("delete", service.delete(param));
		service.delete(param);
		
		jsp = "redirect:/basket/view?me_email=" + param.get("me_email");
		logger.info("basket - 장바구니 삭제 완료");
		
		return jsp;
	}
	
	
}
