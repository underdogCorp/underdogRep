package com.underdog.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.underdog.domain.MemberVO;
import com.underdog.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService mbService;
	private int authNo;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/** 회원가입폼 불러오기
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("joinForm");
		return "/member/member_join";
	}
	
	/** 이메일 중복 체크
	 * @param me_email
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/joinCheckEmail", method = RequestMethod.POST)
	public ResponseEntity<String> joinCheckEmail(String me_email) throws Exception {
		//ResponseEntity<byte[]> entity = null;
		logger.info("joinCheckEmail");
		System.out.println(me_email);
		
		int result = mbService.joinCheckEmail(me_email);
		
		System.out.println(result);
		if (result == 1) {
			return new ResponseEntity<String>("NOT_EMPTY", HttpStatus.OK); //이메일 중복 있음.
		} else {
			return new ResponseEntity<String>("EMPTY", HttpStatus.OK);
		}
	}
	
	/** 회원 가입시 메일로 인증번호 전송
	 * @param me_email
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
	public ResponseEntity<String> sendEmail(String me_email) throws Exception {

		System.out.println("me_email : " + me_email);
		Random random = new Random();
		authNo = random.nextInt(100);
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";		
		String hostSMTPid = "kevin_0811@naver.com";		
		String hostSMTPpwd = "abcd1234";// 비밀번호 입력해야함
		
		// 보내는 사람 EMail, 제목, 내용 
		String fromEmail = "kevin_0811@naver.com";		
		String fromName = "underdog 사이트 관리자";
		String subject = "underdog 사이트 가입 인증메일입니다.";
		
		// 받는 사람 E-Mail 주소
		String mail = me_email;	
		
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);			

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p align = 'center'>underdog 사이트에 오신것을 환영합니다.</p><br><div align='center'>"
					+ "인증번호 : "	+ authNo + "</div>");
			email.send();			
		} catch (Exception e) {
			System.out.println(e);
		}				
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK); //이메일 발송했습니다.
	}

	/** 전송된 인증번호가 유저가 입력한 내용과 맞는지 확인
	 * @param me_email
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/checkAuthNo", method = RequestMethod.POST)
	public ResponseEntity<String> checkAuthNo(String inp_authNo) throws Exception {
		logger.info("checkAuthNo");
		System.out.println("authNo : " + authNo);
		System.out.println("inp_authNo : " + inp_authNo);
		
		if (inp_authNo.equals("" + authNo)) {
			System.out.println("SUCCESS");
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK); //인증번호가 맞음.
		} else {
			System.out.println("FAILED");
			return new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/joinProc", method = RequestMethod.POST)
	public ResponseEntity<String> joinProc(MemberVO mbVO) throws Exception {
		logger.info("joinProc");
		System.out.println("joinProc");
		ResponseEntity<String> entity = null;
		
		int result = mbService.joinProc(mbVO);
		
		if (result == 1) {
			System.out.println("SUCCESS");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); //회원정보가 정상적으로 등록.
		} else {
			System.out.println("FAILED");
			entity =  new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/loginProc", method = RequestMethod.POST)
	public ResponseEntity<String> loginProc(MemberVO mbVO, HttpSession session) throws Exception {
		logger.info("loginProc");
		System.out.println("loginProc");
		ResponseEntity<String> entity = null;
		
		System.out.println(mbVO.getMe_email());
		System.out.println(mbVO.getMe_pw());
		
		MemberVO vo = new MemberVO();
		vo = mbService.loginProc(mbVO);

		if (vo != null) {
			System.out.println("SUCCESS");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK); //정상적으로 로그인
		} else {
			System.out.println("FAILED");
			entity =  new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
}
