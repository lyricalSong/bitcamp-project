package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.SungJukDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl  implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO getLoginInfo(Map<String, Object> map) {
		
		return memberDAO.getLoginInfo(map);
	}

	@Override
	public String checkId(String id) {
		MemberDTO memberDTO = memberDAO.checkId(id);
		if(memberDTO == null)
			return "non_exist";
		else
			return "exist";

	}

	@Override
	public List<ZipcodeDTO> postSearch(Map<String, Object> map) {
		
		return memberDAO.postSearch(map);
	}

	@Override
	public void write(MemberDTO memberDTO) {
		memberDAO.write(memberDTO);
		
	}

	@Override
	public MemberDTO getMember(String id) {
		
		return memberDAO.checkId(id);
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		memberDAO.modify(memberDTO);
		
	}

	@Override
	public void input(SungJukDTO sungJukDTO) {
		memberDAO.input(sungJukDTO);
		
	}

	@Override
	public List<SungJukDTO> output() {
		
		return memberDAO.output();
	}

}
