package chapter04;

import java.util.Scanner;

public class InputIfEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("양수를 입력하세요");
		
		String a = scanner.nextLine();
		
		int num1 = Integer.parseInt(a);
		
		
		
		if ( (num1 < 0) | (num1 == 0 ) ) {
			
			System.out.println("양수를 입력하세요!");
		}
		else {
			
			System.out.println(num1);
		}

	}

}
