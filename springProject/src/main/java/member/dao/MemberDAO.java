package member.dao;

import java.util.List;
import java.util.Map;

import member.bean.MemberDTO;
import member.bean.SungJukDTO;
import member.bean.ZipcodeDTO;

public interface MemberDAO {

	public MemberDTO getLoginInfo(Map<String, Object> map);

	public MemberDTO checkId(String id);

	public List<ZipcodeDTO> postSearch(Map<String, Object> map);

	public void write(MemberDTO memberDTO);

	public void modify(MemberDTO memberDTO);

	public void input(SungJukDTO sungJukDTO);

	public List<SungJukDTO> output();

}
