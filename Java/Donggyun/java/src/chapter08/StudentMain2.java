package chapter08;

public class StudentMain2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		Student2 student = new Student2();
		student.studentName = "홍길동";
		student.grade = 3;
//		student.subj = new Score2();
//		student.subj.subject = "수학";
//		student.subj.score = 100;
		
		System.out.println(student.toString());
		System.out.println(student);

	}

}
