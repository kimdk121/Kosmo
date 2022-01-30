package chapter05;

public class PersonExam {
	
	String name;
	int age;
	String gender; // 남자, 여자
	boolean married;
	int child; // 자식수

	
	public void print() {
		System.out.println("01.나이: " + age);
		System.out.println("02.이름: " + name );
		System.out.println("03.결혼: " + married);
		System.out.println("04.자녀: " + child);
	}
	
}