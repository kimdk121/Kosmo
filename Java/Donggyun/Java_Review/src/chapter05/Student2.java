package chapter05;

public class Student2 {
	
	// 변수(필드)
	// 필드 : 가능하면 private 선언
	
	int age;
	
	String name;
	
	private String address;
	

	public Student2() {
		//this.age = 0;
		//this.name = "";
		
		this("", 0);
	}
	// this 사용이유. 클래스의 변수 이용할때
	public Student2(String n, int age) {
		//age = age;
		this.age = age;
		name = n;
	}
	
	public Student2(String n, int age, String adr) {
		this.age = age;
		this.name = n;
		this.address = adr;
	}

	// 필드에 접근하는 메서드를 get, set 접두어로
	
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
