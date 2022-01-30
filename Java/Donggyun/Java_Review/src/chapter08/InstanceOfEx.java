package chapter08;

public class InstanceOfEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Phone phone1 = new VideoPhone();
		if(phone1 instanceof VideoPhone) {
			System.out.println("phone1 OK Videophone");
		}
		//phone1.videaCall();
		((VideoPhone)phone1).videoCall(); // 다운캐스팅
		
		if(phone1 instanceof Phone) {
			System.out.println("phone1 OK phone");
		} //phone1이 phone인가
		
		VideoPhone phone3 = new VideoPhone();
		if(phone3 instanceof VideoPhone) {
			System.out.println("phone3 OK phone");
		} //phone3이 videophone인가

		
		
		
		Phone phone2 = new Phone("","","");
		if(phone2 instanceof VideoPhone) {
			System.out.println("phone2 OK Videophone");
		}
		//((VideoPhone)phone2).videoCall(); // compile time X
		
		if(phone2 instanceof Phone) {
			System.out.println("phone2 OK phone");
		} //phone2이 phone인가

	}

}
