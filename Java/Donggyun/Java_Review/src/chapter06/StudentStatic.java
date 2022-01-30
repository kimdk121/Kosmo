package chapter06;

public class StudentStatic {
	
	public static int count = 0;
	
	private String name;
	private int grade;
	private int money;
	
	public StudentStatic() {
		this("", 0);
	}
	
	public StudentStatic(String name, int money) {
		this.money = money;
		this.name = name;
	}
	
	// static에는 this 안씀
	public static int getCount() {
		return count;
	}
	
	public static void setCount(int i) {
		//name = "";
		StudentStatic.count += i;
	}

}
