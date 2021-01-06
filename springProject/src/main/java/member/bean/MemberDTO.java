package member.bean;

import lombok.Data;

@Data
public class MemberDTO {
	private String name;
	private String id;
	private String pwd;
	private String gender; 
	private String email1,email2; 
	private String tel1,tel2,tel3;
	private String zipcode,addr1,addr2;
}
