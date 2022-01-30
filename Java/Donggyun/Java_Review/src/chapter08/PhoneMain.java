package chapter08;

public class PhoneMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Phone phone1 = new Phone("전화", "붉은색", "111111");
		phone1.powerOn();
		phone1.ring();
		phone1.send();
		phone1.powerOff();
		
		VideoPhone phone2 = new VideoPhone("영상전화", "노랑", "11112");
		phone2.powerOn();
		phone2.ring();
		phone2.send();
		phone2.videoCall();
		phone2.powerOff();
				
		// 코드를 재사용 하기위해 상속을 함
		
		Phone phone3 = new VideoPhone(); // Up - Casting (Auto-Boxing)
		// phone3.videoCall();
		((VideoPhone)phone3).videoCall(); // Down - Casting
		
		Phone phone4 = new Phone("전화", "붉은색", "111111");
		// Runtime Error 발생
		//((VideoPhone)phone4).videoCall();
		
	}
	
}
