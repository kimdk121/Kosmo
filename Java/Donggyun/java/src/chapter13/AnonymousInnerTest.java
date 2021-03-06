package chapter13;

class Outer2 {
	
	int outNum = 100;
	static int sNum = 200;
	
	Runnable getRunnable(int i) {
		int num = 100;
		
		return new Runnable() {
			
			int localNum = 10;
			
			@Override
			public void run() {
				System.out.println("i = " + i);
				System.out.println("num = " + num);
				System.out.println("localNum = " + localNum);
				
				System.out.println("outNum = " + outNum + "(외부 클래스 인스턴스 변수)");
				System.out.println("Outer.sNum = " + Outer.sNum + "(외부 클래스 정적 변수)");
			}
		};
		//return new MyRunnable();
	}
}

public class AnonymousInnerTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Outer2 out = new Outer2();
		Runnable runner = out.getRunnable(10);
		runner.run();

	}

}
