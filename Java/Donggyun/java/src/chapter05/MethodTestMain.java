package chapter05;

public class MethodTestMain {

	public static void main(String[] args) {
		
		MethodClass m = new MethodClass();
		
		m.add(10, 100);
		
		m.printTenTotal();
		
		m.getTenTotal();
		
		m.printGreeting("hahaha");
		
		m.divide(100, 1);

		m.divide(100, 0);
		

	}

}
