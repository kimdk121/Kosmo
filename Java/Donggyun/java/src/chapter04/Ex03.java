package chapter04;

import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int dan;
		
		System.out.println("단을 입력해주세요: ");
		dan = sc.nextInt();
		
		for ( int i = 1; i < 10; i++ ) {
			System.out.println( dan + " * " + i + " = " + i * dan );
		}

	}

}
