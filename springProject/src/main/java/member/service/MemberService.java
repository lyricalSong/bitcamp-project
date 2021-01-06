package member.service;

import java.util.List;
import java.util.Map;
import member.bean.MemberDTO;
import member.bean.SungJukDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {

	public MemberDTO getLoginInfo(Map<String, Object> map);

	public String checkId(String id);

	public List<ZipcodeDTO> postSearch(Map<String, Object> map);

	public void write(MemberDTO memberDTO);

	public MemberDTO getMember(String id);

	public void modify(MemberDTO memberDTO);

	public void input(SungJukDTO sungJukDTO);

	public List<SungJukDTO> output();



}
