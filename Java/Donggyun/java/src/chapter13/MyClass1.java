package chapter13;

public class MyClass1 {
	
	class MyInnerClass{
	
//		static int age;
//		이너클래스에는 static 불가
//		public static void test() {
//		}
//		final static은 가능
		static final int age = 0;
		
		
	}

	public void test() {
		
		MyInnerClass in = new MyInnerClass();
		
	}
}
