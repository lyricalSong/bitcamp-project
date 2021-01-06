package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.SungJukDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	
	//로그인
	@RequestMapping(value="login",method=RequestMethod.POST)
	public @ResponseBody String login(@RequestParam Map<String,Object> map, HttpSession session,Model model) {
		
		MemberDTO memberDTO = memberService.getLoginInfo(map);
		
		String loginFail = null;
		if(memberDTO == null) {
			loginFail="fail";
			session.setAttribute("memId", null);
		}else {
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			loginFail="success";
		}
		


		return loginFail;
	}
	
	/*
	 * @RequestMapping(value="logout",method=RequestMethod.GET) public String
	 * logout(HttpSession session,Model model) { session.invalidate();
	 * 
	 * model.addAttribute("display","/template/body.jsp"); return "/main/index"; }
	 */
	
	//로그아웃
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session,Model model) {
		session.invalidate();

		return new ModelAndView("redirect:/main/index");
	}
	
	//writeForm.jsp으로 감
	@RequestMapping(value="writeForm",method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/main/index";
	}
	
	//중복아이디 체크
	@RequestMapping(value="checkId",method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id) {
	
		
		return memberService.checkId(id);
	}
	
	//우편번호 창에 checkpost.jsp 띄우기
	@RequestMapping(value="checkPost",method=RequestMethod.GET)
	public String checkPost() {
		
		return "checkPost";
	}
	//우편번호 리스트 갖고오기
	@RequestMapping(value="postSearch",method=RequestMethod.POST)
	public ModelAndView postSearch(@RequestParam Map<String,Object> map) {
		List<ZipcodeDTO> list = null;
		list = memberService.postSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//회원가입
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String wirte (@ModelAttribute MemberDTO memberDTO,Model model) {
		memberService.write(memberDTO);
		
		model.addAttribute("display", "/member/write.jsp");
		return "/main/index";
	}
	//정보수정 창
	@RequestMapping(value="modifyForm",method=RequestMethod.GET)
	public String modifyForm(HttpSession session,Model model) {
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.getMember(id);
		
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/main/index";
	}
	//정보수정	
	@RequestMapping(value="modify",method=RequestMethod.POST)
	public @ResponseBody void modify (@ModelAttribute MemberDTO memberDTO) {
		System.out.println(memberDTO.getName());
		memberService.modify(memberDTO);
		
	}
	
	
//===============================================================================================================	
	
	@RequestMapping(value="inputForm", method=RequestMethod.GET)
	public String inputForm() {
		return "/member/inputForm";
	}
	@ResponseBody
	@RequestMapping(value="input", method=RequestMethod.POST)
	public void input(@ModelAttribute SungJukDTO sungJukDTO) {
		int tot = sungJukDTO.getKor() + sungJukDTO.getKor() + sungJukDTO.getMath();
		sungJukDTO.setTot(tot);
		sungJukDTO.setAvg(tot/3);
		memberService.input(sungJukDTO);
	}
	
	@RequestMapping(value="outputForm", method=RequestMethod.GET)
	public String outputForm() {
		return "/member/output";
	}
	
	@RequestMapping(value="output", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView output() {
	
		List<SungJukDTO> list = memberService.output();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	

}
