package chapter06;


public class PrimeMain {

	public static void main(String[] args) {
		
		Prime p1 = new Prime();
		p1.setNumber(50);
		p1.primeNumber();
		p1.print();

		Prime p2 = new Prime(100);
		p2.primeNumber();
		p2.print();
	}

}
