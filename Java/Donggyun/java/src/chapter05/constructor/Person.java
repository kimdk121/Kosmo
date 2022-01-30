package chapter05.constructor;

public class Person {
	
	String name;
	float height;
	float weight;
	
	public Person() {
		
		height = 0;   // 기본값.
		weight = -1;
		
		System.out.println("Person 생성자" + 
				"w: " + weight + "   h:" + height);
	}
	
	// 2 매개변수 생성자
	public Person(String n) {
		name = n;
		System.out.println(name + ": " + 
				"w: " + weight + "   h:" + height);
	}
	
	public Person(String n, float w, float h) {
		name = n;
		weight = w;
		height = h;
		
		System.out.println(name + ": " + 
				"w: " + weight + "   h:" + height);
	}
	
	
	
	
	
	
	
	
	
	

}