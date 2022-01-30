package chapter05.constructor;

public class StudentMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student lee = new Student();
//직접	lee.studentName = "홍길동";
		
//간접		
		lee.setStudentName("이상원");
		System.out.println(lee.getStudentName());

	}

}
