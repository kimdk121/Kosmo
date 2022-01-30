package chapter08.customer;

public class CustomerMain {

	public static void main(String[] args) {
		
		//Customer customerLee = new Customer(10010, "이순신");
		Customer customerLee = new Customer(0, null);
		customerLee.setCustomerID(10010);
		customerLee.setCustomerName("이순신");
		customerLee.bonusPoint = 1000;

	
		
//		customerLee.calcPrice(1000); /// Customer

		System.out.println(customerLee.showCustomerInfo());

		// 생성자 호출 순서.
		Customer customerKim = new VIPCustomer(10020, "김유신", 12345);
		customerKim.bonusPoint = 1000;
		System.out.println(   customerKim.showCustomerInfo());

		System.out.println( "---- 할인률 보너스 포인트 ----- ");
		
		VIPCustomer t = (VIPCustomer) customerKim;  // 다운캐스팅.

		int price = 10000;
		int leePrice = customerLee.calcPrice(price);
		int kimPrice = customerKim.calcPrice(price);
		
		System.out.println(customerLee.getCustomerName() +" 님이 "
				+ leePrice + "원 지불하셨습니다.");
		System.out.println(customerLee.showCustomerInfo());
		
		
		System.out.println(customerKim.getCustomerName() +" 님이 " 
				+ kimPrice + "원 지불하셨습니다.");
		System.out.println(customerKim.showCustomerInfo());
		
			

	}

}
