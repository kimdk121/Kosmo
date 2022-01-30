package chapter05;

public class ClassNewReference {
	// copy by Value
	// 처음값과 다음에 선언한 값이 달라짐
	public void copybyvalue(int num, boolean b) {
		num = 100;
		b = false;
		System.out.println("method -> num : " + num + ", b: " + b);
	}
	// copy by Reference
	// method와 main의 값이 같은 방향을 가리키고 있음
	public void copyByReference(Student student) {
		student.name = "고길동";
		System.out.println("method -> name : " + student.name);
	}
	// 메소드 이름을 같게 (오버라이딩)
	public void copyByReference(String str2) {
		str2 = "고길동";
		System.out.println("method -> str : " + str2);
	}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 자료형 : 기본자료형, 객체 ( 클래스, 배열, Enum)
		
		// 객체 자료형 (배열, 클래스, ..) = new  //스트링은 예외
		int[] a = new int[10];
		Student student = new Student();
		student.name = "홍길동";
		String str = "";
		String str2 = new String("안녕");

		// 기본자료형 : int, float, boolean..
		int num =10;// 리터럴 // new int();
		boolean b = true;
		
		ClassNewReference test = new ClassNewReference();
		test.copybyvalue(num, b);
		test.copyByReference(student);
		test.copyByReference(str2);
		
		
		Student student2 = new Student();
		System.out.println("student2 " + student2);
		student2 = student;
		System.out.println("student " + student);
		System.out.println("student2 " + student2);
		
		System.out.println("main -> num : " + num + ", b : " + b);
		System.out.println("main -> name : " + student.name);
		System.out.println("main -> str : " + str2);
		
	}
	// 객체 Object : 코드 상의 객체, 설계/분석 상의 객체
	// 클래스 : 현실 세계 객체의 특성/기능 코드 묘사한 것.
	// 인스턴스 : new 연산한 클래스 변수 (코드 상의 객체)
	// 멤버 : 클래스의 구성 요소 ( 속성/필드, 메서드(기능))
	// 메서드
	// 참조변수 : 객체가 인스턴스를 가르키는 식별자 (변수)
	// 참조값 : 객체 값. hashcode
}
