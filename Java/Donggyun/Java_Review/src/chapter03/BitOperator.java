package chapter03;

public class BitOperator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 비트 논리 연산자
		// 값의 각각의 비트에 대해서 &, |, ^, ~
		
		// & 연산
		int num1 = 5;
		int num2 = 10;
		System.out.println( "5 : " + Integer.toBinaryString(num1));
		System.out.println( "10 : " + Integer.toBinaryString(num2));
		System.out.println( "5 & 10 : " + Integer.toBinaryString(num1 & num2));
		
		System.out.println( "5 | 10 : " + Integer.toBinaryString(num1 | num2));
		System.out.println( "5 ^ 10 : " + Integer.toBinaryString(num1 ^ num2));
		
		num1 = 6;
		num2 = 10;
		System.out.println( "6 & 10 : " + Integer.toBinaryString(num1 & num2));
		System.out.println( "6 | 10 : " + Integer.toBinaryString(num1 | num2));
		System.out.println( "6 ^ 10 : " + Integer.toBinaryString(num1 ^ num2));
		
		// 비트 이동 :
		// 객체 << 이동회수, 객체 >>
		System.out.println( "6 << 2 : " + Integer.toBinaryString(6 << 2));
		System.out.println( "6 >> 2 : " + Integer.toBinaryString(6 >> 2));
		
		num2 = 0B00000101; //5
		System.out.println( "5 << 2 : " + Integer.toBinaryString(num2 << 2));
		System.out.println( "5 >> 2 : " + Integer.toBinaryString(num2 >> 2));
		System.out.println( "5 >>> 2 : " + Integer.toBinaryString(num2 >>> 2));
		
		
		
		// 논리 연산 num1 && num2; // 참 거짓 : true, false
		
		
		// 논리비트 복합 : &=, |=, ^=
		num1 = 100;
		System.out.println( "+= : " + (num1 += 2));
		System.out.println( "+= : " + (num1));

		System.out.println( "-= : " + (num1 -= 2));
		System.out.println( "+= : " + (num1 *= 2));
		
		
	}

}
