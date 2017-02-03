package com.underdog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.service.BasketService;
import com.underdog.service.OrderingService;



	@Controller
	@RequestMapping("/pay/*")
	public class OrderingController {
		
		private static final Logger logger = LoggerFactory.getLogger(OrderingController.class);
		
		@Inject
		private OrderingService service;
		@Inject
		private BasketService service2;
		
		//주문내역 리스트 보기
		@RequestMapping("/read")
		public String read(@RequestParam("me_email") String me_email, Model model, HttpServletRequest req) throws Exception{
			logger.info("OrderingController - list() 입장");

			int result = 0;
			if (req.getParameter("result") != null){
				result = Integer.parseInt(req.getParameter("result"));
			}
			
			String jsp = null;
			System.out.println("쎄션 me_email:" + me_email);
			
			model.addAttribute("basket", service2.basket(me_email));
			model.addAttribute("result", result);
//			logger.info(service.basket(me_email).getBa_regdate().toString());
			
			jsp = "/pay/pay";
			logger.info("pay - 주문내역 페이지로 이동");
			
	// 굳이 여기서 로그로 확인할 필요 없음.(메모리 주소 밖에 안나옴) view단에서 출력해서 확인하면 됨.(바보야)
//			logger.info(service.basket(me_email).toString());
			
			return jsp;
		}

	
}
