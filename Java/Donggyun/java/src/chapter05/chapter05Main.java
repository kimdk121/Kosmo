package chapter05;

import chapter05.info.Person;

public class chapter05Main {
	
	public static void main(String[] args) {
		
		// 다른 패키지.
		chapter08.Student st3 = new chapter08.Student();

		Person p = new Person();
		
		
		Student st = new Student(); // kr.java.chapter5
		// kr.java.chapter5.Student st2;
		
		
		// . operator
		st.studentId = 1000;
		st.studentName = "홍길동";
		
		// 사용
		System.out.println(st.studentName);
		// 학생정보
		// st.studentName + st.studentId + st.address;
		
		// 2. 반환형식 있다.
		String info = st.showStudentInfo();
		System.out.println(info);
		
		System.out.println( st.showStudentInfo() );

		// 3. 반환형식 없다.
		st.println();
		
		// 4. 매개변수
		info = st.setScore(1000);
		System.out.println(info);

		st.setScore2(1000);
		
		System.out.println( st.showStudentInfo() );

		
				
	}

}