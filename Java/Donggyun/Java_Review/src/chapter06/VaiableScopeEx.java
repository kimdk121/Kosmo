package chapter06;

public class VaiableScopeEx {
	
	// 변수/식별자/객체
	// 멤버 변수 == 인스턴스 변수 == 클래스 변수
	int a = 0;
	int b = a;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public void test() {
		this.a = 10;
	}
	// 지역변수 : 메서드 내부에서 선언된 변수.
	// - 메서드의 매개변수
	public void local(String a, int b) {
		int c = 10;
		c = b + 100;
	}

}
