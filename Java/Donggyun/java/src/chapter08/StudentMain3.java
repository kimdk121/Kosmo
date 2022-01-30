package chapter08;

public class StudentMain3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		// Student2, Score2 이용.
		// -- subj -> 배열.
		
		// 홍길동/구로구/3, 수학 100, 국어 90
		// 고길동/영등포구/3, 수학 70, 국어 80
		
	Student2[] students = new Student2[2];
	students[0].studentName = "홍길동";
	students[0].grade = 3;
	students[0].subj = new Score2[2];
	students[0].subj[0] = new Score2();
	students[0].subj[0].subject = "수학";
	students[0].subj[0].score = 100;
	students[0].subj[0] = new Score2();
	students[0].subj[0].subject = "국어";
	students[0].subj[0].score = 90;
	
	students[1].studentName = "고길동";
	students[1].grade = 3;
	students[1].subj = new Score2[2];
	students[1].subj[0] = new Score2();
	students[1].subj[0].subject = "수학";
	students[1].subj[0].score = 70;
	students[1].subj[0] = new Score2();
	students[1].subj[0].subject = "국어";
	students[1].subj[0].score = 80;
	
	
/*	for(int i = 0; i < students.length; i++) {
		student2 student = students[i];
		System.out.println(student.studentName);
	}
*/	
	for(Student2 student : students) {
		System.out.println(student.studentName);
	}
	
	
	
	
	

	}
}

