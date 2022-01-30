package chapter05;

public class MethodClass {
	
	public int add(int i1, int i2) {
		int result;
		result = i1 + i2;
		return result;
		
//		return i1 + i2;
	}
	
	public int getTenTotal() {
		return 10*10;
	}
	
	public void printTenTotal() {
		int total = getTenTotal();
		System.out.println(total);
	}
	
	public void printGreeting(String name) {
		System.out.println(name + " Hello...");
		return;
	}
	
	public void divide(int num1, int num2) {
		if(num2 == 0) {
			System.out.println("0일수 없음");
			return;
		}
		else {
		}
	}
}