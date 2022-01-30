package chapter08;

public class VideoPhone extends Phone {
	
	//상속받은 Phone 클래스에 있는 생성자 형식을 써넣어야함
	public VideoPhone(String m, String c, String n) {
		super(m, c, n); // super : 상위클래스의 생성자 호출
	}
	
	// defualt 생성자가 상속하는 쪽에 있으면
	// super();
	
	// 상속 클래스가 매개변수 생성자가 있으면
	// super(매개변수) 호출
	public VideoPhone() {
		
	}
	
	
	public void videoCall() {
		System.out.println("영상통화");
	}
	
	public void info() {
		String a = super.model;
	}

}
