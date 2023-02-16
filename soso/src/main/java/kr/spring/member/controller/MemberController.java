package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	 
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	
	
	//========회원가입
	//아이디 중복 체크
	@RequestMapping("/member/confirmId.do")
	@ResponseBody
	public Map<String, String> process(@RequestParam String mem_id){
		logger.debug("<<mem_id>>" + mem_id);
		
		Map<String, String> mapAjax = new HashMap<String, String>();
		
		MemberVO member = memberService.selectCheckMember(mem_id);
		
		if(member!=null) {
			mapAjax.put("result", "idDuplicated");
		}else {
			if(!Pattern.matches("^[A-Za-z0-9]{4,12}$",mem_id)) {
				//패턴 불일치
				mapAjax.put("result", "notMatchPattern");
			}else {
				//패턴 일치 아이디 미중복
				mapAjax.put("result", "idNotFound");
			}
		}
		//자동으로 JSON 문자열로 출력
		return mapAjax;
	}
	
	//회원등록 폼 호출
	@GetMapping("/member/registerUser.do")
	public String form() {
		return "memberRegister";
	}
	//회원가입 데이터 전송
	@PostMapping("/member/registerUser.do")
	public String submit(@Valid MemberVO memberVO, BindingResult result, Model model) {
		logger.debug("<<회원가입>> : " + memberVO);
		
		if(result.hasErrors()) {
			return form();
		}
		
		memberService.insertMember(memberVO);
		
		model.addAttribute("accessMsg","회원가입이 완료되었습니다.");
		
		return "common/notice";
	}
	
	//========회원로그인
	//로그인 폼 호출
	@GetMapping("/member/login.do")
	public String formLogin() {
		return "memberLogin";
	}
	
	//로그인 폼에 전송된 데이터 처리
	@PostMapping("/member/login.do")
	public String submitLogin(@Valid MemberVO memberVO, BindingResult result, HttpSession session, HttpServletResponse response) {
		logger.debug("<<회원로그인>> : " + memberVO);

		if(result.hasFieldErrors("mem_id") || result.hasFieldErrors("mem_pw")) {
			return formLogin();
		}

		MemberVO member = null;
		try {
			member = memberService.selectCheckMember(memberVO.getMem_id());
			boolean check = false;

			if(member!=null) {
				check = member.isCheckedPassword(memberVO.getMem_pw());

			}
			if(check) {
				boolean autoLogin = memberVO.getMem_auto() != null && memberVO.getMem_auto().equals("on");
				if(autoLogin) {
					String mem_au_id = member.getMem_au_id();
					if(mem_au_id==null) {
						mem_au_id = UUID.randomUUID().toString();
						logger.debug("<<mem_au_id>> : " + mem_au_id);
						memberService.updateAu_id(mem_au_id, memberVO.getMem_id());
					}

					Cookie auto_cookie = new Cookie("au-log",mem_au_id);

					auto_cookie.setMaxAge(60*60*24*7);
					auto_cookie.setPath("/");

					response.addCookie(auto_cookie);
				}

				session.setAttribute("user", member);

				logger.debug("<<인증성공>> : " + member.getMem_id());

				if(member.getMem_auth() == 9) {
					return "redirect:/main/admin.do";
				}else {
					return "redirect:/main/main.do";
				}
			}
			throw new AuthCheckException();

		}catch (AuthCheckException e) {
			if(member!=null && member.getMem_auth()==1) {
				//정지회원 메서드 표시
				result.reject("noAuthority");
			}else{
				result.reject("invalidIdOrPassword");
			}
			logger.debug("<<인증실패>>");

			return formLogin();
		}
	}
	
	//========회원로그아웃
	@RequestMapping("/member/logout.do")
	public String processLogout(HttpSession session, HttpServletResponse response) {
		
		session.invalidate();
		
		Cookie auto_cookie = new Cookie("au-log", "");
		auto_cookie.setMaxAge(0);//쿠키 유효기간 만료
		auto_cookie.setPath("/");
		
		response.addCookie(auto_cookie);
		
		return "redirect:/main/main.do";
	}
	
	
}
