package member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import member.bean.SungJukDTO;
import member.bean.ZipcodeDTO;

@Repository
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO getLoginInfo(Map<String, Object> map) {
		
		return sqlSession.selectOne("memberSQL.getLoginInfo", map);
	}

	@Override
	public MemberDTO checkId(String id) {

		return sqlSession.selectOne("memberSQL.checkId", id);
	}

	@Override
	public List<ZipcodeDTO> postSearch(Map<String, Object> map) {
		
		return sqlSession.selectList("memberSQL.postSearch", map);
	}

	@Override
	public void write(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.write",memberDTO);
		
	}

	@Override
	public void modify(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.modify", memberDTO);
		
	}

	@Override
	public void input(SungJukDTO sungJukDTO) {
		sqlSession.insert("memberSQL.input",sungJukDTO);
		
	}

	@Override
	public List<SungJukDTO> output() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberSQL.output");
	}

}
