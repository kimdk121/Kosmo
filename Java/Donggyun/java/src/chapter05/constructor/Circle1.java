package chapter05.constructor;

public class Circle1 {
	
	String name;
	double radius;
	
	public Circle1() {	}
	
	public Circle1(String n, double r) {
		name = n;
		radius = r;
	}
	
	// method
	public double getArea() {
		double result = radius * radius * 3.14;
		return result;
	}
	
}