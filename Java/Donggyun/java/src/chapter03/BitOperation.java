package chapter03;

public class BitOperation {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int num1 = 5; //0101
		int num2 = 10; //1010
		
		int result = num1 & num2; //0000
		System.out.println("num1 & num2 = " + result);
		
		result = num1 | num2; //0000
		System.out.println("num1 | num2 = " + result);
		
		result = num1 ^ num2; //0000
		System.out.println("num1 ^ num2 = " + result);
		
		
		//논리 연산자와 비트 논리 연산자 차이
		boolean t = (num1 >= num2 ) && ( num1 <= num2 );
	//	t = ( num1 & num2 ) && ( num1 ^ num2 );
		
		t = ( 5 > 10 ) & ( 10 < 20 ); // false & true : 비트연산
		System.out.println(t);
		
		t = ( 5 < 10 ) & ( 10 < 20 ); // true & true : 비트연산
		System.out.println(t);
		

	}

}
