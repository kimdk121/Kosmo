package chapter04;

import java.util.Scanner;

public class Ex05 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		System.out.println("숫자를 입력하세요.");
		int num = sc.nextInt();
		
		int i = 2; //나눌 대상
		boolean isPrime = true;
		
		while(i<=num) {
			isPrime = true;
			
			for(int n = 2; n < i; n++) {
				
				if(i % n == 0) {
					isPrime = false;
				}
				continue;
			}
			if(isPrime == true) {
				System.out.println(i);
			}
			i++;
		}
		System.out.println("");
	}
}