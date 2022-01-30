package chapter05.constructor;

public class Student {
	private String studentName;

	private int grade;
	
	protected String address;
	
	int studentId;
	
	public int score;

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	
/*	public void setStudentName(String n) {
		this.studentName = n;
	}
	public String getStudentName() {
	return this.studentName;
	}
*/
	public String showStudentInfo() {
		// 이름/아이디/주소
		String info = studentName + "/" + studentId + "/" + address;
		return info;
	}
	

	public void println() {
		String info = studentName + "/" + studentId + "/" + address;
		System.out.println(info);
	}

	public String setScore(int score) {
		score = score;
		String info = showStudentInfo();
		return info + " / score=" + score;
	}
	

}
