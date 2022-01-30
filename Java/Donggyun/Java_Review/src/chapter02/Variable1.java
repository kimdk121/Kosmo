package chapter02;

public class Variable1 {

	// 1. 멤버 필드 (속성, 변수)
	// 자료형 이름;
	// 자료형 이름 = ""; 리터럴 : 자료의 표기 방법
	// 자료형 : 기본자료형, 클래스, 배열, Enum
	char ch; // 선언
	char ch1 = 'a'; // 대입연산자
	
	float f_name;
	float f_name2 = 1.0F; //4바이트 float은 식별자 F 꼭
	double d_name = 1.0; // 8바이트
	
	double d_name3 = Double.MAX_VALUE; // 8바이트
	double d_name4 = Double.MAX_VALUE +1.0;
	
	byte b1 = -128;
	byte b2 = 127;
	
	int i = 10;
	long l = Long.MAX_VALUE;
	long l2 = 10L; // 식별자 L 꼭
	
	
	// 2. 멤버 메소드
	// Modifier [static] 리턴형식 이름(매개변수) { }
	// Modifier : public, protected, package, private
	// 리턴형식 : void, 자료형
	
	public void printinfo(int i) {
		// 코드블럭
	}
	public void printinfo2(int i, long l, short s, byte b) {
		
	}
	public int getNumber() {
		return 0; // 리턴 자료형
	}
	static int k = 100;
	static long ll;

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(k); //static은 static끼리만 불러오기 가능
		
		char ch2;
		char ch3 = 'A';
//		System.out.println(ch2); 값이 없음
		System.out.println(ch3);
		System.out.println(ll);
		
		
	}

}
