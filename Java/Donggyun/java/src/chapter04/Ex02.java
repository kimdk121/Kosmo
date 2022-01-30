package chapter04;

import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int dan;
		int i = 1;
		
		System.out.println("단을 입력해주세요: ");
		dan = sc.nextInt();
		
		while (i <= 9) {
			System.out.println( dan + " * " + i + " = " + i * dan );
			i++;
		}

	}

}
