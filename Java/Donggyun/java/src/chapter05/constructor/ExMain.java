package chapter05.constructor;

public class ExMain {

	public static void main(String[] args) {
	
		Circle1 c1 = new Circle1("νΌμ", 10.0);
		Circle1 c2 = new Circle1("λλ", 2.0);
		
		System.out.println( c1.name + ": " + c1.getArea() ); 
		
		

	}

}