package chapter05.constructor;

public class Rectangle2 {
	
	String name;
	float height;
	float width;
	
	public Rectangle2() {	}
	
	public Rectangle2(String n, float w, float h) {
		name = n;
		width = w;
		height = h;
		
		System.out.println(name + ": " + 
				"w: " + width + "   h:" + height);	
	}
	
	// method
	public float getArea() {
		float result = width * height;
		return result;
	}
	
}