package chapter13;

public class InnerClassExample2 {
	
	static class InnerClass {
		static String keyword = "STATIC INNER";
		
		public void info() {
			System.out.println("Inner.info()");
		}
		public static void printName() {
			System.out.println("Inner.printName()");
		}
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InnerClassExample2.InnerClass inner = new InnerClassExample2.InnerClass();
		
		System.out.println("keyword : " + InnerClass.keyword);
		inner.info();
		InnerClass.printName();

	}

}
