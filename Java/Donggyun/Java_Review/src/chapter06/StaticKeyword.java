package chapter06;

public class StaticKeyword {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// static keyword
		// - 정적변수
		// - 공유되는 공간에 단 하나의 이름만 등록.
		// ClassName.static_field
		// static을 쓰면 메서드에서나 클래스에서나 쓸수있음

		StudentStatic.count += 1;
		
		// static 자료형, 메서드, 클래스
		StudentStatic st1 = new StudentStatic();
		//st1.count += 1;
		StudentStatic.count += 1;
		StudentStatic st2 = new StudentStatic();
		st2.count += 2;
		StudentStatic st3 = new StudentStatic();
		st3.count += 2;
		
		StudentStatic.setCount(10);
		//System.out.println("count : " + StudentStatic.count);
		System.out.println("count : " + StudentStatic.getCount());

	}

}
