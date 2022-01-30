package chapter04;

import java.util.Scanner;

public class ifPT {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner scanner = new Scanner(System.in);
		
		String a = scanner.nextLine();
		
		int num = Integer.parseInt(a);
		
		if ( num > 0 ) {
			System.out.println("양수");
		}
		else if ( num < 0) {
			System.out.println("음수");
		}
		else {
			System.out.println("0");
		}

	}

}
