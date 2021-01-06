package member.bean;

import lombok.Data;

@Data
public class SungJukDTO {
	private int seq;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;
}
