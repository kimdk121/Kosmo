package chapter04;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int dan;
		
		while ( true ) {
			
			System.out.println("단을 입력해주세요 : ");
			dan = sc.nextInt();
			
			if (dan == -9) {
				
				System.out.println( "~끝~ ");
				break;
			}
			for(int i = 0; i < 10; i++) {
				System.out.println( dan + " * " + i + " = " + i * dan );
			}
			dan = 0;
		}
				

	}

}
