package chapter08;

public class Engineer extends Employee {
	
	// 상속받는 클래스의 생성자는 같이 선언해줘야 한다
	public Engineer(String name) {
		super(name);
	}
	private String skillset;
	public String getSkillSet() {
		return skillset;
	}
	public void setSkillSet(String skillset) {
		this.skillset = skillset;
	}
}
