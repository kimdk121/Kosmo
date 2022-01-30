package chapter05.constructor;

public class Rectangle {
	
	String name;
	float height;
	float weight;
	
	public Rectangle() {
		
		height = 0;   // 기본값.
		weight = 0;
		
		System.out.println("Rectangle 생성자" + 
				"w: " + weight + "   h:" + height);
	}
	
	// 2 매개변수 생성자
	public Rectangle(String n) {
		name = n;
		System.out.println(name + ": " + 
				"w: " + weight + "   h:" + height);
	}
	
	public Rectangle(String n, float w, float h) {
		name = n;
		weight = w;
		height = h;
		
		System.out.println(name + ": " + 
				"w: " + weight + "   h:" + height);	
	}
	
}