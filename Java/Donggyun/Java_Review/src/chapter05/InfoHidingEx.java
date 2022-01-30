package chapter05;

public class InfoHidingEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 접근제한자 : public > protected > package > private
		Student2 st1 = new Student2();
		st1.name = "홍길동";
//		st1.address = "";
		
		chapter05.Student2 st2 = new chapter05.Student2();
		// package의 가시성
		st2.name = "홍길동";
//		st2.address = "";
		
		
		
	}

}
